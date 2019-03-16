%{

#include <stdio.h>
#include <string.h>

int soma_emails = 0;
int soma_unicamp = 0;
int soma_fee = 0;
#define INCREMENTA(a) a=(a+1)

%}


EMAIL 			[a-zA-Z0-9.]+[@][a-zA-Z0-9.]+
EMAIL_UNICAMP	[a-zA-Z0-9.]+[@][a-zA-Z0-9.]*(unicamp.br)
EMAIL_FEEC		[a-zA-Z0-9.]+[@][a-zA-Z0-9.]*(fee.unicamp.br)

%%

{EMAIL_FEEC} {INCREMENTA(soma_fee);}
{EMAIL_UNICAMP}	{INCREMENTA(soma_unicamp);}
{EMAIL}	{INCREMENTA(soma_emails);}


[[:space:]]+ ;
[[:^space:]]+ ;


%%

int main() {
  yylex();
  printf("%d %d %d\n", soma_emails+soma_unicamp+soma_fee, soma_unicamp+soma_fee, soma_fee);
  return 0;
}
