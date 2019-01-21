%{
    #include "grammar.tab.c"
%}

%%
[ \t]+[1-9]+[0-9]* { yylval.ival = atoi(yytext); return CALKOWITA; }
[ \t]+0x[0-9A-F]+ {yylval.ival = strtol(yytext, NULL, 16); return SZESNASTKOWA; }
[ \t]+(([1-9]+[0-9]*)|0)\.[0-9]+ {yylval.fval = atof(yytext); return STALOPRZECINKOWA; }
[ \t]+[0-9]+(\.[0-9]+)E[-+][0-9]+ {yylval.fval = atof(yytext); return ZMIENNOPRZECINKOWA; }
[\r]?[\n] {return NOWALINIA; }
. { return UND; }
%%
