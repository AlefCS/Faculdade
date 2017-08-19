#-*- coding: utf-8 -*-

import math as math
from decimal import *

def truncar(x, n):
    getcontext().prec=n
    if x < 0:
    	getcontext().rounding=ROUND_CEILING
	else:
		getcontext().rounding=ROUND_FLOOR
    
    return float(Decimal(x)*Decimal(1))

def n8McLaurin(x):
	v_exato = truncar(math.cos(x), 8)
	y = y + (((-1)**i)*(x**(2*i)))/(math.factorial(2*i))
	i = 1
	while(v_exato != truncar(y)):
		y = y + (((-1)**i)*(x**(2*i)))/(math.factorial(2*i))
		i = i + 1

	return i

print(n8McLaurin(0.3*math.pi))