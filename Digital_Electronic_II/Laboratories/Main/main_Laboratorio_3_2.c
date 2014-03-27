# include<stdio.h>
int main(){
	int multiplicador,multiplicando,producto,contador;
	multiplicador=0;
	multiplicando=0;
	producto=0;
	contador=0;
	printf("Introduzca el multiplicador\n");
	scanf("%d", &multiplicador);
	printf("Introduzca el multiplicando\n");
	scanf("%d", &multiplicando);
	for (contador=0; contador<multiplicador; contador++){
        	producto+=multiplicando;                                        
	};
	printf("El producto es %d\n", producto	);
	return 0;
 }
