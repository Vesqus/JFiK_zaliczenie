%{

%}
%union {
	int ival;
	float fval;
}
%start plik
%token UND NOWALINIA
%token <ival> CALKOWITA SZESNASTKOWA
%token <fval> STALOPRZECINKOWA ZMIENNOPRZECINKOWA
%type <ival> calkowita szesnastkowa
%type <fval> staloprzecinkowa zmiennoprzecinkowa
%%

plik:
|     plik wiersz;

wiersz:  NOWALINIA
|       calkowita NOWALINIA {printf("%d\n", $1); }
|       szesnastkowa NOWALINIA {printf("%#x\n", $1); }
|       staloprzecinkowa NOWALINIA {printf("%f\n", $1); }
|       zmiennoprzecinkowa NOWALINIA {printf("%E\n", $1); };

calkowita: CALKOWITA { $$ = $1; }
|    calkowita CALKOWITA { $$ = $1 + $2; };

szesnastkowa: SZESNASTKOWA { $$ = $1; }
|    szesnastkowa SZESNASTKOWA { $$ = $1 + $2; };

staloprzecinkowa: STALOPRZECINKOWA { $$ = $1; }
|     staloprzecinkowa STALOPRZECINKOWA { $$ = $1 + $2; };

zmiennoprzecinkowa: ZMIENNOPRZECINKOWA { $$ = $1; }
|        zmiennoprzecinkowa ZMIENNOPRZECINKOWA { $$ = $1 + $2; };

%%

int yyerror(char* errstr) {
	printf("error: %s\n", errstr);
}
int yywrap(){ return 0; };
int yylex();
int main() {
	yyparse();
	return 0;
}
