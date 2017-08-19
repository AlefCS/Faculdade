#-*- coding: utf-8 -*-

import math

def decToI3E(x, prec):
	if x >= 0:
		i3e = "0"
	else:
		i3e = "1"
		x = abs(x)
	i3e = i3e + "|"
	num = math.frexp(x)
	mantissa = num[0]*2 - 1
	expoente = num[1] - 1

	if prec == False:
		expoente = expoente + 127
	else:
		expoente = expoente + 1023
	expoente = str(bin(expoente))
	expoente = expoente[2:]
	if prec == False:
		i3e = i3e + "0"*(8 - len(expoente)) + expoente
	else:
		i3e = i3e + "0"*(11 - len(expoente)) + expoente
	i3e = i3e + "|"
	#
	cont = 0
	if prec == False:
		while mantissa != 1 and cont < 23:
			mantissa = mantissa*2
			cont = cont + 1
			if mantissa > 1:
				mantissa = mantissa - 1
				i3e = i3e + '1'
			else:
				i3e = i3e + '0'
		i3e = i3e + "0"*(23 - cont)
	else:
		while mantissa != 1 and cont < 52:
			mantissa = mantissa*2
			cont = cont + 1
			if mantissa > 1:
				mantissa = mantissa - 1
				i3e = i3e + '1'
			else:
				i3e = i3e + '0'
		i3e = i3e + "0"*(52 - cont)		

	return i3e

print(decToI3E(1.45135, 1))