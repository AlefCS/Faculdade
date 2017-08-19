#-*- coding: utf-8 -*-

def f(x):
    #Alterar valor de retorno para função desejada
    return x**2 - 1

def ModifiedSecant(f, x, delta, tol):
    cont = 0
    while abs(f(x)) > tol:
        x = x - f(x)*delta/(f(x + delta) - f(x))
        cont += 1
        if cont > 1000:
            print("Número máximo de iterações atingido.")
    
    return [cont, x]

resultado = ModifiedSecant(f, 10, 0.0000001, 0.0000000001)
print("Nº de iterações          X")
print("{}                      {}".format(resultado[0], resultado[1]))