%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
int yyparse();
%}
%option yylineno

SPACE [ \t]+
ASSIGN =
PLUS \+
IMPLIES ->
IFF <->
NOT !
LPARAM \(
RPARAM \)
LBRACE \{
RBRACE \}
LBRACKET \[
RBRACKET \]
TRUE true|True|TRUE|1
FALSE false|FALSE|False|0
DIGIT [0-9]
LETTER [a-zA-Z]
NEWLINE \n
NONSTAR [^\*]
NONSTARNONDIV [^\*/]
NONNEWLINE [^\n]
UNDERSCORE _
STRING \"([^\\\"]|\\\\|\\\"|\\t|\\n)*\"
ID ({LETTER}|{UNDERSCORE})({LETTER}|{DIGIT}|{UNDERSCORE})*
ENDSTMT ;
COMMENT {NONNEWLINE}*{NEWLINE}|\*({NONSTAR}|\*+{NONSTARNONDIV})*\*
AND &&
OR \|\|
XOR ^^

%%
{IMPLIES} return IMPLIES;
{IFF} return IFF;
{AND} return AND;
{OR} return OR;
{SPACE} ;
{COMMENT} ;
{NEWLINE} ;
{ENDSTMT} return ENDSTMT;
{ASSIGN} return ASSIGN;
{NOT} return NOT;
{LBRACE} return LBRACE;
{RBRACE} return RBRACE;
{LPARAM} return LPARAM;
{RPARAM} return RPARAM;
{LBRACKET} return LBRACKET;
{RBRACKET} return RBRACKET;
{STRING} return STRING;
{TRUE} return TRUE;
{FALSE} return FALSE;
{ID} return ID;
{XOR} return XOR;


%%
extern int yywrap()
{
	return 1;
}
