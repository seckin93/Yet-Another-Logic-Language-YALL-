PROG   = yall

all1: lexer parser
	g++ y.tab.c lex.yy.c -o yall
	
lexer: yall.l
	lex yall.l

parser: yall.y
	yacc -d -v yall.y

test: input
	cat input | ./$(PROG)
