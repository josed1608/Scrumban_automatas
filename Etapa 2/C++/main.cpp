#include <FlexLexer.h>
#include <iostream>
#include <fstream>

int main(int argc, char *argv[]){
  if(argc=2){
    std::ifstream in(argv[1]);
    yyFlexLexer* lexer = new yyFlexLexer(&in);
    while(lexer->yylex() != 0){
      ;
    }
  }
  else{
    printf("Faltan argumentos");
  }
  return 0;
}
