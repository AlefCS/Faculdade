#-*- coding: utf-8 -*-

aurea = (1 + 5**0.5)/2

def f(x):
    #Alterar valor de retorno para função desejada
    return x**2 - 16

#Função GoldenSection sem verificação, deixando o maior pedaço sempre do mesmo lado
def GoldenSection(f, a, b, tol):
    if f(a)*f(b) > 0:
        print("ERRO! Intervalo inválido!")
        return "##"
    else:
        i = 0
        while i == 0 or abs(f(Xi)) > tol :
            i += 1
            Xi = (aurea*b + a)/(1 + aurea)
            if f(Xi)*f(a) < 0:
                b = Xi
            else:
                a = Xi
            if i > 1000:
                print("Número máximo de iterações atingido.")
                break

        return [i, Xi]

#GoldenSection com verificação para utilizar o menor pedaço do intervalo
def ModGoldenSection(f, a, b, tol):
    if f(a)*f(b) > 0:
        print("ERRO! Intervalo inválido!")
        return "##"
    else:
        i = 0
        while i == 0 or abs(f(Xi)) > tol:
            i += 1
            Xi = (aurea*b + a)/(1 + aurea)
            X2 = (aurea*a + b)/(1 + aurea)
            if abs(f(X2)) < abs(f(Xi)):
                Xi = X2
                if f(Xi)*f(a) < 0:
                    b = Xi
                else:
                    a = Xi
            else:
                if f(Xi)*f(a) < 0:
                    b = Xi
                else:
                    a = Xi
            if i > 1000:
                print("Número máximo de iterações atingido.")
            break

        return [i, Xi]



def Bissection(f, a, b, tol):
    if f(a)*f(b) > 0:
        print("ERRO! Intervalo inválido!")
        return "##"
    else:
        i = 0
        while i == 0 or abs(f(Xi)) > tol:
            i += 1
            Xi = (a + b)/2
            if f(Xi)*f(a) < 0:
                b = Xi
            else:
                a = Xi
            if i > 1000:
                print("Número máximo de iterações atingido.")
                break

        return [i, Xi]

result_bissec = Bissection(f, 0, 3, 0.001)
result_orig = GoldenSection(f, 0, 3, 0.001)
result_mod = ModGoldenSection(f, 0, 3, 0.001)
print("Método               Nº de iterações              Xns")
print("Bisseção                  {}                    {}".format(result_bissec[0], result_bissec[1]))
print("GoldenSection             {}                    {}".format(result_orig[0], result_orig[1]))
print("ModGoldenSection          {}                    {}".format(result_mod[0], result_mod[1]))