%{
#include <stdio.h>
#include <string>
#include <iostream>
#include <unordered_map>

void yyerror(char const *s);
int yylex();

using namespace std;

extern int linenum;


%}

%union {int num; char *id;}
%start program
%error-verbose

%token
NEWLINE
PRINT


;


%%

program : line   {;}
;

line : print            {;}


     | NEWLINE          {;}


;


print : PRINT NEWLINE      {cout<<"printer"<<endl;}
;

%%

void yyerror(char const *s)
{
  cout<<"Error on line "<<linenum<<": ";
  fprintf(stderr, "%s Exiting program now.\n", s);
  exit(-1);
}


int main()
{
  return yyparse();
}
