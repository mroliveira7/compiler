%{
	#include <math.h>
%}

    int line_number = 1;


NUMBER 		[0-9]
ID 			[a-z][a-z0-9]*
KEYWORD		and|break|do|else|elseif|end|false|for|function|if|in|local|nil|not|or|repeat|return|then|true|until|while

%%

{NUMBER}+{ID}					{
									printf("Error: Invalid Identifier!\n");
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

[ \t\n]+
.								{
									printf("Unknown symbol\n");
								}
%%