package br.com.compiler.scanner;
%%
%public
%class LexicalAnalyzerExample
%{
private void print_value(String lexema, String descricao) {
 System.out.println(lexema + " - " + descricao);
}
%}
%int
%line
%column


BRANCO = [\n| |\t|\r]
SOMA = "+"
SUBTRACAO = "-"
MULTIPLICACAO = "*"
EXPONENCIAL = "**"
DIVISAO = "/"
PARENTESE = [\(|\)]*
INTEIROPOSITIVO = 0|[1-9][0-9]*
INTEIRONEGATIVO = \(-[0-9]*\)

%%
{BRANCO}                        { System.out.println(yytext() + " - " + "ESPA�O EM BRANCO"); }
{PARENTESE}                     { print_value(yytext(), "DELIMITADOR PARENTESE"); }
{SOMA}                          { print_value(yytext(), "OPERADOR DE SOMA"); }
{INTEIROPOSITIVO}               { print_value(yytext(), "N�MERO INTEIRO POSITIVO"); }
{INTEIRONEGATIVO}               { print_value(yytext(), "N�MERO INTEIRO NEGATIVO"); }
{MULTIPLICACAO}                 { print_value(yytext(), "MULTIPLICA��O"); }
{DIVISAO}                       { print_value(yytext(), "DIVISAO"); }
{SUBTRACAO}                     { print_value(yytext(), "SUBTRACAO"); }
{EXPONENCIAL}                   { print_value(yytext(), "EXPONENCIA��O"); }
. { throw new RuntimeException("Lexemas inv�lidos " + yytext()); }