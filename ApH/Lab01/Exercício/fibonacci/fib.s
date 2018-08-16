.text
.align 2
.globl fib
.type fib,@function
fib:
	beqz a0, ifn0;
	li t0, 0;
	li t1, 1;
	loop_i:
		add  t3,   zero,  1;
		sub  a0,     a0, t3;
		beqz a0, loop_f;

		add  t2,   t0, t1;
		add  t0, zero, t1;
		add  t1, zero, t2;
		j loop_i;

	loop_f:
		add a0, zero, t1;
		ret;

	ifn0: 
		add a0, zero, zero;
		ret;
