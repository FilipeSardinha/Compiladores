%{
/* $Id: interm.y,v 1.10 2013/03/20 $ */
/* (Factorial with functions included as instructions) */
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include "node.h"
#include "tabid.h"

int x, ciclo = 0, bloco =0;
int calculartipo(int info);

extern void yyerror(char *s);
extern void program(int enter, Node *body), declare(char *name, int value);
extern void function(char *name, int enter, Node *body);

int pos; /* local variable offset (no functions inside a function) */
int lbl; /* label counter for generated labels */

char *mklbl(int n); /* generate counter based label */ 
static int arg; /* function argument counter (no call within call) */
static Node *mkvar(char *name); /* global vs local access */
%}

%union {
	int i;			/* integer value */
	char *s;		/* symbol name or string literal */
	double d;		/* double value */
	Node *n;		/* node pointer*/
};

%token <i> INTEGER 
%token <d> NUMBER
%token <s> STRING ID
%token INT STR NUM 
%token VOID PUBLIC CONST IF THEN WHILE DO FOR IN STEP UP DOWN BREAK CONTINUE BARRAN
%token VAZIO PROG DECLS FUNC ISID PARAM PARAMCORP VIRGPARAM PARAMS PARAMS0 CORPO0 CORPO PARAMS3 INSTRS IIFTHEN IDO IEXPR ICORPO IBREAK ICONTINUE ICARDINAL IFTHEN IFTHENELSE EID EXPRSSS EXPRSS EXPRSSS0 LVID LV LABEL JMP JZ JNZ ETIQ CALL LOCAL
%nonassoc IFX
%nonassoc ELSE

%right IS
%left OR
%left AND
%nonassoc NOT
%left EQUAL DIFF
%left GREATER LESS GE LE
%left ADD SUBT
%left PRODUCT DIV MOD
%nonassoc POINTER LOC FACT SIM INC DEC
%nonassoc '(' ')' '[' ']'

%type <n> decls const0 pub0 aster0 corpo0 corpo instrs instr ifthen upordown stepe0 int0 express lv expresss0 expresss
%type <i> params tipo params3 

%token
%%
file	: decls											{Node *n = uniNode(PROG,$1);
												printNode(n,0,yynames);
												yyselect(n);
												}
     	;

decls	: decls pub0 const0 tipo aster0 ID ';'	{ declare($6,0); }
						
	| decls pub0 const0 tipo aster0 ID IS INTEGER ';' { declare ($6, $8); }					
													
	| decls pub0 const0 tipo aster0 ID IS const0 STRING ';'{ /*declare ($6,$9);*/ }					

	| decls pub0 const0 tipo aster0 ID IS NUMBER ';'{ /*declare ($6,$9);*/ }				

	| decls pub0 const0 tipo aster0 ID IS ID ';' { /*declare ($6,$8);*/ }

	| decls pub0 const0 tipo aster0 ID '(' {IDnew(FUNC, $6, 0); IDpush();} 
				params ')' {IDreplace(FUNC, $6, (long)$8);} 
				corpo0 ';' {IDpop(); function($6, -pos, $8); pos = 0;}

	| decls pub0 const0 tipo aster0 ID '(' ')' {IDnew(FUNC, $6, 0);} 
				corpo0 ';' {function($6, -pos, $9); pos = 0;}					
	;

tipo	: STR											{$$ = 2;}
	| INT											{$$ = 1;}
	| NUM											{$$ = 3;}
	| VOID											{$$ = 0;}
	;
pub0	: PUBLIC										{$$ = nilNode(PUBLIC); $$->info = 8;}
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

aster0	: PRODUCT										{$$ = nilNode(POINTER); $$->info = 4;}
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

const0	: CONST											{$$ = nilNode(CONST); $$->info = 16;}
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

params	: params ',' tipo aster0 ID		{$$ = $1+1; IDnew($3, $5, 4 + 4 * $$);}	
	| tipo aster0 ID			{$$ = 1; IDnew($1, $3, 8);}						
	;

params3	: params3 tipo aster0 ID ';'		{$$ = $1+1; IDnew($2, $4, 4 + 4 * $$);}							
	| tipo aster0 ID ';'			{$$ = 1; IDnew($1, $3, 8);}
	;

corpo0	: corpo											{$$ = $1;}
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

corpo	: '{' {if (bloco>0) IDpush(); 
		else bloco++;} 
		params3 instrs 
		{if (bloco>0) {IDpush(); bloco--;}}
		'}'										{$$ = uniNode(CORPO, $4);}
	| '{' {if (bloco>0) IDpush(); 
		else bloco++;} 
		instrs 										
		{if (bloco>0) {IDpush(); bloco--;}}
		'}'										{$$ = uniNode(CORPO, $3);}
	;

