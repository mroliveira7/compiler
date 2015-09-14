%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <math.h>

%}

	int line_number = 1;
	int scan_error = 0;

NUMBER 		[0-9]
KEYWORD		and|break|do|else|elseif|end|false|for|function|if|in|local|nil|not|or|repeat|return|then|true|until|while
ID 			[a-zA-Z][_a-zA-Z0-9]*
CONST_STR 	"\"".*"\""

%%
{NUMBER}+{ID}			{	scan_error = 1;
							return 1; 
						}
{NUMBER}+					return 2;
{CONST_STR}					return 3;
{NUMBER}+"."{NUMBER}+ 		return 4;
{KEYWORD}					return 5;
{ID}						return 6;
"="							return 7;	
"=="						return 8;
"<="						return 9;
">="						return 10;
">"							return 11;						
"<"							return 12;		
"+"|"-"|"*"|"/"|"%"|"^"		return 13;
"\n"						yylineno++;
"("							return 15;
")"							return 16;
"{"							return 17;
"}"							return 18;
"["							return 19;
"]"							return 20;
";"							return 21;
":"							return 22;
","							return 23;
[\t\n]+						return 24;
[ ]+						;
.						{	return 25;
							scan_error = 1;
						}
%%

int yywrap(void){
	return 1;
}