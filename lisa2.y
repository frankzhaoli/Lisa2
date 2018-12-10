%{
#include <stdio.h>
#include <string>
#include <iostream>
#include <unordered_map>

void yyerror(char const *s);
int yylex();

using namespace std;

extern FILE *yyin;
extern int linenum;
%}

%union {int num; char *id;}
%start program
%error-verbose

%token
NEWLINE
PRINT
STRING
;


%%

program : line   {;}
;

line : line print            {;}
     | print                 {;}
     | '(' NEWLINE           {cout<<"LPAR";}
     | '+' NEWLINE           {cout<<"plus";}
     | '"' NEWLINE           {cout<<"quote";}
     | NEWLINE               {;}


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

  //open file
  FILE *file=fopen("text.l2", "r");

  //check for valid file
  if(!file)
  {
    cout<<"File does not exist or cannot be opened."<<endl;
    return -1;
  }

  //set input to file
  yyin=file;

  //begin parse
  return yyparse();
}
