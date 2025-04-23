#include<stdio.h>
#include<locale.h>

int main(){


int n1,n2, resultado;

setlocale(LC_ALL,"portuguese");

printf("insira o primeiro numero");
scanf("%d",&n1);

printf("insira o segundo numero");
scanf("%d",&n2);

resultado = n1 + n2;

printf("a resposta de %d + %d = %d\n", n1, n2, resultado);

return 0;
}



int main(){

	float lado, area;
	
	printf("insira o lado do quadrado");
	scanf("%f",&lado);
	
	area= lado * lado;
	
	printf("a area do quadrado %2f é %.2f\n", lado, area);
	
return 0;
}


int main(){
	
	float celsius, fahrenheit;
	
	printf("digite a temperatura em celsius");
	scanf("%f",&celsius);
	
	fahrenheit = (celcius * 9/5) + 32;
	
	printf("%.2f graus cecius equivale a %.2f graus em fahrenheit", celsius, fahrenheit);
}









