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
extern void program(int enter, Node *body), declare(char *name, Node * node, int type);
extern void function(char *name, int enter, Node *body);

int pos; /* local variable offset (no functions inside a function) */
int lbl; /* label counter for generated labels */
char* b[15]; 
int bmax = -1; /* vector of labels to break and respective index*/
char* c[15]; 
int cmax = -1; /* vector of labels to continue and respective index*/

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
%token RETURN VAZIO FUNC CORPO INSTRS EXPRSSS INDEX LV LABEL JMP JZ JNZ ETIQ CALL LOCAL
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

%type <n> decls  corpo0 corpo instrs instr ifthen express lv expresss0 expresss stepe0
%type <i> params tipo params3 const0 pub0 aster0 int0

%token
%%
file	: decls					{;}
     	;

decls	: decls pub0 const0 tipo aster0 ID ';'	{ int x = $2+$3+$4+$5; declare($6,0, x); }
						
	| decls pub0 const0 tipo aster0 ID IS INTEGER ';' {int x = $2+$3+$4+$5; declare ($6, intNode(1,$8), x); }					
													
	| decls pub0 const0 tipo aster0 ID IS const0 STRING ';'{int x = $2+$3+$4+$5; declare ($6, strNode(2,$9),x); }					

	| decls pub0 const0 tipo aster0 ID IS NUMBER ';'{int x = $2+$3+$4+$5; declare ($6, realNode(3,$8),x); }				

	| decls pub0 const0 tipo aster0 ID IS ID ';' {int x = $2+$3+$4+$5; declare ($6, strNode(2,$8), x); }

	| decls pub0 const0 tipo aster0 ID '(' {
					if (IDfind($6, (long*)IDtest) == -1) {
						IDnew(FUNC, $6, 0); IDpush(); 
						IDnew(x, $6, 0);  }
					} 
				params ')' {IDreplace(FUNC, $6, (long)$8);} 
				corpo0 ';' {IDpop(); function($6, -pos, $12); pos = 0;}

	| decls pub0 const0 tipo aster0 ID '(' ')' 
					{if (IDfind($6, (long*)IDtest) == -1) {
						IDnew(FUNC, $6, 0); IDpush(); 
						IDnew(x, $6, 0);  }
					} 
				corpo0 ';' {function($6, -pos, $10); pos = 0;}
	| /*vazio*/		{;}
	;

tipo	: STR											{$$ = 2;}
	| INT											{$$ = 1;}
	| NUM											{$$ = 3;}
	| VOID											{$$ = 0;}
	;
pub0	: PUBLIC										{$$ = 8;}
	| /* VAZIA */										{$$ = 0;}
	;

aster0	: PRODUCT										{$$ = 4;}
	| /* VAZIA */										{$$ = 0;}
	;

const0	: CONST											{$$ = 16;}
	| /* VAZIA */										{$$ = 0;}
	;

params	: params ',' tipo aster0 ID		{$$ = $1+1; IDnew($3, $5, 4 + 4 * $$);}	
	| tipo aster0 ID			{$$ = 1; IDnew($1, $3, 8);}						
	;

params3	: params3 tipo aster0 ID ';'		{$$ = $1+1; IDnew($2, $4, 4 + 4 * $$);}							
	| tipo aster0 ID ';'			{$$ = 1; IDnew($1, $3, 8);}
	;

corpo0	: corpo											{$$ = $1; $$->info = 1;}
	| /* VAZIA */										{$$ = nilNode(VAZIO); $$->info = 0;}
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
		'}'										{$$ = binNode(INSTRS,$3, nilNode(VAZIO));}
	;

instrs	: instrs instr										{$$ = binNode(INSTRS, $1, $2);} 
	| /* VAZIA */										{$$ = nilNode(VAZIO);}
	;

