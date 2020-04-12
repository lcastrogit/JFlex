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
POTENCIA = "**"
DIVISAO = "/"
PARENTESE = [\(|\)]*
INTEIROPOSITIVO = 0|[1-9][0-9]*
INTEIRONEGATIVO = \-\d*\d

%%
{BRANCO}                        { System.out.println(yytext() + " - " + "ESPAÇO EM BRANCO"); }
{PARENTESE}                     { print_value(yytext(), "DELIMITADOR PARENTESE"); }
{SOMA}                          { print_value(yytext(), "SOMA"); }
{INTEIROPOSITIVO}               { print_value(yytext(), "NÚMERO INTEIRO POSITIVO"); }
{INTEIRONEGATIVO}               { print_value(yytext(), "NÚMERO INTEIRO NEGATIVO"); }
{MULTIPLICACAO}                 { print_value(yytext(), "MULTIPLICAÇÃO"); }
{DIVISAO}                       { print_value(yytext(), "DIVISAO"); }
{SUBTRACAO}                     { print_value(yytext(), "SUBTRACAO"); }
{POTENCIA}                      { print_value(yytext(), "POTENCIA"); }
. { throw new RuntimeException("Caractere inválido " + yytext()); }