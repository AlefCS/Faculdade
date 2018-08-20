.text
.align 2
.globl soma
.type soma,@function

soma:                         # Label indicando o início da função de somar vetores
    lw   t0, 0(a0);           # Carrega o "primeiro" valor do vetor 1
    lw   t1, 0(a1);           # Carrega o "primeiro" valor do vetor 2
    add  t0, t0, t1;          # Soma os dois valores
    sw   t0, 0(a0);           # Guarda o valor da soma no vetor 1
    addi a2, a2, -1;          # Atualiza contador
    addi a0, a0,  4;          # Passa o ponteiro do vetor 1 para a próxima posição
    addi a1, a1,  4;          # Passa o ponteiro do vetor 2 para a próxima posição
    bnez a2, soma;            # Volta ao início da função se o contador não tiver atingido 0 (zero)

    ret;
