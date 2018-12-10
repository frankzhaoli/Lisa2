%{
#include <iostream>
#include "lisa2.tab.h"
void yyerror(char const *s);
int yylex();
int linenum=1;

using namespace std;
%}


%%
"\n"        {linenum++; return NEWLINE;}
"print"     {return PRINT;}




"+"|"-"|"*"|"/"|"="    {return yytext[0];}
"("|")"|"["|"]"|\"     {return yytext[0];}
";"                    {return yytext[0];}

[\".*\"]                {return STRING;}

[ \t]       {;}
.           {ECHO; yyerror("Unexpected character.");}
#.*"\n"     {linenum++;}

%%
int yywrap(void)
{
  exit(0);
}
