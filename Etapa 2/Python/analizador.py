import ply.lex
import ply.yacc as yacc
import sys
import re

tokens = [ 'OP_COMP','OP_NEG','OP_ASIG','OP_ARIT','OP_SEP_PARAM','OP_HEREN','OP_REF_PADRE','OP_REF_INST',
    'COMLINEA','COMLINEAS','STRING','IDENTIFICADOR','ENTERO','REAL', 
    'OP_ABRIR_PARENT', 'OP_CERRAR_PARENT' , 'OP_ABRIR_LLAVE' , 'OP_CERRAR_LLAVE' , 'OP_ABRIR_ARREGLO' , 'OP_CERRAR_ARREGLO' , 'OP_PUNTO_COMA']
reserved = {
	'fnc' : 'FNC',
    'whl' : 'WHL',
    'return' : 'RETURN',
    'if' : 'IF',
    'else' : 'ELSE',
    'fr' : 'FR',
    'class' : 'CLASS',
    'virtual' : 'VIRTUAL',
    'override' : 'OVERRIDE',
    'int' : 'INT',
    'double' : 'DOUBLE',
    'float' : 'FLOAT',
    'char' : 'CHAR',
    'str' : 'STR'
}
tokens += reserved.values()

t_PARENTAB = r'\('
t_PARENTCER = r'\)'
t_LLAVAB = r'\{'
t_LLAVCER = r'\}'
t_CUADAB = r'\['
t_CUADCER = r'\]'
t_PUNTCOMA = r';'
t_OP_COMP = r'(<|>|==|<=|>=)'
t_OP_NEG = r'!'
t_OP_ASIG = r'='
t_OP_ARIT = r'(\+|-|\*|\/)'
t_OP_SEP_PARAM = r','
t_OP_HEREN = r':'
t_OP_REF_PADRE = r'::'
t_OP_REF_INST = r'\.'

t_OP_ABRIR_PARENT = r'\('
t_OP_CERRAR_PARENT = r'\)'
t_OP_ABRIR_LLAVE = r'\{'
t_OP_CERRAR_LLAVE = r'\}'
t_OP_ABRIR_ARREGLO = r'\[' 
t_OP_CERRAR_ARREGLO = r'\]'
t_OP_PUNTO_COMA = r'\;'

def t_COMLINEA(t):
	r'(\/\/.*)'
    	return t

def t_COMLINEAS(t):
	r'(\/\*(.|\n)*?\*\/)'
	return t

def t_IDENTIFICADOR(t):
    r'([_a-zA-Z][_a-zA-Z0-9]*)'
    if t.value in reserved:
        t.type = reserved[ t.value ]
    return t

t_ENTERO = r'(-?[0-9]+)'
t_REAL = r'(-?[0-9]+\.[0-9]+(E[-?0-9])?)'
def t_newline(t):
    r'\n+'
def t_COMLINEA(t):
     r'\/\/.*'
     return t
t_COMLINEAS = r'\/\*(.|\n)*?\*\/'
t_STRING = r'\".+\"'
t_ignore = ' \t'

def t_error(t):
    print 'Illegal character'
    t.lexer.skip(1)

lexer = ply.lex.lex()
texto = ""
with open(sys.argv[1], 'r') as myfile:
	texto = myfile.read()
lexer.input(texto)

while True:
    tok = lexer.token()
    if not tok:
        break
    print tok
