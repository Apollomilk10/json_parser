/*
/* Data de submissao: 
 * Nome: Lucas Leite Tavares  
 * RA: 156377
 */

%{

#include <stdio.h>
#include <stdlib.h>


void yyerror(char *c);
int yylex(void);
 
int valido = 0;

%}


%token CHAVEABERTA CHAVEFECHADA ASPAS VIRGULA PALAVRANUM DOISPONTOS NUMERO COLCHETEABERTO COLCHETEFECHADO 



%%
 JSON:
	CHAVEABERTA TEXTO CHAVEFECHADA {valido = 1;}
  ;

TEXTO:
	PALAVRANUM DOISPONTOS VALOR; 
	|ASPAS PALAVRANUM ASPAS VALOR;
	|TEXTO VIRGULA TEXTO; 
	|JSON;
	;
    	
VALOR:
	PALAVRANUM;
	|NUMERO;
	|JSON;
	|COLCHE ;
   	;

COLCHE:
	COLCHETEABERTO EMCOLCHE COLCHETEFECHADO;
	|COLCHETEABERTO COLCHETEFECHADO;
	;

EMCOLCHE:
	VALOR;
	|VALOR VIRGULA EMCOLCHE;
	;


%%

void yyerror(char *s) {

  
}

int main() {
  
  	yyparse();

	if(valido == 1) {
      printf("VALIDO\n");
    } else {
      printf("INVALIDO\n");
    }
  return 0;

}


/*
JSON:
  CHAVEABERTA TEXTO CHAVEFECHADA {i = 1;};
;

TEXTO:
  FRASE DOISPONTOS VALOR   {printf("1 e %d\n", i);}
  |TEXTO VIRGULA TEXTO
  |JSON {printf("3\n");}
;
FRASE:
  ASPAS PALAVRANUM ASPAS
;

COMPOSICAO:
  COLCHETEABERTO COMP1 COLCHETEFECHADO
;

COMP1:
  FRASE VIRGULA FRASE
;
VALOR:
  NUMERO{printf("4\n");}
  |PALAVRA{printf("5\n");}
  |COMPOSICAO
;
*/