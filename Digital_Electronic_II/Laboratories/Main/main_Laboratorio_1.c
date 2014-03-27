#include "soc-hw.h"
/*prototypes */
uint32_t read_uint32()
{
	uint32_t val = 0, i;
    for (i = 0; i < 4; i++) {
        val <<= 8;
        val += (uint8_t)uart_getchar();
    }
    return val;
}

int main(int argc, char **argv)
{
	// Initialize UART
	uart_init();
	
	char a,b,c;
	a= uart_getchar();
	b= uart_getchar();
	c= a+b;
	uart_putchar(c);
}
