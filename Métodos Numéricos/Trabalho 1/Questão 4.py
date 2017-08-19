#-*- coding: utf-8 -*-

import numpy as np
import scipy.misc as fat

def e1(x, N):
	s = 0
	for i in range(N + 1):
		if i % 2 == 0:
			s = s + x**i/fat.factorial(i, exact=True)
		else:
			s = s - x**i/fat.factorial(i, exact=True)
	return s

def e2(x, N):
	s = 0
	for i in range(N + 1):
		s = s + x**i/fat.factorial(i, exact=True)

	return 1/s

def criarCabecalho(x, N):
	tam_i = len(str(N))
	tam_resultado = len(str(e2(x, N)))
	print("i", " "*(tam_i + 1), "Método   Resultado", " "*(tam_resultado - 6), "Erro relativo")
	tam_total = len("i") + (tam_i + 1) + len("Método   Resultado") + (tam_resultado - 6) + 21

	return [tam_i+2, tam_resultado+3, tam_total]

def imprimirResultado(x, N):
	espacos = criarCabecalho(x, N)

	for i in range(N + 1):
		print("-"*espacos[2])
		x1 = e1(x, i)
		x2 = e2(x, i)
		x3 = np.exp(-x)
		erro_x1 = abs((x3 - x1)/x3)
		erro_x2 = abs((x3 - x2)/x3)
			
		print(i, " "*(espacos[0] - len(str(i))), "1       ", x1, " "*(espacos[1] - len(str(x1))), erro_x1)
		print(" "*(espacos[0] + 1), "2       ", x2, " "*(espacos[1] - len(str(x2))), erro_x2)
		print(" "*(espacos[0] + 1), "Exato   ", x3, " "*(espacos[1] - len(str(x2))))

imprimirResultado(5, 100)