module BIN_2_BCD (
	output reg [4*4 - 1:0] OUT_o,                // Saída BCD com tamanho do BCD*(Nº de displays)
	/* Apenas SystemVerilog
	* output reg [3:0] OUT_o [4 - 1:0],
	*/
	input      [12 - 1:0] IN_i                   // Número binário a ser convertido
);

	integer i;
	integer q;                                   // Variável que será manipulada na conversão
	always @(IN_i) begin
		q = IN_i;
		OUT_o = {4*4{1'b0}};                     // Inicializa a saída em 0, para operação OR
		for (i = 0; i < 4; i++) begin
			OUT_o = OUT_o | ((q % 10) << 4*i);   // Coloca o valor BCD do dígito na posição correspondente
			/* Apenas com SystemVerilog
			* OUT_o[i] = q % 10;
			*/
			q = q / 10;
		end
	end

endmodule