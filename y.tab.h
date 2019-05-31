/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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
    tMAIN = 258,
    tAO = 259,
    tAF = 260,
    tCONST = 261,
    tINT = 262,
    tCHAR = 263,
    tSUPEQU = 264,
    tSUP = 265,
    tINFEQU = 266,
    tINF = 267,
    tTAB = 268,
    tBACK = 269,
    tESPACE = 270,
    tEQU = 271,
    tNOTEQU = 272,
    tPLUS = 273,
    tMOINS = 274,
    tETOILE = 275,
    tSLASH = 276,
    tPE = 277,
    tEAGLE = 278,
    tPO = 279,
    tPF = 280,
    tVI = 281,
    tPV = 282,
    tFIN = 283,
    tWHILE = 284,
    tIF = 285,
    tELSE = 286,
    tENTIER = 287,
    tID = 288,
    tPRINTF = 289,
    terror = 290,
    tAND = 291,
    tOR = 292,
    tTRUE = 293,
    tFALSE = 294
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tAO 259
#define tAF 260
#define tCONST 261
#define tINT 262
#define tCHAR 263
#define tSUPEQU 264
#define tSUP 265
#define tINFEQU 266
#define tINF 267
#define tTAB 268
#define tBACK 269
#define tESPACE 270
#define tEQU 271
#define tNOTEQU 272
#define tPLUS 273
#define tMOINS 274
#define tETOILE 275
#define tSLASH 276
#define tPE 277
#define tEAGLE 278
#define tPO 279
#define tPF 280
#define tVI 281
#define tPV 282
#define tFIN 283
#define tWHILE 284
#define tIF 285
#define tELSE 286
#define tENTIER 287
#define tID 288
#define tPRINTF 289
#define terror 290
#define tAND 291
#define tOR 292
#define tTRUE 293
#define tFALSE 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 21 "compiler.y" /* yacc.c:1909  */

	int e;
	char * e2;

#line 137 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
