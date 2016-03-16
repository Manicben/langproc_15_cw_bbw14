/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TAuto = 258,
    TDouble = 259,
    TInt = 260,
    TStruct = 261,
    TBreak = 262,
    TElse = 263,
    TLong = 264,
    TSwitch = 265,
    TCase = 266,
    TEnum = 267,
    TRegister = 268,
    TTypedef = 269,
    TChar = 270,
    TExtern = 271,
    TReturn = 272,
    TUnion = 273,
    TConst = 274,
    TFloat = 275,
    TShort = 276,
    TUnsigned = 277,
    TContinue = 278,
    TFor = 279,
    TSigned = 280,
    TVoid = 281,
    TDefault = 282,
    TGoto = 283,
    TVolatile = 284,
    TDo = 285,
    TIf = 286,
    TStatic = 287,
    TWhile = 288,
    TSizeof = 289,
    TIdentifier = 290,
    TOpenBracket = 291,
    TCloseBracket = 292,
    TOpenRound = 293,
    TCloseRound = 294,
    TOpenBrace = 295,
    TCloseBrace = 296,
    TComma = 297,
    TColon = 298,
    TEqual = 299,
    TSemicolon = 300,
    TEllipsis = 301,
    THash = 302,
    TPeriod = 303,
    TArrow = 304,
    TIncrement = 305,
    TDecrement = 306,
    TBitwiseAnd = 307,
    TAsterisk = 308,
    TAdd = 309,
    TSubtract = 310,
    TBitwiseNot = 311,
    TLogicNot = 312,
    TDivide = 313,
    TModulo = 314,
    TLeftShift = 315,
    TRightShift = 316,
    TLessThan = 317,
    TGreaterThan = 318,
    TLessEqual = 319,
    TGreaterEqual = 320,
    TLogicEqual = 321,
    TNotEqual = 322,
    THat = 323,
    TBitwiseOr = 324,
    TAnd = 325,
    TOr = 326,
    TQuestion = 327,
    TMultEqual = 328,
    TDivEqual = 329,
    TModEqual = 330,
    TAddEqual = 331,
    TSubEqual = 332,
    TLeftShiftEqual = 333,
    TRightShiftEqual = 334,
    TAndEqual = 335,
    THatEqual = 336,
    TOrEqual = 337,
    TDoubleHash = 338,
    NEWLINE = 339,
    TConstInt = 340,
    TConstFloat = 341,
    TCharConst = 342,
    TStringLiteral = 343,
    THexInt = 344,
    TOctalInt = 345,
    TUnsignedInt = 346,
    TSignedInt = 347
  };
#endif
/* Tokens.  */
#define TAuto 258
#define TDouble 259
#define TInt 260
#define TStruct 261
#define TBreak 262
#define TElse 263
#define TLong 264
#define TSwitch 265
#define TCase 266
#define TEnum 267
#define TRegister 268
#define TTypedef 269
#define TChar 270
#define TExtern 271
#define TReturn 272
#define TUnion 273
#define TConst 274
#define TFloat 275
#define TShort 276
#define TUnsigned 277
#define TContinue 278
#define TFor 279
#define TSigned 280
#define TVoid 281
#define TDefault 282
#define TGoto 283
#define TVolatile 284
#define TDo 285
#define TIf 286
#define TStatic 287
#define TWhile 288
#define TSizeof 289
#define TIdentifier 290
#define TOpenBracket 291
#define TCloseBracket 292
#define TOpenRound 293
#define TCloseRound 294
#define TOpenBrace 295
#define TCloseBrace 296
#define TComma 297
#define TColon 298
#define TEqual 299
#define TSemicolon 300
#define TEllipsis 301
#define THash 302
#define TPeriod 303
#define TArrow 304
#define TIncrement 305
#define TDecrement 306
#define TBitwiseAnd 307
#define TAsterisk 308
#define TAdd 309
#define TSubtract 310
#define TBitwiseNot 311
#define TLogicNot 312
#define TDivide 313
#define TModulo 314
#define TLeftShift 315
#define TRightShift 316
#define TLessThan 317
#define TGreaterThan 318
#define TLessEqual 319
#define TGreaterEqual 320
#define TLogicEqual 321
#define TNotEqual 322
#define THat 323
#define TBitwiseOr 324
#define TAnd 325
#define TOr 326
#define TQuestion 327
#define TMultEqual 328
#define TDivEqual 329
#define TModEqual 330
#define TAddEqual 331
#define TSubEqual 332
#define TLeftShiftEqual 333
#define TRightShiftEqual 334
#define TAndEqual 335
#define THatEqual 336
#define TOrEqual 337
#define TDoubleHash 338
#define NEWLINE 339
#define TConstInt 340
#define TConstFloat 341
#define TCharConst 342
#define TStringLiteral 343
#define THexInt 344
#define TOctalInt 345
#define TUnsignedInt 346
#define TSignedInt 347

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 23 "exp.yacc" /* yacc.c:1909  */

	int num;
	char* id;
	exp_node *expnode;
	list<statement *> *stmts;
	statement *st;
	pgm *prog;

#line 247 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
