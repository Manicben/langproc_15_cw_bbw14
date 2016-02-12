%option noyywrap
%{
#include <stdio.h>

int lines = 0;
%}

// Lexical Elements taken from "The C89 Draft" - http://port70.net/~nsz/c/c89/c89-draft.html

// Keyword List
AUTO			auto
DOUBLE			double
INT				int
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
FOR				for
SIGNED			signed
VOID			void
DEFAULT			default
GOTO			goto
SIZEOF			sizeof
VOLATILE		volatile
DO				do
IF				if
STATIC			static
WHILE			while
// End of Keyword List

// Identifiers
IDENTIFIERS		[_a-zA-Z][_\w]*

// Punctuator List
OPENBRACKET		[[]
CLOSEBRACKET	[]]
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

// Operator List
PERIOD			[.]
ARROW			[-][>]
INCREMENT		[+][+]
DECREMENT		[-][-]
BITWISEAND		[&]
ASTERISK		[*]
ADD				[+]
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
GREATEREQUAL	[>][=]
LOGICEQUAL		[=][=]
NOTEQUAL		[!][=]
HAT				[^]
BITWISEOR		[|]
AND				[&][&]
OR				[|][|]
QUESTION		[?]
MULTEQUAL		[*][=]
DIVEQUAL		[/][=]
MODEQUAL		[%][=]
ADDEQUAL		[+][=]
SUBEQUAL		[-][=]
LEFTSHIFTEQUAL	[<][<][=]
RIGHTSHIFTEQUAL	[>][>][=]
ANDEQUAL		[&][=]
HATEQUAL		[^=]
OREQUAL			[|][=]
DOUBLEHASH		[#][#]

// Constants
CONSTFLOAT		[0-9]+\.[0-9]+
CONSTINT		[0-9]+
HEXINT			[0][xX][0-9a-fA-F]+[uU]?[lL]?[lL]?
UNSIGNEDINT		[1-9][0-9]*[uU]?[lL]?[lL]?
SIGNEDINT		[-]?[1-9][0-9]*[lL]?[lL]?
OCTALINT		[0][1-7]*[uU]?[lL]?[lL]?
//CONSTENUM
//CONSTCHAR

// Misc
STRINGLITERAL	[\"][.]*[\"]
WS				[ ]|[\t]
NEWLINE			[/n]

%%

{AUTO}				printf("%s KEYWORD TAuto %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DOUBLE}			printf("%s KEYWORD TDouble %u SOURCEFILE SOURCELINE\n", yytext, lines);
{INT}				printf("%s KEYWORD TInt %u SOURCEFILE SOURCELINE\n", yytext, lines);
{STRUCT}			printf("%s KEYWORD TStruct %u SOURCEFILE SOURCELINE\n", yytext, lines);
{BREAK}				printf("%s KEYWORD TBreak %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ELSE}				printf("%s KEYWORD TElse %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LONG}				printf("%s KEYWORD TLong %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SWITCH}			printf("%s KEYWORD TSwitch %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CASE}				printf("%s KEYWORD TCase %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ENUM}				printf("%s KEYWORD TEnum %u SOURCEFILE SOURCELINE\n", yytext, lines);
{REGISTER}			printf("%s KEYWORD TRegister %u SOURCEFILE SOURCELINE\n", yytext, lines);
{TYPEDEF}			printf("%s KEYWORD TTypedef %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CHAR}				printf("%s KEYWORD TChar %u SOURCEFILE SOURCELINE\n", yytext, lines);
{EXTERN}			printf("%s KEYWORD TExtern %u SOURCEFILE SOURCELINE\n", yytext, lines);
{RETURN}			printf("%s KEYWORD TReturn %u SOURCEFILE SOURCELINE\n", yytext, lines);
{UNION}				printf("%s KEYWORD TUnion %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CONST}				printf("%s KEYWORD TConst %u SOURCEFILE SOURCELINE\n", yytext, lines);
{FLOAT}				printf("%s KEYWORD TFloat %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SHORT}				printf("%s KEYWORD TShort %u SOURCEFILE SOURCELINE\n", yytext, lines);
{UNSIGNED}			printf("%s KEYWORD TUnsigned %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CONTINUE}			printf("%s KEYWORD TContinue %u SOURCEFILE SOURCELINE\n", yytext, lines);
{FOR}				printf("%s KEYWORD TFor %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SIGNED}			printf("%s KEYWORD TSigned %u SOURCEFILE SOURCELINE\n", yytext, lines);
{VOID}				printf("%s KEYWORD TVoid %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DEFAULT}			printf("%s KEYWORD TDefault %u SOURCEFILE SOURCELINE\n", yytext, lines);
{GOTO}				printf("%s KEYWORD TGoto %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SIZEOF}			printf("%s KEYWORD TSizeof %u SOURCEFILE SOURCELINE\n", yytext, lines);
{VOLATILE}			printf("%s KEYWORD TVolatile %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DO}				printf("%s KEYWORD TDo %u SOURCEFILE SOURCELINE\n", yytext, lines);
{IF}				printf("%s KEYWORD TIf %u SOURCEFILE SOURCELINE\n", yytext, lines);
{STATIC}			printf("%s KEYWORD TStatic %u SOURCEFILE SOURCELINE\n", yytext, lines);
{WHILE}				printf("%s KEYWORD TWhile %u SOURCEFILE SOURCELINE\n", yytext, lines);

{IDENTIFIER}		printf("%s IDENTIFIER TIdentifier %u SOURCEFILE SOURCELINE\n", yytext, lines);

{OPENBRACKET}		printf("%s OPERATOR TOpenBracket %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CLOSEBRACKET}		printf("%s OPERATOR TCloseBracket %u SOURCEFILE SOURCELINE\n", yytext, lines);
{OPENROUND}			printf("%s OPERATOR TOpenRound %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CLOSEROUND}		printf("%s OPERATOR TCloseRound %u SOURCEFILE SOURCELINE\n", yytext, lines);
{OPENBRACE}			printf("%s OPERATOR TOpenBrace %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CLOSEBRACE}		printf("%s OPERATOR TCloseBrace %u SOURCEFILE SOURCELINE\n", yytext, lines);
{COMMA}				printf("%s OPERATOR TComma %u SOURCEFILE SOURCELINE\n", yytext, lines);
{COLON}				printf("%s OPERATOR TColon %u SOURCEFILE SOURCELINE\n", yytext, lines);
{EQUAL}				printf("%s OPERATOR TEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SEMICOLON}			printf("%s OPERATOR TSemicolon %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ELLIPSIS}			printf("%s OPERATOR TEllipsis %u SOURCEFILE SOURCELINE\n", yytext, lines);
{HASH}				printf("%s OPERATOR THash %u SOURCEFILE SOURCELINE\n", yytext, lines);
{PERIOD}			printf("%s OPERATOR TPeriod %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ARROW}				printf("%s OPERATOR TArrow %u SOURCEFILE SOURCELINE\n", yytext, lines);
{INCREMENT}			printf("%s OPERATOR TIncrement %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DECREMENT}			printf("%s OPERATOR TDecrement %u SOURCEFILE SOURCELINE\n", yytext, lines);
{BITWISEAND}		printf("%s OPERATOR TBitwiseAnd %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ASTERISK}			printf("%s OPERATOR TAsterisk %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ADD}				printf("%s OPERATOR TAdd %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SUBTRACT}			printf("%s OPERATOR TSubtract %u SOURCEFILE SOURCELINE\n", yytext, lines);
{BITWISENOT}		printf("%s OPERATOR TBitwiseNot %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LOGICNOT}			printf("%s OPERATOR TLogicNot %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DIVIDE}			printf("%s OPERATOR TDivide %u SOURCEFILE SOURCELINE\n", yytext, lines);
{MODULO}			printf("%s OPERATOR TModulo %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LEFTSHIFT}			printf("%s OPERATOR TLeftShift %u SOURCEFILE SOURCELINE\n", yytext, lines);
{RIGHTSHIFT}		printf("%s OPERATOR TRightShift %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LESSTHAN}			printf("%s OPERATOR TLessThan %u SOURCEFILE SOURCELINE\n", yytext, lines);
{GREATERTHAN}		printf("%s OPERATOR TGreaterThan %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LESSEQUAL}			printf("%s OPERATOR TLessEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{GREATEREQUAL}		printf("%s OPERATOR TGreaterEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LOGICEQUAL}		printf("%s OPERATOR TLogicEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{NOTEQUAL}			printf("%s OPERATOR TNotEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{HAT}				printf("%s OPERATOR THat %u SOURCEFILE SOURCELINE\n", yytext, lines);
{BITWISEOR}			printf("%s OPERATOR TBitwiseOr %u SOURCEFILE SOURCELINE\n", yytext, lines);
{AND}				printf("%s OPERATOR TAnd %u SOURCEFILE SOURCELINE\n", yytext, lines);
{OR}				printf("%s OPERATOR TOr %u SOURCEFILE SOURCELINE\n", yytext, lines);
{QUESTION}			printf("%s OPERATOR TQuestion %u SOURCEFILE SOURCELINE\n", yytext, lines);
{MULTEQUAL}			printf("%s OPERATOR TMultEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DIVEQUAL}			printf("%s OPERATOR TDivEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{MODEQUAL}			printf("%s OPERATOR TModEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ADDEQUAL}			printf("%s OPERATOR TAddEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SUBEQUAL}			printf("%s OPERATOR TSubEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{LEFTSHIFTEQUAL}	printf("%s OPERATOR TLeftShiftEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{RIGHTSHIFTEQUAL}	printf("%s OPERATOR TRightShiftEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{ANDEQUAL}			printf("%s OPERATOR TAndEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{HATEQUAL}			printf("%s OPERATOR THatEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{OREQUAL}			printf("%s OPERATOR TOrEqual %u SOURCEFILE SOURCELINE\n", yytext, lines);
{DOUBLEHASH}		printf("%s OPERATOR TDoubleHash %u SOURCEFILE SOURCELINE\n", yytext, lines);

{CONSTFLOAT}		printf("%s CONSTANT	TConstFloat %u SOURCEFILE SOURCELINE\n", yytext, lines);
{CONSTINT}			printf("%s CONSTANT	TConstInt %u SOURCEFILE SOURCELINE\n", yytext, lines);
{HEXINT}			printf("%s CONSTANT	THexInt %u SOURCEFILE SOURCELINE\n", yytext, lines);
{OCTALINT}			printf("%s CONSTANT	TOctalInt %u SOURCEFILE SOURCELINE\n", yytext, lines);
{UNSIGNEDINT}		printf("%s CONSTANT	TUnsignedInt %u SOURCEFILE SOURCELINE\n", yytext, lines);
{SIGNEDINT}			printf("%s CONSTANT TSignedInt %u SOURCEFILE SOURCELINE\n", yytext, lines);


//CONSTENUM
//CONSTCHAR

{STRINGLITERAL}		printf("%s STRINGLITERAL TString %u SOURCEFILE SOURCELINE\n", yytext, lines);
{WS}				;
{NEWLINE}			lines++;

%%

int main()
{
    yylex();
    
    return 0;
}