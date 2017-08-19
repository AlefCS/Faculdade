#include <stdio.h>
#include <stdbool.h>
#include <math.h>

char* i3e;

char* decToI3E(double decimal, bool prec);

int main(int argc, char const *argv[]) {
	double x;
	bool prec;
	char* s;
	printf("Digite o numero a ser convertido: ");
	scanf("%lf", &x);
	printf("\nEscolha uma precisao <0=simples | 1=dupla>: ");
	scanf("%d", &prec);
	if (prec == 0) {
		s = (char*) malloc(33*sizeof(char));
	} else {
		s = (char*) malloc(65*sizeof(char));
	}
	s = decToI3E(x, prec);
	printf("%s\n", s);

	free(i3e);
	free(s);

	return 0;
}

char* decToI3E(double decimal, bool prec) {
	int i, j, k;
	__int64 inteiro;
	int expoente = 0;

	if (prec == false) { //Precisão simples
		float f_decimal = (float) decimal;
		i3e = (char*) calloc(35, sizeof(char));
		i3e[1] = '|'; i3e[10] = '|';
		if (f_decimal >= 0.0) i3e[0] = '0';
		else i3e[0] = '1';
		f_decimal = fabs(f_decimal);
		if (f_decimal >= 1.0) {
			while(f_decimal >= 2.0) {
				f_decimal = f_decimal/2.0;
				expoente++;
			}
		} else {
			while(f_decimal < 1.0) {
				f_decimal = f_decimal*2.0;
				expoente--;
			}
		}
		expoente = expoente + 127;
		f_decimal = f_decimal - 1;
		for (i = 0; i < 8; i++) {
			i3e[i + 2] = (1<<7 & expoente<<i) ? '1':'0';
		}

		for (i = 1; i <= 23 && f_decimal != ceil(f_decimal); i++) {
			f_decimal = f_decimal*2.0;
		}

		inteiro = round(f_decimal);
		k = 23 - i;
		for (j = 0; j < 23; j++) {
			k++;
			i3e[j + 11] = (1<<22 & inteiro<<k) ? '1':'0';
		}

		return i3e;
	} else { //Precisão dupla
		i3e = (char*) calloc(67, sizeof(char));
		i3e[1] = '|'; i3e[13] = '|';
		if (decimal >= 0.0) i3e[0] = '0';
		else i3e[0] = '1';
		decimal = (float) fabs(decimal);
		if (decimal >= 1.0) {
			while(decimal >= 2.0) {
				decimal = decimal/2.0;
				expoente++;
			}
		} else {
			while(decimal < 1.0) {
				decimal = decimal*2.0;
				expoente--;
			}
		}
		expoente = expoente + 1023;
		decimal = decimal - 1;
		for (i = 0; i < 11; i++) {
			i3e[i + 2] = (1<<10 & expoente<<i) ? '1':'0';
		}

		for (i = 1; i <= 52 && decimal != ceil(decimal); i++) {
			decimal = decimal*2.0;
		}
		inteiro = round(decimal);
		for (j = 1; j <= 52; j++) {
			if (j < i) {
				i3e[j + 13] = (1<<(i - 1) & inteiro<<j) ? '1':'0';
			} else {
				i3e[j + 13] = '0';
			}
		}

		return i3e;
	}
}