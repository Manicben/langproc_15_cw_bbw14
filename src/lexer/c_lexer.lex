%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include "c_parse.tab.hpp"

extern "C" int yylex();

%}

/* Lexical Elements taken from "The C89 Draft" - http://port70.net/~nsz/c/c89/c89-draft.html */

/* Keyword List */
AUTO            auto
DOUBLE          double
INT         	int
STRUCT          struct
BREAK           break
ELSE            else
LONG            long
SWITCH          switch
CASE            case
ENUM            enum
REGISTER        register
TYPEDEF         typedef
CHAR            char
EXTERN          extern
RETURN          return
UNION           union
CONST           const
FLOAT           float
SHORT           short
UNSIGNED        unsigned
CONTINUE        continue
FOR         	for
SIGNED          signed
VOID            void
DEFAULT         default
GOTO            goto
VOLATILE        volatile
DO          	do
IF          	if
STATIC          static
WHILE           while
/* End of Keyword List */

/* Operator sizeof */
SIZEOF          sizeof

/* Identifiers */
IDENTIFIER      [_a-zA-Z][_a-zA-Z0-9]*

/* Punctuator List */
OPENBRACKET     [[]
CLOSEBRACKET    []]
OPENROUND       [(]
CLOSEROUND      [)]
OPENBRACE       [{]
CLOSEBRACE      [}]
COMMA           [,]
COLON           [:]
EQUAL           [=]
SEMICOLON       [;]
ELLIPSIS        [.][.][.]
HASH            [#]

/* Operator List */
PERIOD          [.]
ARROW           [-][>]
INCREMENT       [+][+]
DECREMENT       [-][-]
BITWISEAND      [&]
ASTERISK        [*]
ADD         	[+]
SUBTRACT        [-]
BITWISENOT      [~]
LOGICNOT        [!]
DIVIDE          [/]
MODULO          [%]
LEFTSHIFT       [<][<]
RIGHTSHIFT      [>][>]
LESSTHAN        [<]
GREATERTHAN     [>]
LESSEQUAL       [<][=]
GREATEREQUAL    [>][=]
LOGICEQUAL      [=][=]
NOTEQUAL        [!][=]
HAT         	[\^]
BITWISEOR       [|]
AND         	[&][&]
OR          	[|][|]
QUESTION        [?]
MULTEQUAL       [*][=]
DIVEQUAL        [/][=]
MODEQUAL        [%][=]
ADDEQUAL        [+][=]
SUBEQUAL        [-][=]
LEFTSHIFTEQUAL  [<][<][=]
RIGHTSHIFTEQUAL [>][>][=]
ANDEQUAL        [&][=]
HATEQUAL        [\^][=]
OREQUAL         [|][=]
DOUBLEHASH      [#][#]

/* Constants */
CONSTFLOAT      [0-9]*((([0-9][\.]|[\.[0-9]]|[0-9])[0-9]*[eE][\+\-]?[0-9]+)|((([0-9][\.])|([\.][0-9]))[0-9]*))[f|F|l|L]?
CONSTINT        [1-9]{1}[0-9]*([u|U]?[l|L]?)|(([i][6][4])?)
HEXINT          [0][x|X][0-9a-fA-F]+([u|U]?[l|L]?)|(([i][6][4])?)
OCTALINT        [0][0-7]+([u|U]?[l|L]?)|(([i][6][4])?)
UNSIGNEDINT     [1-9][0-9]*[uU]?[lL]?[lL]?
SIGNEDINT       [-]?[1-9][0-9]*[lL]?[lL]?
/*CONSTENUM*/
ESC             \\((x[0-9a-fA-F]{2})|(['?\\"abfnrtv])|([0-7]{0,3}))
CHARCONST       L?\'({ES}|[^\\'\n])*\'

/* Misc */
STRINGLITERAL   L?\"({ESC}|[^\\"\n])*\"
WHITESPACE      [ \t\r]
NEWLINE         [\n]

PREPROCESSED    #[ ][0-9]+[ ]\"([^\\"]|\\.)*\"([ ]1)?([ ]2)?([ ]3)?([ ]4)?$

INVALID         [^({IDENTIFIER}|{CONSTFLOAT}|{CONSTINT}|{HEXINT}|{OCTINT}|{UNSIGNEDINT}|{SIGNEDINT}|{CHARCONST}|{STRINGLITERAL}|{WHITESPACE}|{NEWLINE})]

%%

{WHITESPACE}
{NEWLINE}

{AUTO}              return TAuto;
{DOUBLE}            return TDouble;
{INT}               return TInt;
{STRUCT}            return TStruct;
{BREAK}             return TBreak;
{ELSE}              return TElse;
{LONG}              return TLong;
{SWITCH}            return TSwitch;
{CASE}              return TCase;
{ENUM}              return TEnum;
{REGISTER}          return TRegister;
{TYPEDEF}           return TTypedef;
{CHAR}              return TChar;
{EXTERN}            return TExtern;
{RETURN}            return TReturn;
{UNION}             return TUnion;
{CONST}             return TConst;
{FLOAT}             return TFloat;
{SHORT}             return TShort;
{UNSIGNED}          return TUnsigned;
{CONTINUE}          return TContinue;
{FOR}               return TFor;
{SIGNED}            return TSigned;
{VOID}              return TVoid;
{DEFAULT}           return TDefault;
{GOTO}              return TGoto;
{VOLATILE}          return TVolatile;
{DO}                return TDo;
{IF}                return TIf;
{STATIC}            return TStatic;
{WHILE}             return TWhile;
{SIZEOF}            return TSizeof;

{IDENTIFIER}        yylval.id = strdup(yytext); return TIdentifier;
 
{OPENBRACKET}       return TOpenBracket;
{CLOSEBRACKET}      return TCloseBracket;
{OPENROUND}         return TOpenRound;
{CLOSEROUND}        return TCloseRound;
{OPENBRACE}         return TOpenBrace;
{CLOSEBRACE}        return TCloseBrace;
{COMMA}             return TComma;
{COLON}             return TColon;
{EQUAL}             return TEqual;
{SEMICOLON}         return TSemicolon;
 
{ELLIPSIS}          return TEllipsis;
{HASH}              return THash;
{PERIOD}            return TPeriod;
{ARROW}             return TArrow;
{INCREMENT}         return TIncrement;
{DECREMENT}         return TDecrement;
{BITWISEAND}        return TBitwiseAnd;
{ASTERISK}          return TAsterisk;
{ADD}               return TAdd;
{SUBTRACT}          return TSubtract;
{BITWISENOT}        return TBitwiseNot;
{LOGICNOT}          return TLogicNot;
{DIVIDE}            return TDivide;
{MODULO}            return TModulo;
{LEFTSHIFT}         return TLeftShift;
{RIGHTSHIFT}        return TRightShift;
{LESSTHAN}          return TLessThan;
{GREATERTHAN}       return TGreaterThan;
{LESSEQUAL}         return TLessEqual;
{GREATEREQUAL}      return TGreaterEqual;
{LOGICEQUAL}        return TLogicEqual;
{NOTEQUAL}          return TNotEqual;
{HAT}               return THat;
{BITWISEOR}         return TBitwiseOr;
{AND}               return TAnd;
{OR}                return TOr;
{QUESTION}          return TQuestion;
{MULTEQUAL}         return TMultEqual;
{DIVEQUAL}          return TDivEqual;
{MODEQUAL}          return TModEqual;
{ADDEQUAL}          return TAddEqual;
{SUBEQUAL}          return TSubEqual;
{LEFTSHIFTEQUAL}    return TLeftShiftEqual;
{RIGHTSHIFTEQUAL}   return TRightShiftEqual;
{ANDEQUAL}          return TAndEqual;
{HATEQUAL}          return THatEqual;
{OREQUAL}           return TOrEqual;
{DOUBLEHASH}        return TDoubleHash;
 
{CONSTFLOAT}        yylval = atof(yytext); return TConstFloat;  
{CONSTINT}          yylval.num = atoi(yytext); return TConstInt;    
{HEXINT}            yylval = atoi(yytext); return THexInt;      
{OCTALINT}          yylval = atoi(yytext); return TOctalInt;    
{UNSIGNEDINT}       yylval = atoi(yytext); return TUnsignedInt; 
{SIGNEDINT}         yylval = atoi(yytext); return TSignedInt;   
 
{STRINGLITERAL}     yylval = strdup(yytext); return TStringLiteral;
 
{PREPROCESSED}      
 
{INVALID}          
 
%%


