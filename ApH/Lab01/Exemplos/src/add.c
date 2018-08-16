#include <stdio.h>

int add(int a, int b);

int main() {
	int res = add(3, 2);
	printf("res = %d\n", res);

	return res == 5 ? 0 : -1;
}
