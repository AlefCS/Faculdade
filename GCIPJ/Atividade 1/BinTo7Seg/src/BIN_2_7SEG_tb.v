module BIN_2_7SEG_tb ();
	wire [3:0] outa_o;
	wire [3:0] outb_o;
	wire [3:0] outc_o;
	wire [3:0] outd_o;
	wire [3:0] oute_o;
	wire [3:0] outf_o;
	wire [3:0] outg_o;
	reg  [12 - 1:0] in_i;

	initial begin
		$dumpfile("bin/bin27seg.vcd");  // Gera arquivo para visualização da onda
		$dumpvars;                      // Inclui variáveis no arquivo
		in_i = 0;
		// Mostra o valor dos LEDs do display da unidade
		$monitor("DEC: %d\nA: %b\nB: %b\nC: %b\nD: %b\nE: %b\nF: %b\nG: %b\n\n", in_i, outa_o[0], outb_o[0], outc_o[0], outd_o[0], oute_o[0], outf_o[0], outg_o[0]);

		#100
		$stop;
	end

	always begin
		// Incrementa o valor da entrada (que foi inicializada em zero)
		#10 in_i = in_i + 1;
	end

	// Instanciação do módulo a ser testado
	BIN_2_7SEG DUT (
		.OUTa_o (outa_o),
		.OUTb_o (outb_o),
		.OUTc_o (outc_o),
		.OUTd_o (outd_o),
		.OUTe_o (oute_o),
		.OUTf_o (outf_o),
		.OUTg_o (outg_o),
		.IN_i   (in_i)
	);
endmodule