module BIN_2_7SEG (
	// output reg [7*4 - 1:0] OUT_o,
	output reg [3:0] OUTa_o,   // Valores do LED 'a' para os displays
	output reg [3:0] OUTb_o,   // Valores do LED 'b' para os displays
	output reg [3:0] OUTc_o,   // Valores do LED 'c' para os displays
	output reg [3:0] OUTd_o,   // Valores do LED 'd' para os displays
	output reg [3:0] OUTe_o,   // Valores do LED 'e' para os displays
	output reg [3:0] OUTf_o,   // Valores do LED 'f' para os displays
	output reg [3:0] OUTg_o,   // Valores do LED 'g' para os displays
	input  [12 - 1:0] IN_i     // Número binário a ser impresso
);

	wire [4*4 - 1:0] bcd;      // Variável para pegar o valor BCD fornecido pelo módulo D0 (BIN_2_BCD)
	integer i;

	always @(*) begin
		// OUT_o = {7*4{1'b0}};
		// Para cada display será gerado o valor de cada um dos seus LEDs
		for (i = 0; i < 4; i++) begin
			// a   =                  A                |             B'D'              |              BD               |       C
			OUTa_o[i] <=  bcd[4*i + 3]                 | ~bcd[4*i + 2] & ~bcd[4*i + 0] |  bcd[4*i + 2] &  bcd[4*i + 0] | bcd[4*i + 1];
			// b   =                  B'               |              CD               |              C'D'
			OUTb_o[i] <= ~bcd[4*i + 2]                 |  bcd[4*i + 1] &  bcd[4*i + 0] | ~bcd[4*i + 1] & ~bcd[4*i + 0];
			// c   =                  B                |              C'               |              D
			OUTc_o[i] <=  bcd[4*i + 2]                 | ~bcd[4*i + 1]                 |  bcd[4*i + 0];
			// d   =                  A                |               B'D'            |              B'C              |             CD'              |             BC'D
			OUTd_o[i] <=  bcd[4*i + 3]                 | ~bcd[4*i + 2] & ~bcd[4*i + 0] | ~bcd[4*i + 2] &  bcd[4*i + 1] | bcd[4*i + 1] & ~bcd[4*i + 0] | bcd[4*i + 2] & ~bcd[4*i + 1] & bcd[4*i + 0];
			// e   =                  B'D'             |              CD'
			OUTe_o[i] <= ~bcd[4*i + 2] & ~bcd[4*i + 0] |  bcd[4*i + 1] & ~bcd[4*i + 0];
			// f   =                  A                |              C'D'             |              BC'              |             BD'
			OUTf_o[i] <=  bcd[4*i + 3]                 | ~bcd[4*i + 1] & ~bcd[4*i + 0] |  bcd[4*i + 2] & ~bcd[4*i + 1] | bcd[4*i + 2] & ~bcd[4*i + 0];
			// g   =                  A                |              BC'              |              B'C              |             CD'
			OUTg_o[i] <=  bcd[4*i + 3]                 |  bcd[4*i + 2] & ~bcd[4*i + 1] | ~bcd[4*i + 2] &  bcd[4*i + 1] | bcd[4*i + 1] & ~bcd[4*i + 0];
			/*OUT_o = OUT_o | ({bcd[4*i + 3]  | bcd[4*i + 1]  | bcd[4*i + 2] & bcd[4*i + 0] | ~bcd[4*i + 2] & ~bcd[4*i + 0],
							  ~bcd[4*i + 2] | bcd[4*i + 1]  & bcd[4*i + 0] | ~bcd[4*i + 1] & ~bcd[4*i + 0],
							  bcd[4*i + 2]  | ~bcd[4*i + 1] | bcd[4*i + 0],
							  bcd[4*i + 3]  | ~bcd[4*i + 2] & bcd[4*i + 1] | bcd[4*i + 2] & bcd[4*i + 0] | ~bcd[4*i + 2] & ~bcd[4*i + 0],
							  bcd[4*i + 3]  | bcd[4*i + 1]  | bcd[4*i + 2] & bcd[4*i + 0] | ~bcd[4*i + 2] & ~bcd[4*i + 0],
							  bcd[4*i + 3]  | bcd[4*i + 1]  | bcd[4*i + 2] & bcd[4*i + 0] | ~bcd[4*i + 2] & ~bcd[4*i + 0],
							  bcd[4*i + 3]  | bcd[4*i + 1]  | bcd[4*i + 2] & bcd[4*i + 0] | ~bcd[4*i + 2] & ~bcd[4*i + 0]} << 7*i);*/
		end
	end

	// Instanciação do módulo BIN_2_BCD
	BIN_2_BCD D0 (
		.OUT_o (bcd),
		.IN_i  (IN_i)
	);

endmodule