instrs	: instrs instr										{$$ = binNode(INSTRS, $1, $2);} 
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

instr   : ifthen										{$$ = $1;}
	| DO { ciclo++; } instr { ciclo--; } WHILE express ';'					{int lbl1 = ++lbl, lbl2 = ++lbl; 
												$$ = seqNode(IDO, 5, 
												strNode(JMP, mklbl(lbl1)), 
												strNode(LABEL, mklbl(lbl2)), $2, 
												strNode(LABEL, mklbl(lbl1)), 
												binNode(JNZ, $4, 
												strNode(ETIQ, mklbl(lbl2))));
												}
	| FOR lv IN express upordown express stepe0 DO  { ciclo++; } instr { ciclo--; 		$$ = nilNode(FOR);/*!!!!!!!!!!!*/ 
												}
	| express ';' 										{$$ = $1;}
	| corpo 										{$$ = $1;}
	| BREAK int0 ';'									{/*IBREAK !!!!!!!!!!!*/ 
						if (!($2->value.i>=1 && $2->value.i<=ciclo))
							yyerror("Break without cicle.");}
	| CONTINUE int0 ';'									{$$ = uniNode(ICONTINUE,$2); /*!!!!!!!!*/
						if (!($2->value.i>=1 && $2->value.i<=ciclo))
							yyerror("Continue without cicle.");}
	| lv '#' express ';'									{$$ = binNode(ICARDINAL, $1, $3);}
	;

ifthen	: IF express THEN instr %prec IFX							{int lbl1 = ++lbl; 
												$$ = seqNode(IFTHEN, 3, 
												binNode(JZ,$2, 
												strNode(ETIQ, mklbl(lbl1))), 
												$4, strNode(LABEL, mklbl(lbl1)));}	
	| IF express THEN instr ELSE instr							{int lbl1 = ++lbl, lbl2=++lbl; 
												$$ = seqNode(IFTHEN, 6, 
												binNode(JZ,$2, 
												strNode(ETIQ, mklbl(lbl1))), 
												$4, strNode(JMP, mklbl(lbl2)), 
												strNode(LABEL, mklbl(lbl1)), $6, 
												strNode(LABEL, mklbl(lbl2)));}
	;


upordown: UP											{$$ = nilNode(UP);}			
	| DOWN											{$$ = nilNode(DOWN);}
	;

stepe0	: STEP express										{$$ = uniNode(STEP, $2);}
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

int0 	: INTEGER										{$$ = intNode(1, $1); $$->info = 1;}
	| /* retorna 1 */									{$$ = intNode(1,1); $$->info = 1;}
	;  

