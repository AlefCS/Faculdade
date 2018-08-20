#include <stdio.h>

unsigned long fatorial(unsigned char n);

void main() {
	unsigned char n;

	scanf("%hhu", &n);
	printf("%hhu! = %lu\n", n, fatorial(n));
}