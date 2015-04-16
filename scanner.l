/*to return the name to 'lex.yy.c' without a header file, just remove/comment the line below*/
%option   outfile="tmp/scanner.c" header-file="tmp/scanner.h"

%{
	#include <stdio.h>
	#include <math.h>
%}

    int line_number = 1;
    int scan_error = 0;


NUMBER 		[0-9]
STRING_L_AD		"\"".*"\""
ID 			[a-zA-Z][a-zA-Z0-9]*
KEYWORD		and|break|do|else|elseif|end|false|for|function|if|in|local|nil|not|or|repeat|return|then|true|until|while

%%

{NUMBER}+{ID}					{
									printf("[Line %d] Error - Invalid Identifier: %s\n", line_number, yytext);
									scan_error = 1;
								}
{NUMBER}+						{
									/*printf("[line %d] Integer: %s\n", line_number, yytext);*/
  								}
{NUMBER}+"."{NUMBER}+ 			{
									/*printf("Float\n");*/
					  			}
{KEYWORD}						{
									/*printf("Keyword\n");*/
								}
{ID} 							{
									/*printf("Identifier\n");*/
								}
{STRING_L_AD}					{
									/*printf("Constant string\n");*/
								}
"+"|"-"|"*"|"/"|"%"|"^"			{
									/*printf("Operator\n");*/
								}
"=="							{
									/*printf("Comparison token\n");*/
								}
"~="							{
									/*printf("Comparacao aproximada\n");*/
								}
"<="							{
									/*printf("minor_equal token\n");*/
								}
">="							{
									/*printf("greater_equal token\n");*/
								}
"<"								{
									/*printf("minor token\n");*/
								}
">"								{
									/*printf("greater token\n");*/
								}
"="								{
									/*printf("Atribution\n");*/
								}
"("								{
									/*printf("open_par token\n");*/
								}
")"								{
									/*printf("close_par token\n");*/
								}
"{"								{
									/*printf("chave_aberta token\n");*/
								}
"}"								{
									/*printf("chave_fechada token\n");*/
								}
"["								{
									/*printf("colchete_aberto\n");*/
								}
"]"								{
									/*printf("colchete_fechado\n");*/
								}
";"								{
									/*printf("comma_point token\n");*/
								}
":"								{
									/*printf("two_points token\n");*/
								}
","								{
									/*printf("comma token\n");*/
								}
"\n"							{
									line_number++;
								}
[ \t\n]+
.								{
									printf("[Line %d] Error - Unknown symbol: %s\n",line_number, yytext);
									scan_error = 1;
								}
%%