instr   : ifthen										{$$ = $1;}
	| DO { ciclo++; 
			int lbl1 = ++lbl, lbl2 = ++lbl;
			bmax++;
			b[bmax] = mklbl(lbl2); 
			cmax++;
			c[cmax]	= mklbl(lbl1);  } instr { ciclo--; } WHILE express ';'					{
																			$$ = seqNode(INSTRS, 5, 
																			strNode(JMP, c[cmax]),
																			strNode(LABEL, b[bmax]),
																			$3,
																			strNode(LABEL, c[cmax]),   
																			binNode(JNZ, $6, strNode(ETIQ, b[bmax])));
																			
																			}
	| FOR lv IN express UP express stepe0 DO  
		{ ciclo++; 
			/*bmax++;
			b[bmax] = mklbl(lbl2); 
			cmax++;
			c[cmax]	= mklbl(lbl1);*/ } 
			instr { ciclo--; } 					{int lbl1 = ++lbl, lbl2 = ++lbl, lbl3 = ++lbl;;
												$$ = seqNode(INSTRS, 6, 
												strNode(JMP, mklbl(lbl1)/*cond lbl para continue*/),
												strNode(LABEL, mklbl(lbl2)/*for*/),
												$10,
												strNode(LABEL, mklbl(lbl1)/*cond lbl para continue*/),
												binNode(JNZ, binNode(LESS, binNode(ADD, binNode(IS,$2,$4), $7), $6), strNode(ETIQ, mklbl(lbl2)/*for*/)),
												strNode(LABEL, mklbl(lbl3)/*lbl para break*/));}
																		
	| FOR lv IN express DOWN express stepe0 DO  
		{ ciclo++; 
			/*bmax++;
			b[bmax] = mklbl(lbl2); 
			cmax++;
			c[cmax]	= mklbl(lbl1);*/ } 
			instr { ciclo--; } 					{int lbl1 = ++lbl, lbl2 = ++lbl, lbl3 = ++lbl;;
												$$ = seqNode(INSTRS, 7, 
												binNode(IS,$2,$4),
												strNode(JMP, mklbl(lbl1)/*cond lbl para continue*/),
												strNode(LABEL, mklbl(lbl2)/*for*/),
												$10,
												binNode(SUBT,$2, $7),
												strNode(LABEL, mklbl(lbl1)/*cond lbl para continue*/),
												binNode(JNZ, binNode(GREATER, $2, $6), strNode(ETIQ, mklbl(lbl2)/*for*/)));
												printNode($$, stdout, yynames);}

	| express ';' 								{$$ = $1;}
	| corpo 									{$$ = $1;}
	| BREAK int0 ';'							{$$ = nilNode(VAZIO);/*$$ = seqNode(INSTRS, 1, uniNode(JMP, strNode(ETIQ, b[bmax-($2-1)])));*/}
	| CONTINUE int0 ';'							{$$ = nilNode(VAZIO);} 
	| lv '#' express ';'						{$$ = nilNode(VAZIO);}
	;

ifthen	: IF express THEN instr %prec IFX		{int lbl1 = ++lbl; 
												$$ = seqNode(INSTRS, 3, 
												binNode(JZ,$2, 
												strNode(ETIQ, mklbl(lbl1))), 
												$4, strNode(LABEL, mklbl(lbl1)));}	
	| IF express THEN instr ELSE instr							{int lbl1 = ++lbl, lbl2=++lbl; 
												$$ = seqNode(INSTRS, 6, 
												binNode(JZ,$2, 
												strNode(ETIQ, mklbl(lbl1))), 
												$4, strNode(JMP, mklbl(lbl2)), 
												strNode(LABEL, mklbl(lbl1)), $6, 
												strNode(LABEL, mklbl(lbl2)));}
	;


stepe0	: STEP express							{$$ =  uniNode(INSTRS,$2);}
	| /* VAZIA */								{$$ = intNode(INTEGER,1);}
	;

int0 	: INTEGER										{$$ = $1;}
	| /* retorna 1 */									{$$ = 1;}
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
	| AND lv		%prec LOC							{$$ = uniNode(INSTRS, $2);  /*ENDERECO*/
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
	| PRODUCT express	%prec POINTER			{$$ = uniNode(INSTRS, $2);  /*PONTEIRO*/
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
	| ID IS express								{if ((IDfind($1, (long*)IDtest) == FUNC) && (!(strcmp($1, "entry")))) {
														$$ = uniNode(RETURN, $3);
												}
												else {
													assign($1);
													$$ = binNode(IS, mkvar($1), $3);
													}
												}
	| ID '[' express ']' IS express				{assign($1);
												/*$$ = binNode(IS, binNode(INDEX, strNode(LOCAL, $1), $3), $3);*/ }
	| lv											{$$ = $1; 
												$$->info = $1->info; 
		 }
	| express FACT										{int lbl1 = ++lbl; 
														/*$$ = seqNode(INSTRS, 4,
														uniNode(JMP, strNode(LABEL, mklbl(lbl1))),
														strNode(LABEL, mklbl(lbl1)),
														binNode(IS,$1,binNode(PRODUCT, binNode(SUBT,$1,intNode(INTEGER,1)),$1)),
														binNode(JNZ, binNode(EQUAL, $1, intNode(INTEGER,1)), strNode(LABEL, mklbl(lbl1))));*/
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
	| ID '[' express ']'						{$$ = binNode(ADD, strNode(LOCAL, $1), $3); 
												$$->info = IDfind($1,0);
												}	
	;

%%
static void assign(char *name) {
  if (IDfind(name, (long*)IDtest) < 0)
    IDnew(INTEGER, name, pos -= 4);
}

static Node *mkvar(char *name) {
  long loc;
  int typ = IDfind(name, &loc); /* find type and offset of the variable */
  if (typ != FUNC && loc != 0) /* global variables have offset==0 */
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

