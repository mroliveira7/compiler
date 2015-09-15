#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>

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

typedef struct token{
	char *valor;
	int classe;
	int linha;
	struct token *prox;
}Token, *pToken;

void inicializa_token(pToken *l);
void insere_token(pToken *l, char *token, int classe_token, int linha_token);
void imprime_lista(pToken l);


int main(){
	int ntoken, vtoken;
	pToken p;

	inicializa_token(&p);
	ntoken = yylex();
	while(ntoken){
		//printf("LINE: %d TOKEN: %s TYPE: %d\n", yylineno, yytext, ntoken);
		insere_token(&p,yytext,ntoken,yylineno);
		ntoken = yylex();
	}
	imprime_lista(p);

	return 0;
}

void inicializa_token(pToken *l){
	*l = NULL;
}

void insere_token(pToken *l, char *token, int classe_token, int linha_token){
	pToken p, q;
	
	p = (Token *)malloc(sizeof(Token));
	p->valor = (char *)malloc(sizeof(char)*strlen(token));
	if(classe_token == 3){
		strcpy(p->valor,(token)+1);
		p->valor[strlen(token)-2] = '\0';
	}else
		strcpy(p->valor,token);
	p->classe = classe_token;
	p->linha = linha_token;
	if(*l == NULL){
		*l = p;
		return;
	}
	for(q = *l; (q && (q->prox != NULL)); q = q->prox);
	q->prox = p;
	p->prox = NULL;

}

void imprime_lista(pToken l){
	pToken p;

	for(p = l; (p); p = p->prox){
		printf("TOKEN: %s\n", p->valor);
		printf("CLASSE: %d\n", p->classe);
		printf("LINHA: %d\n\n", p->linha);
	}
}
