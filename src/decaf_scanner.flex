/**
 * This class is a scanner for Decaf.
 */
 import java.io.*;
import java_cup.runtime.*;

%%
%class DecafScanner
%standalone
%unicode
%line
%column

%cup


%{
    private Symbol symbol(int type) {
        System.err.println("Obtain token " + "----" + yytext() + "----" );
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        System.err.println("Obtain token " + "----" + yytext() + "----" );
        return new Symbol(type, yyline, yycolumn, value);
    }

%}



/* definitions */
DIGIT           = [0-9]
NUM             = {DIGIT}+
DOUBLENUM       = {DIGIT}+\.{DIGIT}*
LETTER          = [a-zA-Z]
IDENTIFIER      = [a-zA-Z][_0-9a-zA-Z]*
STRING          = \"[^\n\"]*\"
LineTerminator  = \r|\n|\r\n
WhiteSpace      = {LineTerminator} | [ \t\f]
SINGCOMMENT     = \/\/.*
DOUBLE_SCI      = ({DOUBLENUM}[Ee][\+\-]{DIGIT}+)


%%
/* reserved keywords */
"void"          { System.out.print(" void "); return symbol(sym.VOID);}
"int"           { System.out.print(" int "); return symbol(sym.INT);}
"double"        { System.out.print(" double "); return symbol(sym.DOUBLE);}
"bool"          { System.out.print(" boolean "); return symbol(sym.BOOL);}
"true"          { System.out.print(" true "); return symbol(sym.TRUE);}
"false"         { System.out.print(" false "); return symbol(sym.FALSE);}
"string"        { System.out.print(" string "); return symbol(sym.STR);}
"class"         { System.out.print(" class "); return symbol(sym.CLASS);}
"interface"     { System.out.print(" interface "); return symbol(sym.INTERF);}
"null"          { System.out.print(" null "); return symbol(sym.NULL);}
"this"          { System.out.print(" this "); return symbol(sym.THIS);}
"extends"       { System.out.print(" extends "); return symbol(sym.EXTENDS);}
"implements"    { System.out.print(" implements "); return symbol(sym.IMPLEM);}
"for"           { System.out.print(" for "); return symbol(sym.FOR);}
"while"         { System.out.print(" while "); return symbol(sym.WHILE);}
"if"            { System.out.print(" if "); return symbol(sym.IF);}
"else"          { System.out.print(" else "); return symbol(sym.ELSE);}
"return"        { System.out.print(" return "); return symbol(sym.RETURN);}
"break"         { System.out.print(" break "); return symbol(sym.BREAK);}
"new"           { System.out.print(" new "); return symbol(sym.NEW);}
"NewArray"      { System.out.print(" newarray "); return symbol(sym.NEW_ARRAY);}
"Print"         { System.out.print(" print "); return symbol(sym.PRINT);}
"ReadInteger"   { System.out.print(" readInteger "); return symbol(sym.READINT);}
"ReadLine"      { System.out.print(" readline "); return symbol(sym.READLN);}

/* operators */
"+"       { System.out.print(" + "); return symbol(sym.PLUS);}
"-"       { System.out.print(" - "); return symbol(sym.MINUS);}
"*"       { System.out.print(" * "); return symbol(sym.TIMES);}
"/"       { System.out.print(" / "); return symbol(sym.DIVIDE);}
"%"       { System.out.print(" % "); return symbol(sym.MOD);}
"<"       { System.out.print(" < "); return symbol(sym.LT);}
"<="      { System.out.print(" <= "); return symbol(sym.LESS_EQ);}
">"       { System.out.print(" > "); return symbol(sym.GT);}
">="      { System.out.print(" >= "); return symbol(sym.GREATER_EQ);}
"="       { System.out.print(" = "); return symbol(sym.ASSIGN);}
"=="      { System.out.print(" == "); return symbol(sym.EQ);}
"!="      { System.out.print(" != "); return symbol(sym.NOT_EQ);}
"&&"      { System.out.print(" and "); return symbol(sym.AND);}
"||"      { System.out.print(" or "); return symbol(sym.OR);}
"!"       { System.out.print(" not "); return symbol(sym.NOT);}
";"       { System.out.print(" ; "); return symbol(sym.SEMICOLON);}
","       { System.out.print(" , "); return symbol(sym.COMMA);}
"."       { System.out.print(" . "); return symbol(sym.DOT);}
"["       { System.out.print(" [ "); return symbol(sym.OPEN_BRACKET);}
"]"       { System.out.print(" ] "); return symbol(sym.CLOSE_BRACKET);}
"("       { System.out.print(" ( "); return symbol(sym.OPEN_PAREN);}
")"       { System.out.print(" ) "); return symbol(sym.CLOSE_PAREN);}
"{"       { System.out.print(" { "); return symbol(sym.OPEN_BRACE);}
"}"       { System.out.print(" } "); return symbol(sym.CLOSE_BRACE);}

{STRING}
  { System.out.print(yytext()); return symbol(sym.STRING); }
{NUM}
  { System.out.print(yytext()); return symbol(sym.NUM);}
{DOUBLENUM}
  { System.out.print(yytext()); return symbol(sym.DOUBLENUM); }
{DOUBLE_SCI}
  { System.out.print(yytext()); return symbol(sym.DOUBLE_SCI); }
{IDENTIFIER}
  { System.out.print(yytext()); return symbol(sym.IDENTIFIER); }
{LineTerminator}
  { /*skip*/}
{SINGCOMMENT}
  { /*skip*/}
{WhiteSpace}
  { /*skip*/}
[^]
  { throw new Error("Illegal character <" + yytext() + ">"); }
<<EOF>>
  { return symbol(sym.EOF); }
