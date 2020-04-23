/*
/* Data de submissao: 23/04/2020
 * Nome: Lucas Leite Tavares  
 * RA: 156377
 */

%{
#include<stdio.h>
#include <stdlib.h>

void yyerror(char *);
#include "y.tab.h"

%}

/*Nosso dicionário de Tokens, que faz a ligação sintática entre os programas*/
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
