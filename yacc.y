%{
int yylex();
#include<stdio.h>
void yyerror(char *msg);
%}
%name parse
%token NUM
%left '+'
%left '*'
%%
S : S E '\n'{$$=$2; printf("Result is - %d", $$);}
	| {}
E : E '+' E	{$$=$1+$3;}
	| E '*' E	{$$=$1*$3;}
	| NUM			{$$=$1;}
	;
%%
int main(){
	yyparse();

}
void yyerror(char *msg){
	printf("Error in arithmatic");
}
