.text
.align 2
.globl fatorial
.type fatorial,@function

fatorial:                       # Label indicando o início da função fatorial
    bnez a0, recurs_i;          # Se não for o caso base (fatorial de 0) então fazer um branch para o início da recursão
    li   a0, 1;                 # Passando o valor de retorno do caso base

    ret;

recurs_i:                       # Início da recursão
    addi sp, sp, -8;            # Movendo o ponteiro de pilha para sua nova posição
    sw   ra,  4(sp);            # Salva o registro de endereço na pilha
    sw   a0,  0(sp);            # Salva o argumento de entrada na pilha
    addi a0, a0, -1;            # Passagem do argumento de entrada da chamada recursiva
    jal fatorial;               # Chamada recursiva

    lw   t0, 0(sp);             # Carrega o argumento de entrada da pilha e salva num registrador temporário (já que o a0 contém o valor de retorno da chamada recursiva)
    lw   ra, 4(sp);             # Carrega o registro de endereço, anteriormente salvo na pilha
    addi sp, sp, 8;             # Coloca o ponteiro de pilha na sua posição inicial

    li   t1,  0;                # Para efetuar a multiplicação é necessário um registrador iniciado em 0 (zero) para realizar as somas sucessivas
    j multipl;                  # Pula para a parte que executa a multiplicação

recurs_c:                       # Label indicando para onde voltar após a multiplicação
    mv a0, t1;                  # Passagem do valor de retorno

    ret;

multipl:                        # Label indicando o início da multiplicação
    add  t1, t1, a0;            # Realiza um passo da soma
    addi t0, t0, -1;            # Subtrai o contador
    bnez t0,  multipl;          # Se o contador ainda não chegou em 0 (zero), realizar a soma novamente
    beqz t0, recurs_c;          # Se o contador chegou em 0 (zero) voltar para a recursão (de onde parou)
