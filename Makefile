all:
	flex scanner.l
	gcc lex.yy.c -lfl -o scanner
