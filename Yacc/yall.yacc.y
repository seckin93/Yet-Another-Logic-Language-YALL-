%token SPACE
%token ASSIGN
%token IMPLIES
%token IFF
%token NOT
%token LPARAM
%token RPARAM
%token LBRACE
%token RBRACE
%token LBRACKET
%token RBRACKET
%token DIGIT
%token LETTER
%token NEWLINE
%token UNDERSCORE
%token STRING
%token TRUE
%token FALSE
%token ID
%token ENDSTMT
%token COMMENT
%token AND
%token OR
%token XOR

%start program
%{
	#define SIZE 120
	#include <stdlib.h>
	#include <stdio.h>
	int numoferr;
	extern int yylex();
	void yyerror(char *s);
	extern char yytext();
	extern int yylineno;
	extern FILE *yyin;
/*char *stack[STACK_SIZE];
int IDIndex(char *name);
int changeID(char *name, int truth);*/
%}

%%
program: NEWLINE
	| instrs
	;
instrs: instr		{printf("i");}
	| instr instrs
	;
instr: assignment
	| operation
	;
expo: LPARAM ASSIGN RPARAM
	|LPARAM ASSIGN operation ASSIGN RPARAM
	;
assignment: ID ASSIGN boolean
	| expo
	;
operation: ID AND boolean
	| ID OR boolean
	| ID XOR boolean
	;
stmts: stmt
	| stmts stmt
	| STRING stmt AND STRING stmt
	;
stmt: 	expo
	|boolean		
	;
boolean: TRUE
	|FALSE
	;
dor:	NEWLINE
	| dor IMPLIES LPARAM ID OR RPARAM
	;
dand:	NEWLINE
	| dor IMPLIES LPARAM ID AND RPARAM
	;
dxor:	NEWLINE
	| dor IMPLIES LPARAM ID XOR RPARAM
	;

%%
// report errors
void yyerror(char *s) 
{
    numoferr++;
    printf("error at line %i : %s\n", (int)yylineno,s);
}
int main(int argc, char **argv)
{
	yylineno = 1;	
	yyin = fopen(argv[1], "r");
	numoferr=0;
	return yyparse();
	if(numoferr>0) {
		printf("Parsing completed with %i errors\n", numoferr);
	} else {
		printf("succesfull\n");
	}
	fclose(yyin);
	
}
