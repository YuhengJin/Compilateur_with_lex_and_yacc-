%%
"adore" {printf("tAdore\n");};
"le"   {printf("tle\n");}
"DSI"  {printf("DSI\n");}
[a-z]+  {printf("tPRENOM:%s\n",yytext);}
" "    {printf("tESPACE\n");}
. {printf("error\n");}
