.text
.align 2
.globl fibonacci
.type fibonacci,@function

fibonacci:                    # Label indicando o início da função fatorial
	beqz a0, fib0;            # Se o fibonacci a ser calculado for Fib(0), ir para fib0
	li   t0,    0;            # Inicializa o anterior do anterior
	li   t1,    1;            # Inicializa o anterior

loop_i:                       # Label para o início do loop
	addi a0, a0, -1;          # Subtrai 1 do contador
	beqz a0, loop_f;          # Se o contador chegar a 0 (zero) pular para o fim do loop

	add  t2, t0, t1;          # Soma o anterior com o anterior do anterior
	mv   t0, t1;              # O anterior agora é o anterior do anterior
	mv   t1, t2;              # O que acaba de ser calculado agora é o anterior
	j loop_i;                 # Volta para o começo do loop

loop_f:                       # Label para após o fim do loop
	mv a0, t1;                # Passagem do valor de retorno

	ret;

fib0:
	li a0, 0;                 # Passagem do valor de retorno do Fib(0)

	ret;
