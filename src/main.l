
%{
#include<stdio.h>
#include <stdlib.h>

void yyerror(char *);
#include "y.tab.h"

%}


%%

[{] { 
  return CHAVEABERTA;}

[}] {
  return CHAVEFECHADA;
 }     

[\"][a-z A-Z 0-9]+[\"] {
	return PALAVRANUM;
}

["] {
  return ASPAS;
}

[:] {
  return DOISPONTOS; 
}

([0-9]*[.])?[0-9]+ {
	return NUMERO;
}

[\[] {
  return COLCHETEABERTO;
}

[\]] {
  return COLCHETEFECHADO;
}

[,] {
  return VIRGULA;
}

[\n] {};

[[:space:]] {};



[;] {};

. {};





%%

int yywrap()


 {
  return 1;
}
