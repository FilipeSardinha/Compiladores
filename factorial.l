%{ 
/* $Id: factorial.l,v 1.0 2013/02/26 $ */
/* (Factorial with functions included as instructions) */
#include <stdlib.h> 
#include <string.h> 
#include <limits.h>
#include "node.h"
#include "y.tab.h" 
void yyerror(char *s);
int com_counter = 0, dentro = 0, ok = 0, move = 0, i = 0;
char* aux;
%} 

%x COM 
D [-]?[0-9]+
EXP [eE][+-]?{D}
%%

  
"void"			{ok = 1; return VOID;} 
"integer"		{ok = 1; return INT;}
"string"		{ok = 1; return STR;}
"public"		{ok = 1; return PUBLIC;} 
"number"		{ok = 1; return NUM;} 
"const"			{ok = 1; return CONST;} 
"if"			{ok = 1; return IF;} 	
"then"			{ok = 1; return THEN;} 
"else"			{ok = 1; return ELSE;} 
"while"			{ok = 1; return WHILE;} 
"do"			{ok = 1; return DO;} 
"for"			{ok = 1; return FOR;} 
"in"			{ok = 1; return IN;} 
"step"			{ok = 1; return STEP;} 
"upto"			{ok = 1; return UP;} 
"downto"		{ok = 1; return DOWN;} 
"break"			{ok = 1; return BREAK;} 
"continue"		{ok = 1; return CONTINUE;} 



"++"			{ok = 1; return INC;} 
"--"			{ok = 1; return DEC;} 
"-"			{ok = 1; return SUBT;} 
"+"			{ok = 1; return ADD;} 
"*"			{ok = 1; return PRODUCT;} 
"/"			{ok = 1; return DIV;} 
"%"			{ok = 1; return MOD;} 
"<"			{ok = 1; return LESS;} 
">"			{ok = 1; return GREATER;} 
"="			{ok = 1; return EQUAL;} 
">="			{ok = 1; return GE;} 
"<="			{ok = 1; return LE;} 
"<>"			{ok = 1; return DIFF;} 
":="			{ok = 1; return IS;} 
"!"			{ok = 0;return FACT;}  
"|"			{ok = 1; return OR;} 
"&"			{ok = 1; return AND;} 
"~"			{ok = 1; return NOT;} 

[\n]+			{if (ok==0) return ';';}

[A-Za-z][A-Za-z0-9_]*	{ yylval.s = strdup(yytext); ok = 0; return ID; }

"==".*			{ok = 1;} 
"=<" BEGIN COM; com_counter++;
<COM>"=<" com_counter++;
<COM>"=>" {if (dentro ==0) {if (--com_counter == 0) {ok =1; BEGIN INITIAL;}}}
<COM>"\"" 	{if (dentro == 0) dentro = 1; else dentro = 0;}
<COM>.|\n	; 
"=>"		{ok = 1; yyerror("closing comment without starting");}
<COM><<EOF>> 		if(com_counter != 0) yyerror("comments not closed"); return;

\"([^"]|\\|\\r|\\t)*\"		{ /*yytext[yyleng-1] = 0; yylval.s = strdup(yytext+1);*/
yytext[yyleng-1] = 0;
							move = 0;
							for(i = 0; i<yyleng; i++){
								yytext[i] = yytext[i+move];
								if(yytext[i] == '\\')
								{	if(yytext[i+1+move] == 't'){
										yytext[i] = '\t';
										move++;}
									else if(yytext[i+1+move] == 'r'){
										yytext[i] = '\r';
										move++;}
									else if(yytext[i+1+move] == 'n'){
										yytext[i] = '\n';
										move++;}
									else if(yytext[i+1+move] == '"'){
										yytext[i] = '\"';
										move++;}
									else if(yytext[i+1+move] == '\\'){
										yytext[i] = '\\';
										move++;}
									else if(isxdigit(yytext[i+1+move])){
										yytext[i] = strtol(&yytext[i+1+move],0,16);
										move++;}
									else{ yytext[i] = yytext[i+1+move];
										move++;}
								}
							}
							yytext[yyleng-1-move] = 0;
							yylval.s = strdup(yytext+1);
							 ok = 0; return STRING; }

0			{ yylval.i = strtol(yytext, 0, 10); ok = 0; return INTEGER; }
[1-9][0-9]* 		{ yylval.i = strtol(yytext, 0, 10); 
				if ((LONG_MIN == yylval.i || LONG_MAX == yylval.i) && ERANGE == errno) {
				    fprintf(stderr, "%s out of range of type long\n", yytext);
				} ok = 0; return INTEGER; }
0[0-9]+			{ yylval.i = octal(yytext); ok = 0; return INTEGER; }
0[bB][01]+ 		{ yylval.i = strtol(yytext, 0, 2); 
				if ((LONG_MIN == yylval.i || LONG_MAX == yylval.i) && ERANGE == errno) {
				    fprintf(stderr, "%s out of range of type long\n", yytext);
				} ok = 0; return INTEGER; }

{D}\.{D}({EXP})?	{ yylval.d = strtol(yytext, 0, 10); 
				if ((LONG_MIN == yylval.d || LONG_MAX == yylval.d) && ERANGE == errno) {
				    fprintf(stderr, "%s out of range of type long\n", yytext);
				} ok = 0; return NUMBER; }

[ \t\r]+		;

[)]			{ok = 0; return *yytext;}

[\#\[\]{}(,;]	{ok = 1; return *yytext;}
 
.			yyerror("Unknown character"); 
%% 
int yywrap(void) { return 1; } 
char *getyytext() { return yytext; }
int octal(char* octal) {
int i=0, value =0;
	while(octal[i]!='\0'){
		value = value*8 + octal[i] - '0';
		if (value < 0) 
			fprintf(stderr, "%d out of range of type octal\n", value);
		i++;	
	}
	return value;
}
