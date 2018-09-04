%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%option c++
%option outfile="Scanner.cpp"
%option noyywrap

COMLINEA  (\/\/.*)
COMLINEAS  (\/\*(.|\n)*?\*\/)
STRING (\".+?\")

FNC fnc
RETURN return
IF if
ELSE else
WHL whl
FR fr
CLASS class
VIRTUAL virtual
OVERRIDE override

OP_COMP (<|>|==|<=|>=)
OP_NEG  !
OP_ASIG =
OP_ARIT (\+|-|\*|\/)
OP_SEP_PARAM ,
OP_HEREN :
OP_REF_PADRE ::
OP_REF_INST \.

INT int
FLOAT float
DOUBLE double
CHAR char
STR str

PARENTAB \(
PARENTCER \)
LLAVAB \{
LLAVCER \}
CUADAB \[
CUADCER \]
PUNTCOMA ;

IDENTIFICADOR ([a-zA-Z][_a-zA-Z0-9]*)
ENTERO (-?[0-9]+)
REAL (-?[0-9]+\.[0-9]*(E-?[0-9]+)?)

IGNORAR " "|\t|\n

ERROR .
%%

{COMLINEAS} {
  printf("%s - Comentario de varias lineas\n", yytext);
}
{STRING} {
  printf("%s - String\n", yytext);
}
{COMLINEA} {
  printf("%s - Comentario de una linea\n", yytext);
}

{FNC}       {printf("%s - Declaración de funcion\n", yytext);}
{RETURN}    {printf("%s - Retornar\n", yytext);}
{IF}        {printf("%s - Condicional if\n", yytext);}
{ELSE}      {printf("%s - Condicional else\n", yytext);}
{WHL}       {printf("%s - Ciclo whl\n", yytext);}
{FR}        {printf("%s - Ciclo fr\n", yytext);}
{CLASS}     {printf("%s - Declaración de clase\n", yytext);}
{VIRTUAL}   {printf("%s - Palabra reservada virtual\n", yytext);}
{OVERRIDE}  {printf("%s - Palabra reservada override\n", yytext);}

{OP_COMP}   {printf("%s - Operacion de comparación\n", yytext);}
{OP_NEG}    {printf("%s - Operacion de negación\n", yytext);}
{OP_ASIG}   {printf("%s - Operacion de asignacion\n", yytext);}
{OP_ARIT}   {printf("%s - Operacion Aritmetica\n", yytext);}
{OP_SEP_PARAM}   {printf("%s - Separacion de parametros\n", yytext);}
{OP_HEREN}       {printf("%s - Herencia\n", yytext);}
{OP_REF_PADRE}   {printf("%s - Referncia al padre\n", yytext);}
{OP_REF_INST}    {printf("%s - Refernciaa instancia\n", yytext);}

{INT}     {printf("%s - Tipo de dato int\n", yytext);}
{FLOAT}   {printf("%s - Tipo de dato float\n", yytext);}
{DOUBLE}  {printf("%s - Tipo de dato double\n", yytext);}
{CHAR}    {printf("%s - Tipo de dato char\n", yytext);}
{STR}     {printf("%s - Tipo de dato str\n", yytext);}

{PARENTAB} 			{printf("%s - Parentesis abrir\n", yytext);}
{PARENTCER} 			{printf("%s - Parentesis cerrar\n", yytext);}
{LLAVAB} 			{printf("%s - Llave abrir\n", yytext);}
{LLAVCER} 			{printf("%s - Llave cerrar\n", yytext);}
{CUADAB}			{printf("%s - Tamano arreglo abrir\n", yytext);}
{CUADCER} 			{printf("%s - Tamano arreglo cerrar\n", yytext);}
{PUNTCOMA} 			{printf("%s - Delimitador instruccion\n", yytext);}

{IDENTIFICADOR} {printf("%s - Identificador\n", yytext);}
{ENTERO} 	{printf("%s - Numero entero\n", yytext);}
{REAL} 		{printf("%s - Numero real\n", yytext);}

{IGNORAR} {;}
{ERROR} {printf("%d - Error lexico\n", atoi(yytext));}
%%
