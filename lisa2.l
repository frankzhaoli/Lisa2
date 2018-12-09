%{
#include "lisa2.tab.h"
void yyerror(char const *s);
int yylex();
int linenum=1;


%}


%%
"\n"        {linenum++; return NEWLINE;}
"print"     {return PRINT;}




.           {ECHO; yyerror("Unexpected character.");}
#.*"\n"     {linenum++;}

%%


int yywrap(void)
{
  exit(0);
}
