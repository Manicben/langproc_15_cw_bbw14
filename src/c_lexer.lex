%option noyywrap
%{
#include <stdio.h>
#include <string>

int lines = 1;
int sourceline = 1;
char* sourcefile = "\"\"";
%}

/* Lexical Elements taken from "The C89 Draft" - http://port70.net/~nsz/c/c89/c89-draft.html */

/* Keyword List */
AUTO			auto
DOUBLE			double
INT			int
STRUCT			struct
BREAK			break
ELSE			else
LONG			long
SWITCH			switch
CASE			case
ENUM			enum
REGISTER		register
TYPEDEF			typedef
CHAR			char
EXTERN			extern
RETURN			return
UNION			union
CONST			const
FLOAT			float
SHORT			short
UNSIGNED		unsigned
CONTINUE		continue
FOR			for
SIGNED			signed
VOID			void
DEFAULT			default
GOTO			goto
VOLATILE		volatile
DO			do
IF			if
STATIC			static
WHILE			while
/* End of Keyword List */

/* Operator sizeof */
SIZEOF			sizeof

/* Identifiers */
IDENTIFIER		[_a-zA-Z][_a-zA-Z0-9]*

/* Punctuator List */
OPENBRACKET		[[]
CLOSEBRACKET		[]]
OPENROUND		[(]
CLOSEROUND		[)]
OPENBRACE		[{]
CLOSEBRACE		[}]
COMMA			[,]
COLON			[:]
EQUAL			[=]
SEMICOLON		[;]
ELLIPSIS		[.][.][.]
HASH			[#]

/* Operator List */
PERIOD			[.]
ARROW			[-][>]
INCREMENT		[+][+]
DECREMENT		[-][-]
BITWISEAND		[&]
ASTERISK		[*]
ADD			[+]
SUBTRACT		[-]
BITWISENOT		[~]
LOGICNOT		[!]
DIVIDE			[/]
MODULO			[%]
LEFTSHIFT		[<][<]
RIGHTSHIFT		[>][>]
LESSTHAN		[<]
GREATERTHAN		[>]
LESSEQUAL		[<][=]
GREATEREQUAL		[>][=]
LOGICEQUAL		[=][=]
NOTEQUAL		[!][=]
HAT			[\^]
BITWISEOR		[|]
AND			[&][&]
OR			[|][|]
QUESTION		[?]
MULTEQUAL		[*][=]
DIVEQUAL		[/][=]
MODEQUAL		[%][=]
ADDEQUAL		[+][=]
SUBEQUAL		[-][=]
LEFTSHIFTEQUAL		[<][<][=]
RIGHTSHIFTEQUAL		[>][>][=]
ANDEQUAL		[&][=]
HATEQUAL		[\^][=]
OREQUAL			[|][=]
DOUBLEHASH		[#][#]

/* Constants */
CONSTFLOAT		[0-9]*((([0-9][\.]|[\.[0-9]]|[0-9])[0-9]*[eE][\+\-]?[0-9]+)|((([0-9][\.])|([\.][0-9]))[0-9]*))[f|F|l|L]?
CONSTINT		[1-9]{1}[0-9]*([u|U]?[l|L]?)|(([i][6][4])?)
HEXINT			[0][x|X][0-9a-fA-F]+([u|U]?[l|L]?)|(([i][6][4])?)
OCTALINT		[0][0-7]+([u|U]?[l|L]?)|(([i][6][4])?)
UNSIGNEDINT		[1-9][0-9]*[uU]?[lL]?[lL]?
SIGNEDINT		[-]?[1-9][0-9]*[lL]?[lL]?
/*CONSTENUM*/
ESC 			\\((x[0-9a-fA-F]{2})|(['?\\"abfnrtv])|([0-7]{0,3}))
CHARCONST 		L?\'({ES}|[^\\'\n])*\'

/* Misc */
STRINGLITERAL		L?\"({ESC}|[^\\"\n])*\"
WHITESPACE		[ \t\r]
NEWLINE			[\n]

PREPROCESSED		#[ ][0-9]+[ ]\"([^\\"]|\\.)*\"([ ]1)?([ ]2)?([ ]3)?([ ]4)?$

INVALID			[^({IDENTIFIER}|{CONSTFLOAT}|{CONSTINT}|{HEXINT}|{OCTINT}|{UNSIGNEDINT}|{SIGNEDINT}|{CHARCONST}|{STRINGLITERAL}|{WHITESPACE}|{NEWLINE})]

%%

{WHITESPACE}				
{NEWLINE}			lines++, sourceline++;

{AUTO}				printf("%s KEYWORD TAuto %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DOUBLE}			printf("%s KEYWORD TDouble %i %s %i\n", yytext, lines, sourcefile, sourceline);
{INT}				printf("%s KEYWORD TInt %i %s %i\n", yytext, lines, sourcefile, sourceline);
{STRUCT}			printf("%s KEYWORD TStruct %i %s %i\n", yytext, lines, sourcefile, sourceline);
{BREAK}				printf("%s KEYWORD TBreak %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ELSE}				printf("%s KEYWORD TElse %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LONG}				printf("%s KEYWORD TLong %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SWITCH}			printf("%s KEYWORD TSwitch %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CASE}				printf("%s KEYWORD TCase %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ENUM}				printf("%s KEYWORD TEnum %i %s %i\n", yytext, lines, sourcefile, sourceline);
{REGISTER}			printf("%s KEYWORD TRegister %i %s %i\n", yytext, lines, sourcefile, sourceline);
{TYPEDEF}			printf("%s KEYWORD TTypedef %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CHAR}				printf("%s KEYWORD TChar %i %s %i\n", yytext, lines, sourcefile, sourceline);
{EXTERN}			printf("%s KEYWORD TExtern %i %s %i\n", yytext, lines, sourcefile, sourceline);
{RETURN}			printf("%s KEYWORD TReturn %i %s %i\n", yytext, lines, sourcefile, sourceline);
{UNION}				printf("%s KEYWORD TUnion %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CONST}				printf("%s KEYWORD TConst %i %s %i\n", yytext, lines, sourcefile, sourceline);
{FLOAT}				printf("%s KEYWORD TFloat %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SHORT}				printf("%s KEYWORD TShort %i %s %i\n", yytext, lines, sourcefile, sourceline);
{UNSIGNED}			printf("%s KEYWORD TUnsigned %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CONTINUE}			printf("%s KEYWORD TContinue %i %s %i\n", yytext, lines, sourcefile, sourceline);
{FOR}				printf("%s KEYWORD TFor %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SIGNED}			printf("%s KEYWORD TSigned %i %s %i\n", yytext, lines, sourcefile, sourceline);
{VOID}				printf("%s KEYWORD TVoid %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DEFAULT}			printf("%s KEYWORD TDefault %i %s %i\n", yytext, lines, sourcefile, sourceline);
{GOTO}				printf("%s KEYWORD TGoto %i %s %i\n", yytext, lines, sourcefile, sourceline);
{VOLATILE}			printf("%s KEYWORD TVolatile %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DO}				printf("%s KEYWORD TDo %i %s %i\n", yytext, lines, sourcefile, sourceline);
{IF}				printf("%s KEYWORD TIf %i %s %i\n", yytext, lines, sourcefile, sourceline);
{STATIC}			printf("%s KEYWORD TStatic %i %s %i\n", yytext, lines, sourcefile, sourceline);
{WHILE}				printf("%s KEYWORD TWhile %i %s %i\n", yytext, lines, sourcefile, sourceline);

{SIZEOF}			printf("%s OPERATOR TSizeof %i %s %i\n", yytext, lines, sourcefile, sourceline);

{IDENTIFIER}			printf("%s IDENTIFIER TIdentifier %i %s %i\n", yytext, lines, sourcefile, sourceline);

{OPENBRACKET}			printf("%s OPERATOR TOpenBracket %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CLOSEBRACKET}			printf("%s OPERATOR TCloseBracket %i %s %i\n", yytext, lines, sourcefile, sourceline);
{OPENROUND}			printf("%s OPERATOR TOpenRound %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CLOSEROUND}			printf("%s OPERATOR TCloseRound %i %s %i\n", yytext, lines, sourcefile, sourceline);
{OPENBRACE}			printf("%s OPERATOR TOpenBrace %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CLOSEBRACE}			printf("%s OPERATOR TCloseBrace %i %s %i\n", yytext, lines, sourcefile, sourceline);
{COMMA}				printf("%s OPERATOR TComma %i %s %i\n", yytext, lines, sourcefile, sourceline);
{COLON}				printf("%s OPERATOR TColon %i %s %i\n", yytext, lines, sourcefile, sourceline);
{EQUAL}				printf("%s OPERATOR TEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SEMICOLON}			printf("%s OPERATOR TSemicolon %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ELLIPSIS}			printf("%s OPERATOR TEllipsis %i %s %i\n", yytext, lines, sourcefile, sourceline);
{HASH}				printf("%s OPERATOR THash %i %s %i\n", yytext, lines, sourcefile, sourceline);
{PERIOD}			printf("%s OPERATOR TPeriod %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ARROW}				printf("%s OPERATOR TArrow %i %s %i\n", yytext, lines, sourcefile, sourceline);
{INCREMENT}			printf("%s OPERATOR TIncrement %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DECREMENT}			printf("%s OPERATOR TDecrement %i %s %i\n", yytext, lines, sourcefile, sourceline);
{BITWISEAND}			printf("%s OPERATOR TBitwiseAnd %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ASTERISK}			printf("%s OPERATOR TAsterisk %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ADD}				printf("%s OPERATOR TAdd %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SUBTRACT}			printf("%s OPERATOR TSubtract %i %s %i\n", yytext, lines, sourcefile, sourceline);
{BITWISENOT}			printf("%s OPERATOR TBitwiseNot %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LOGICNOT}			printf("%s OPERATOR TLogicNot %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DIVIDE}			printf("%s OPERATOR TDivide %i %s %i\n", yytext, lines, sourcefile, sourceline);
{MODULO}			printf("%s OPERATOR TModulo %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LEFTSHIFT}			printf("%s OPERATOR TLeftShift %i %s %i\n", yytext, lines, sourcefile, sourceline);
{RIGHTSHIFT}			printf("%s OPERATOR TRightShift %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LESSTHAN}			printf("%s OPERATOR TLessThan %i %s %i\n", yytext, lines, sourcefile, sourceline);
{GREATERTHAN}			printf("%s OPERATOR TGreaterThan %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LESSEQUAL}			printf("%s OPERATOR TLessEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{GREATEREQUAL}			printf("%s OPERATOR TGreaterEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LOGICEQUAL}			printf("%s OPERATOR TLogicEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{NOTEQUAL}			printf("%s OPERATOR TNotEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{HAT}				printf("%s OPERATOR THat %i %s %i\n", yytext, lines, sourcefile, sourceline);
{BITWISEOR}			printf("%s OPERATOR TBitwiseOr %i %s %i\n", yytext, lines, sourcefile, sourceline);
{AND}				printf("%s OPERATOR TAnd %i %s %i\n", yytext, lines, sourcefile, sourceline);
{OR}				printf("%s OPERATOR TOr %i %s %i\n", yytext, lines, sourcefile, sourceline);
{QUESTION}			printf("%s OPERATOR TQuestion %i %s %i\n", yytext, lines, sourcefile, sourceline);
{MULTEQUAL}			printf("%s OPERATOR TMultEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DIVEQUAL}			printf("%s OPERATOR TDivEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{MODEQUAL}			printf("%s OPERATOR TModEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ADDEQUAL}			printf("%s OPERATOR TAddEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SUBEQUAL}			printf("%s OPERATOR TSubEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{LEFTSHIFTEQUAL}		printf("%s OPERATOR TLeftShiftEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{RIGHTSHIFTEQUAL}		printf("%s OPERATOR TRightShiftEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{ANDEQUAL}			printf("%s OPERATOR TAndEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{HATEQUAL}			printf("%s OPERATOR THatEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{OREQUAL}			printf("%s OPERATOR TOrEqual %i %s %i\n", yytext, lines, sourcefile, sourceline);
{DOUBLEHASH}			printf("%s OPERATOR TDoubleHash %i %s %i\n", yytext, lines, sourcefile, sourceline);

{CONSTFLOAT}			printf("%s CONSTANT TConstFloat %i %s %i\n", yytext, lines, sourcefile, sourceline);
{CONSTINT}			printf("%s CONSTANT TConstInt %i %s %i\n", yytext, lines, sourcefile, sourceline);
{HEXINT}			printf("%s CONSTANT THexInt %i %s %i\n", yytext, lines, sourcefile, sourceline);
{OCTALINT}			printf("%s CONSTANT TOctalInt %i %s %i\n", yytext, lines, sourcefile, sourceline);
{UNSIGNEDINT}			printf("%s CONSTANT TUnsignedInt %i %s %i\n", yytext, lines, sourcefile, sourceline);
{SIGNEDINT}			printf("%s CONSTANT TSignedInt %i %s %i\n", yytext, lines, sourcefile, sourceline);

{STRINGLITERAL}			printf("%s STRINGLITERAL TString %i %s %i\n", yytext, lines, sourcefile, sourceline);

{PREPROCESSED}			{ 
				std::string sourcefilepp = yytext;

				size_t start = sourcefilepp.find('"');
				size_t end = sourcefilepp.find('"', start+1);
				size_t diff = end - start;

				sourcefile = strdup(sourcefilepp.substr(start,diff+1).c_str());
				sourceline = atoi(&yytext[2]) - 1;
				}

{INVALID}			printf("%s INVALID TInvalid %i %s %i\n", yytext, lines, sourcefile, sourceline);

%%

int main()
{
    yylex();
    
    return 0;
}
