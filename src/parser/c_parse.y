%{
  #include <stdio.h>
  #include <iostream>
  #include <string>
  #include <stdlib.h>
  #include <map>
  #include <list>
  #include "exp.h"
  using namespace std;

  // the root of the abstract syntax tree
  pgm *root;

  // for keeping track of line numbers in the program we are parsing
  int line_num = 1;
  
  extern "C" int yylex();
  extern "C" int yyparse();
  void yyerror(const char *s);

%}

%union{
	int num;
	char* id;
	exp_node *expnode;
	list<statement *> *stmts;
	statement *st;
	pgm *prog;
}

%token TAuto TDouble TInt TStruct TBreak TElse TLong TSwitch TCase TEnum TRegister TTypedef TChar TExtern TReturn TUnion TConst TFloat TShort TUnsigned TContinue TFor TSigned TVoid TDefault TGoto TVolatile TDo TIf TStatic TWhile TSizeof

%token <id> TIdentifier

%token TOpenBracket TCloseBracket TOpenRound TCloseRound TOpenBrace TCloseBrace TComma TColon TEqual TSemicolon
 
%token TEllipsis THash TPeriod TArrow TIncrement TDecrement TBitwiseAnd TAsterisk TAdd TSubtract TBitwiseNot TLogicNot TDivide TModulo TLeftShift TRightShift TLessThan TGreaterThan TLessEqual TGreaterEqual TLogicEqual TNotEqual THat TBitwiseOr TAnd TOr TQuestion TMultEqual TDivEqual TModEqual TAddEqual TSubEqual TLeftShiftEqual TRightShiftEqual TAndEqual THatEqual TOrEqual TDoubleHash

%type <expnode> primary_expression postfix_expression unary_expression cast_expression multiplicative_expression additive_expression shift_expression relational_expression equality_expression  AND_expression exclusive_OR_expression inclusive_OR_expression logical_AND_expression logical_OR_expression conditional_expression assignment_expression expression constant_expression

%type <stmts> stmtlist
%type <st> stmt
%type <prog> program

%%
/* Grammar taken from "The C89 Draft" - http://port70.net/~nsz/c/c89/c89-draft.html */

program : stmtlist { $$ = new pgm($1); root = $$; }
;
stmt : TIdentifier TEqual expression { 
  $$ = new assignment_stmt($1, $3);
	   }
;

/******3.1.3 Constants******/
constant	
	: TConstFloat
	| TConstInt
	| TCharConst	

/***3.3 Expressions***/

/******3.3.1 Primary******/
primary_expression
	: TIdentifier {$$ = new id_node($1);}
	| constant {$$ = new number_node($1);}
	| TStringLiteral
	| TOpenRound expression TCloseRound {$$ = $2;}

/******3.3.2 Postfix******/
postfix_expression	
	: primary_expression
	| postfix_expression TOpenBracket expression TCloseBracket
	| postfix_expression TOpenRound argument_expression_list TCloseRound
	| postfix_expression TOpenRound TCloseRound
	| postfix_expression TPeriod TIdentifier
	| postfix_expression TArrow TIdentifier
	| postfix_expression TIncrement
	| postfix_expression TDecrement

argument_expression_list	
	: assignment_expression
	| argument_expression_list TComma assignment_expression

/******3.3.3 Unary******/
unary_expression
	: postfix_expression
	| TIncrement unary_expression
	| TDecrement unary_expression
	| unary_operator cast_expression
	| TSizeof unary_expression
	| TSizeof ( type_name )

unary_operator
	: TBitwiseAnd
	| TAsterisk
	| TAdd
	| TSubtract
	| TBitwiseNot
	| TLogicNot

/******3.3.4 Cast******/
cast_expression
	: unary_expression
	| TOpenRound type_name TCloseRound cast_expression

/******3.3.5 Multiplicative******/
multiplicative_expression
	: cast_expression
	| multiplicative_expression TAsterisk cast_expression {$$ = new multiply_node($1, $3); }
	| multiplicative_expression TDivide cast_expression {$$ = new divide_node($1, $3); }
	| multiplicative_expression TModulo cast_expression {$$ = new modulo_node($1, $3); }

/******3.3.6 Additive******/
additive_expression
	: multiplicative_expression
	| additive_expression TAdd multiplicative_expression {$$ = new add_node($1, $3); }
	| additive_expression TSubtract multiplicative_expression {$$ = new subtract_node($1, $3); }

/******3.3.7 Bitwise shift******/
shift_expression
	: additive_expression
	| shift_expression TLeftShift additive_expression
	| shift_expression TRightShift additive_expression

/******3.3.8 Relational******/
relational_expression
	: shift_expression
	| relational_expression TLessThan shift_expression
	| relational_expression TGreaterThan shift_expression
	| relational_expression TLessEqual shift_expression
	| relational_expression TGreaterEqual shift_expression

/******3.3.9 Equality******/
equality_expression
	: relational_expression
	| equality_expression TLogicEqual relational_expression
	| equality_expression TNotEqual relational_expression

/******3.3.10 Bitwise AND******/
AND_expression
	: equality_expression
	| AND_expression TBitwiseAnd equality_expression

/******3.3.11 Bitwise exclusive OR******/
exclusive_OR_expression
	: AND_expression
	| exclusive_OR_expression THat AND_expression

/******3.3.12 Bitwise inclusive OR******/
inclusive_OR_expression
	: exclusive_OR_expression
	| inclusive_OR_expression TBitwiseOr exclusive_OR_expression

/******3.3.13 Logical AND******/
logical_AND_expression
	: inclusive_OR_expression
	| logical_AND_expression TAnd inclusive_OR_expression

/******3.3.14 Logical OR******/
logical_OR_expression
	: logical_AND_expression
	| logical_OR_expression TOr logical_AND_expression

/******3.3.15 Conditional******/
conditional_expression
	: logical_OR_expression
	| logical_OR_expression TQuestion expression TColon conditional_expression

/******3.3.16 Assignment******/
assignment_expression
	: conditional_expression
	| unary_expression assignment_operator assignment_expression

assignment_operator
	: TEqual
	| TMultEqual
	| TDivEqual
	| TModEqual
	| TAddEqual
	| TSubEqual
	| TLeftShiftEqual
	| TRightShiftEqual
	| TAndEqual
	| THatEqual
	| TOrEqual

/******3.3.17 Comma******/
expression
	: assignment_expression
	| expression TComma assignment_expression

/******3.4 Constant******/
constant_expression
	: conditional_expression
%%

int main()
{
    yyparse();
    root->evaluate();

    return 0;
}

void yyerror(const char *s) {
	printf("Parse error! Message: %s", s);
	// Stop Parsing
	exit(-1);
}
