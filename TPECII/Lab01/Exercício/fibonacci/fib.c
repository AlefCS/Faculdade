#include <stdio.h>

unsigned long fib(unsigned short n);

void main() {
	unsigned short n;

	scanf("%hu", &n);
	printf("%luº Fibonacci: %d\n", n, fib(n));
}
