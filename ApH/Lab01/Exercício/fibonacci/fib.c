#include <stdio.h>

unsigned long fib(unsigned short n);

void main() {
	unsigned short n;

	scanf("%hu", &n);
	printf("%lu Fibonacci: %d\n", n, fib(n));
}
