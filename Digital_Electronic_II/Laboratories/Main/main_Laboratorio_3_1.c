#include <stdio.h>
int main(){
	int multiplicador, multiplicando,producto;
	int contador;
	int mask=1;
	multiplicador=0;
	multiplicando=0;
	producto=0;
	contador=0;
	printf("introduzca el multiplicador \n");	
	scanf("%d",&multiplicador);	
	printf("introduzca el multiplicando\n");
	scanf("%d",&multiplicando);
	for(contador=0;contador<32;contador++){
		if(multiplicador&mask)producto+=multiplicando;
		multiplicando=multiplicando<<1;
		multiplicador=multiplicador>>1;
	};
	printf("el producto es: %d\n",producto);
	printf("\n\n");	
	return 0;
};

