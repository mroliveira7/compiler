#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/*
{NUMBER}+{ID}					1
NUMBER+							2
{CONST_STR}						3
{NUMBER}+"."{NUMBER}+			4
{KEYWORD}						5
{ID}							6
=								7
==								8
<=								9
>=								10
>								11
<								12
+|-|*|/|%|^						13
\n								14
(								15
)								16
{								17
}								18
[								19
]								20
;								21
:								22
,								23
[ \t\n]+						24
.								25 	*/

extern int yylex();
extern int yylineno;
extern char *yytext;

int main(){

	int ntoken, vtoken;
	ntoken = yylex();
	while(ntoken){
		printf("LINE: %d TOKEN: %s TYPE: %d\n", yylineno, yytext, ntoken);
		ntoken = yylex();
	}

	return 0;
}

