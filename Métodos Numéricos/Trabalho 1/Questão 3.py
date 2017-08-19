#-*- coding: utf-8 -*-

def epsilon():

	epsilon = 1

	while(1 != 1 + epsilon/2):
		epsilon = epsilon/2


	return epsilon

# ----- PARTE I - SOLUÇÃO INTERVALO
# ## Solução:

# <!-- Não apague o div -->
# <div class="solucao alert alert-success">
#     <ol>
#         <h2><li>Criando conjunto de números</li></h2>
        
#         Para criarmos um conjunto de números para um máquina de 8 bits de palavra (1, 3, 4), iremos fazer uma analogia com o que é feito para uma máquina de 64 bits, precisão dupla, (1, 11, 52).

#         Para precisão dupla, ou seja 11 bits de expoente, podemos representar números de -1023 a 1024, com polarização. No caso da nossa máquina de 8 bits, 3 para expoente, é possível representar números de -3 a 4, também com polarização.

#         <h3>Cálculo para 64 bits:</h3>
#             Para 64 bits é feito da seguinte maneira:
#             <h4>*Overflow*</h4>
#                 $\pm 2^{1024}\approx1,8$x$10^{308}$
#             <h4>*Underflow*</h4>
#                 $\pm 2^{-1023}\approx1,1$x$10^{-308}$
    
#         <h3>Cálculo para 8 bits:</h3>
#             Agora iremos analogamente fazer o cálculo para definirmos o *overflow* e *underflow* da nossa máquina de 8 bits, com a diferença de que, como não é um número tão pequeno, iremos calcular o valor exato e para isso precisamos da mantissa:
#             <h4>*Overflow*</h4>
#             $\pm 1,1111_{2}$x$2^{4}=\pm1,9375_{10}$x$16=\pm31$
#             <h4>*Underflow*</h4>
#             $\pm 1,0000$x$2^{-3}=\pm0,125$
#             <h4>Definição do conjunto</h4>
#             Agora podemos descrever nosso conjunto da seguinte maneira:
#             $X = \{x \in \mathbb{R}\mid\left|x\right| < 31$ $e$ $\left|x\right| > 0,125\}$
#         <h2><li>Definindo $\varepsilon$ $(epsilon)$ para máquina de 8 bits</li></h2>
#             <ul>
#                 <li><h3>De acordo com o livro do Chapra:</h3></li>
#                     Na seção 3.4.1 do livro *Métodos Numéricos para Engenharia, 5a. Ed.* de *Steven Chapra & Raymond Canale* página 55 temos a seguinte fórmula, sendo $b$ a base numérica e $t$ o número de bits da mantissa: $\varepsilon = b^{1-t}$  
#                     Aplicando ao nosso caso:  
#                     $\varepsilon=2^{1-4}=2^{-3} \Rightarrow \varepsilon = 0,125$
#                 <li><h3>Analogamente ao $\varepsilon$ da máquina 64 bits:</h3></li>
#                 Na máquina de 64 bits temos: $\varepsilon = 2^{-52} = b^{-t}$  
#                 Logo, para nossa máquina de 8 bits:  
#                 $\varepsilon = 2^{-4} \Rightarrow \varepsilon = 0,0625$
#             </ul>
#     </ol>
# <!-- Não apague o div -->
# </div>


print(epsilon())