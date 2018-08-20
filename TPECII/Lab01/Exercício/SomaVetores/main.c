#include <stdio.h>
#include <stdlib.h>

void soma(int* p1, int* p2, int n);

void main() {
	int n = 10;
	int p1[10] = { 1,  2,  3,  4,  5,  6,  7,  8,  9, 10};
	int p2[10] = {12, 54, 81, 31, 83, 41, 17, 13, 32, 94};

	printf("Vetor 1: ");
	for (int i = 0; i < n; i++)	{
		printf("%3d ", p1[i]);
	}
	printf("\n");

	printf("Vetor 2: ");
	for (int i = 0; i < n; i++)	{
		printf("%3d ", p2[i]);
	}
	printf("\n");

	soma(p1, p2, n);

	printf("Vetor S: ");
	for (int i = 0; i < n; i++)	{
		printf("%3d ", p1[i]);
	}
	printf("\n");
}