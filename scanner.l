%{
	#include <math.h>
%}

    int line_number = 1;
    int scan_error = 0;


NUMBER 		[0-9]
ID 			[a-z][a-z0-9]*
KEYWORD		and|break|do|else|elseif|end|false|for|function|if|in|local|nil|not|or|repeat|return|then|true|until|while
STRING		"\""[a-z0-0]+"\""

%%

{NUMBER}+{ID}					{
									printf("Error line %d: Invalid Identifier !\n",line_number);
								}
{NUMBER}+						{
									printf("Integer\n");
  								}
{NUMBER}+"."{NUMBER}+ 			{
									printf("Float\n");
					  			}
{KEYWORD}						{
									printf("Keyword\n");
								}
{ID} 							{
									printf("Identifier\n");
								}
"+"|"-"|"*"|"/"|"%"|"^"			{
									printf("Operator\n");
								}
"=="							{
									printf("Comparison token\n");
								}
"~="							{
									printf("Comparacao aproximada\n");
								}
"<="							{
									printf("minor_equal token\n");
								}
">="							{
									printf("greater_equal token\n");
								}
"<"								{
									printf("minor token\n");
								}
">"								{
									printf("greater token\n");
								}
"="								{
									printf("Atribution\n");
								}
"("								{
									printf("open_par token\n");
								}
")"								{
									printf("close_par token\n");
								}
"{"								{
									printf("chave_aberta token\n");
								}
"}"								{
									printf("chave_fechada token\n");
								}
"["								{
									printf("colchete_aberto\n");
								}
"]"								{
									printf("colchete_fechado\n");
								}
";"								{
									printf("comma_point token\n");
								}
":"								{
									printf("two_points token\n");
								}
","								{
									printf("comma token\n");
								}
"\n"							{
									line_number++;
								}
[ \t\n]+
.								{
									printf("Unknown symbol\n");
								}
%%