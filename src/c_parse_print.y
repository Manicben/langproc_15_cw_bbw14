%{
  #include <stdio.h>
  #include <iostream>
  #include <string>
  using namespace std;
  
  extern "C" int yylex();
  extern "C" int yyparse();
  void yyerror(const char *s);

  int indent = 0;
%}

%union{
  int val;
  char* str;
}

%token <str> TInt TFor TIf TReturn TWhile

%token <str> TIdentifier

%token <str> TOpenBracket TCloseBracket TOpenRound TCloseRound TOpenBrace TCloseBrace TComma TColon TEqual TSemicolon

%type <str> PARAMETER VARIABLE SCOPE

%%
//for(indent >= 0; indent--){printf("    ");}; 

FUNCTION : TInt TIdentifier TOpenRound PARAMETER TCloseRound SCOPE {printf("FUNCTION: %s\n",$2);}
		| TInt TIdentifier TOpenRound TCloseRound SCOPE {printf("FUNCTION: %s\n",$2);}
		| TInt TIdentifier TOpenRound PARAMETER TCloseRound TSemicolon {printf("FUNCTION: %s\n",$2);}
		| TInt TIdentifier TOpenRound TCloseRound TSemicolon {printf("FUNCTION: %s\n",$2);};

PARAMETER : TInt TIdentifier TComma PARAMETER {printf("    PARAMETER: %s\n", $2);}
		| TInt TIdentifier {printf("    PARAMETER: %s\n", $2);};

SCOPE : TOpenBrace EOSCOPE {indent++, printf("SCOPE\n");}
	| TOpenBrace VARIABLE RETURN EOSCOPE {indent++, printf("SCOPE\n");};

EOSCOPE : TCloseBrace {indent--;};

VARIABLE : TInt TIdentifier TSemicolon {printf("VARIABLE: %s\n", $2);}
		| TInt TIdentifier TEqual TIdentifier TSemicolon {printf("VARIABLE: %s\n", $2);}

RETURN : TReturn TIdentifier TSemicolon;

%%

int main()
{
    yyparse();
    
    return 0;
}

void yyerror(const char *s) {
	printf("Parse error! Message: %s", s);
	// Stop Parsing
	exit(-1);
}
