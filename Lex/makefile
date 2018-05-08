all:
	lex yall.l
	gcc -o run lex.yy.c -ll
start:
	./run inp
clean:
	rm lex.yy.c run
