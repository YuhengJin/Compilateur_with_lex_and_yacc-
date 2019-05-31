%{
	#include "y.tab.h"

	//"true" {return(tTRUE);}
	//"false"{return(tFALSE);}

%}

%%


"main" {return (tMAIN);}
"{"   {return(tAO);}
"}"  {return(tAF);}

"const"    {return(tCONST);}
"int"    {return(tINT);}
"char"    {return(tCHAR);}

"=="	{return(tEQU);}
"!="	{return(tNOTEQU);}
"*"    {return(tETOILE);}
"/"    {return(tSLASH);}
"+"    {return(tPLUS);}
"-"    {return(tMOINS);}

">="     {return(tSUPEQU);}
">"     {return(tSUP);}
"<"     {return(tINF);}
"<="     {return(tINFEQU);}
"="    {return(tEAGLE);}


";"    {return(tPV);}
"!"    {return(tPE);}
"("    {return(tPO);}
")"    {return(tPF);}
","    {return(tVI);}
"&&"	{return(tAND);}
"||"	{return(tOR);}
"while"  {return(tWHILE);}
"if"     {return(tIF);}
"else"     {return(tELSE);}
"printf"   {return(tPRINTF);}

[" "|"\t"|"\b"|"\n"] {}


[0-9]+   {yylval.e = atoi(yytext);
			return(tENTIER);}
[a-z][a-zA-Z0-9_]*  {yylval.e2 = strdup(yytext);
						return(tID);}






. {return(terror);}