express	: express SUBT express									{$$ = binNode(SUBT, $1, $3);
			if ((calculartipo($1->info) == 2)||(calculartipo($3->info) == 2))
				yyerror("Subtraction of Strings\n");
			if ((calculartipo($1->info) == 3)||(calculartipo($3->info) == 3))	/*if real*/
												$$->info = 3;
			else									/*else */
												$$->info = 1;
			}
	| SUBT express   %prec SIM		{
						if (calculartipo($2->info) == 2)
							yyerror("Simetric of a String\n");
												$$ = uniNode(SIM, $2);
												$$->info = $2->info;
						 
						}
	| express ADD express									{$$ = binNode(ADD, $1, $3);
			if ((calculartipo($1->info) == 2)||(calculartipo($3->info) == 2))
				yyerror("Sum of Strings\n");
			if ((calculartipo($1->info) == 3)||(calculartipo($3->info) == 3)) 	/*if real*/
												$$->info = 3;
			else									/*else*/
												$$->info = 1;
			}
	| express PRODUCT express								{$$ = binNode(PRODUCT, $1, $3);
			if ((calculartipo($1->info) == 2)||(calculartipo($3->info) == 2))
				yyerror("Product of Strings\n");
			if ((calculartipo($1->info) == 3)||(calculartipo($3->info) == 3))	/*if real*/
												$$->info = 3;
			else									/*else*/
												$$->info = 1;
			 
			}
	| express DIV express									{$$ = binNode(DIV, $1, $3);
			if ((calculartipo($1->info) == 2)||(calculartipo($3->info) == 2))
				yyerror("Division of Strings\n");
			if ((calculartipo($1->info) == 3)||(calculartipo($3->info) == 3))
												$$->info = 3;
			else
												$$->info = 1;
			 
			}
	| express MOD express									{$$ = binNode(MOD, $1, $3); 
												$$->info = 1; 
			 
			if ((calculartipo($1->info) == 2)||(calculartipo($3->info) == 2))
				yyerror("Mod of Strings\n");
			}
	| express EQUAL express									{$$ = binNode(EQUAL, $1, $3);  
												$$->info = 1; 		
		}
	| express LESS express									{$$ = binNode(LESS, $1, $3);  
												$$->info = 1; 
		}
	| express GREATER express								{$$ = binNode(GREATER, $1, $3);  
												$$->info = 1;
		}
	| express GE express									{$$ = binNode(GE, $1, $3);  
												$$->info = 1;
		}
	| express LE express									{$$ = binNode(LE, $1, $3);  
												$$->info = 1; 

		}
	| express DIFF express									{$$ = binNode(DIFF, $1, $3);  
												$$->info = 1; 
		}
	| INC lv										{$$ = uniNode(INC, $2);  
												$$->info = 1;  
		if (calculartipo($2->info) != 1) 
			yyerror("Increment of a non integer value\n");}
	| DEC lv										{$$ = uniNode(DEC, $2);  
												$$->info = 1; 
		if (calculartipo($2->info) != 1) 
			yyerror("Decrement of a non integer value\n");}
	| NOT express										{$$ = uniNode(NOT, $2);  
												$$->info = 1;
		if (calculartipo($2->info) != 1) 
			yyerror("Logic NOT of a non integer value\n");}
	| express AND express									{$$ = binNode(AND, $1, $3); 
												$$->info = 1; 
		if ((calculartipo($1->info) != 1)||(calculartipo($3->info) != 1))
			yyerror("Logic AND of a non integer value\n");
		}
	| express OR express									{$$ = binNode(OR, $1, $3);  
												$$->info = 1; 
		if ((calculartipo($1->info) != 1)||(calculartipo($3->info) != 1))
			yyerror("Logic AND of a non integer value\n");}
	| AND lv		%prec LOC							{$$ = uniNode(LOC, $2); 
												$$->info = $2->info; 
		 }
	| INTEGER										{$$ = intNode(INTEGER, $1); 
												$$->info=1; }
	| STRING										{$$ = strNode(STRING, $1); 
												$$->info=2; }
	| NUMBER										{$$ = realNode(NUMBER, $1); 
												$$->info=3; }
	| '(' express ')'									{$$ = $2; 
												$$->info = $2->info;}
	| PRODUCT express	%prec POINTER							{$$ = uniNode(POINTER, $2); 
												$$->info = 4+$2->info;}
	| lv INC										{$$ = uniNode(INC, $1);
		if (calculartipo($1->info) != 1) 
			yyerror("Increment of a non integer value\n");
												$$->info = $1->info; 
		 }
	| lv DEC										{$$ = uniNode(DEC, $1);
		if (calculartipo($1->info) != 1) 
			yyerror("Decrement of a non integer value\n");
												$$->info = $1->info; 
		 }
	| ID IS express										{assign($1);
												$$ = binNode(IS, mkvar($1), $3);
												}
	| ID '[' express ']' IS express								{assign($1);
												$$ = binNode(IS, mkvar($1), $3);
												}
	| lv											{$$ = $1; 
												$$->info = $1->info; 
		 }
	| express FACT										{$$ = uniNode(FACT, $1);
		if (calculartipo($1->info) != 1) 
		yyerror("Factorial of a non integer value\n");}
	| ID '(' expresss0 ')'									{ $$ = binNode(CALL, 
												strNode(ID, $1), $3);
												}
	;
	
expresss: expresss ',' express									{$$ = binNode(EXPRSSS, $3, $1); arg++;}
	  | express										{$$ = $1; arg = 1;}
	  ;

expresss0: expresss 										{$$ = $1;}
	  | /* REGRA VAZIA*/									{$$ = nilNode(VAZIO);}
	  ;

lv	: ID											{$$ = mkvar($1);
												$$->info = IDfind($1,0);
												}
	| ID '[' express ']'									{$$ = binNode(LVID, strNode(ID, $1), $3); 
												$$->info = IDfind($1,0);
												/*???????????*/}	
	;

%%
static void assign(char *name) {
  if (IDfind(name, (long*)IDtest) < 0)
    IDnew(INTEGER, name, pos -= 4);
}

static Node *mkvar(char *name) {
  long loc;
  int typ = IDfind(name, &loc); /* find type and offset of the variable */
  if (typ < 32 && loc != 0) /* global variables have offset==0 */
    return intNode(LOCAL, loc); /* local variables are accessed by offset */
  return strNode(ID, name); /* global variables are accessed by name */
}

char *mklbl(int n) {
  static char buf[20];
  sprintf(buf, "_i%d", n);
  return strdup(buf);
}

char **yynames =
#if YYDEBUG > 0
		 (char**)yyname;
#else
		 0;
#endif

int calculartipo(int info) {
	if (info > 32)
		info = info -32;
	if (info > 16)
		info = info -16;
	if (info > 8)
		info = info -8;
	if (info > 4)
		info = info -4;
	return info;
} 
