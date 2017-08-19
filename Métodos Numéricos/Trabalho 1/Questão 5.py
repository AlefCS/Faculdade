#-*- coding: utf-8 -*-

from decimal import *

def p(x):
    #p(x) = x³ - 7x² + 8x - 0.35
    x = float(format(x, '.3g'))
    termos = [float(format(x*x, '.3g')), float(format(x*x, '.3g')), float(format(8*x, '.3g')), -0.35]
    termos[0] = float(format(termos[0]*x, '.3g'))
    termos[1] = float(format(-7*termos[1], '.3g'))
    print(termos)
    y = 0
    for i in range(len(termos)):
        y = float(format(y + termos[i], '.3g'))

    return y

def pMod(x):
    #p(x) = ((x - 7)x + 8)x - 0.35
    x = float(format(x, '.3g'))
    y = float(format(x - 7, '.3g'))
    y = float(format(y*float(format(x, '.3g')), '.3g'))
    y = float(format(y + 8, '.3g'))
    y = float(format(y*float(format(x, '.3g')), '.3g'))
    y = float(format(y - 0.35, '.3g'))

    return y

x = 1.37
y = x**3 - 7*x**2 + 8*x - 0.35
print("Para x = {}".format(x))
print("    Valor exato = {}".format(y))
print("    p(x) = {}".format(p(x)))
print("    pMod(x) = {}".format(pMod(x)))