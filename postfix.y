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
S : S E '\n'{$$=$2; printf("\n", $$);}
	| {}
E : E '+' E	{printf("+");}
	| E '*' E	{printf("*");}
	| NUM			{$$=$1; printf("%d", $$);}
	;
%%
int main(){
	yyparse();

}
void yyerror(char *msg){
	printf("Error in arithmatic");
}
