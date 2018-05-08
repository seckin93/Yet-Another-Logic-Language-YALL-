%{
#include <stdlib.h>
#include <stdio.h>
%}
%%



"=="		{printf("EQUALS ");}
"^^"		{printf("XOR ");}
"||"		{printf("OR ");}
"&&"		{printf("AND ");}
"!="		{printf("NEQUALS ");}
"!"		{printf("NOT ");}
"while"		{printf("WHILE ");}
"if"		{printf("IF ");}
"else"		{printf("ELSE ");}
"print"		{printf("PRINT ");}
"input"		{printf("INPUT ");}
"("		{printf("OP ");}
")"		{printf("CP ");}
"{"		{printf("OB ");}
"}"		{printf("CB ");}
"TRUE"		{printf("TRUE ");}
"True"		{printf("TRUE ");}
"true"		{printf("TRUE ");}
"1"		{printf("TRUE ");}
"FALSE"		{printf("FALSE ");}
"False"		{printf("FALSE ");}
"false"		{printf("FALSE ");}
"0"		{printf("FALSE ");}
"x"		{printf("DONT_CARE ");}
"dontCare"	{printf("DONT_CARE ");}
"=>"		{printf("IMPLIES ");}
"<=>"		{printf("IFF ");}
"="		{printf("ASSIGN ");}
"const"		{printf("CONST ");}
"//"		{printf("COMMENT ");}

[a-zA-Z0-9]+	{printf("ID ");}
"\n"		{printf("NEWLINE\n(yall):");}

[ \t]+        ;       /* ignore whitespace */

.		{printf("unknown character");}

%%

int main(int argc, char *argv[])
{
	printf("(yall):");
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	printf("Good Bye!\n");
}
