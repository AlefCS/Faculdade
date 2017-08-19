#-*- coding: utf-8 -*-

import numpy as np

def f(x):
    #Alterar valor de retorno para função desejada
    return x**2 - np.exp(-x)

def RegulaFalsi(f, a, b, tol):

    if f(a)*f(b) > 0:
        print("ERRO! Intervalo inválido!")
        return "##"

    i = 0
    while i == 0 or abs(f(Xi)) > tol:
        Xi = (a*f(b) - b*f(a))/(f(b) - f(a))
        if f(a)*f(Xi) < 0:
            b = Xi
        else:
            a = Xi
        i = i + 1
        Xi = (a*f(b) - b*f(a))/(f(b) - f(a))
        if i > 1000:
            print("Número máximo de iterações atingido.")
            break
    return [i, Xi]

def ModifiedRegulaFalsi(f, a, b, tol):

    if f(a)*f(b) > 0:
        print("ERRO! Intervalo inválido!")
        return "##"

    i = 0
    i_a = 0
    i_b = 0
    while i == 0 or abs(f(Xi)) > tol:
        Xi = (a*f(b) - b*f(a))/(f(b) - f(a))
        i = i + 1
        if f(a)*f(Xi) < 0:
            b = Xi
            i_b = 0
            i_a = i_a + 1
        else:
            a = Xi
            i_a = 0
            i_b = i_b + 1
        if i_a >= 3:
            Xi = (a*f(b) - b*f(a)/2)/(f(b) - f(a)/2)
        elif i_b >= 3:
            Xi = (a*f(b)/2 - b*f(a))/(f(b)/2 - f(a))
        else:
            Xi = (a*f(b) - b*f(a))/(f(b) - f(a))
        if i > 1000:
            print("Número máximo de iterações atingido.")
            break

    return [i, Xi]

#Alterando o valor da tolerância é possível ver a diferença entre os métodos
result_orig = RegulaFalsi(f, 0, 1, 0.001)
result_mod = ModifiedRegulaFalsi(f, 0, 1, 0.001)
print("Método               Nº de iterações              Xns")
print("Falsa Posição            {}                    {}".format(result_orig[0], result_orig[1]))
print("Modificada               {}                    {}".format(result_mod[0], result_mod[1]))