%{
#include<stdlib.h>
#include"y.tab.h"
int yyval;
%}
%%
[0-9]+ {yylval=atoi(yytext); return NUM;}
[+*\n] return *yytext;
. ;
%%
int yywrap(){
	return 1;
}
