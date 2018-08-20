#include <stdio.h>

unsigned long fibonacci(unsigned short n);

void main() {
	unsigned short n;

	scanf("%hu", &n);
	printf("%huº Fibonacci: %lu\n", n, fibonacci(n));
}
