all: 
	flex scan.l 
	gcc lex.yy.c -ll
	gcc myscanner.c lex.yy.c -o myscanner
	rm a.out
