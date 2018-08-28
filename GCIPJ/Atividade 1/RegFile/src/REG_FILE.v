module REG_FILE #(parameter REG_WORD_WIDTH = 32, parameter REG_ADDR_WIDTH = 5) (
	output [REG_WORD_WIDTH - 1:0] READ_DATA1_o,
	output [REG_WORD_WIDTH - 1:0] READ_DATA2_o,
	input  [REG_ADDR_WIDTH - 1:0] READ_REG1_i,
	input  [REG_ADDR_WIDTH - 1:0] READ_REG2_i,
	input  [REG_ADDR_WIDTH - 1:0] WRITE_REG_i,
	input  [REG_WORD_WIDTH - 1:0] WRITE_DATA_i,
	input  WRITE_EN_i,
	input  CLK
);
	reg  [REG_WORD_WIDTH - 1:0] regs[1:(1 << REG_ADDR_WIDTH) - 1];     // Registradores 1-31
	wire [REG_WORD_WIDTH - 1:0] reg0;                                  // Registrador 0 (hard-wired)
	assign reg0 = {REG_WORD_WIDTH{1'b0}};                              // Inicializa o registrador 0

	assign READ_DATA1_o = READ_REG1_i ? regs[READ_REG1_i] : reg0;      // Passa o valor do registrador escolhido para a saída 1
	assign READ_DATA2_o = READ_REG2_i ? regs[READ_REG2_i] : reg0;      // Passa o valor do registrador escolhido para a saída 2

	always @(posedge CLK) begin
		if (WRITE_EN_i && WRITE_REG_i) begin                           // Se a escrita estiver habilitada e for escolhido um registrador que não o 0
			regs[WRITE_REG_i] <= WRITE_DATA_i;                         // realiza a escrita do dado no registrador especificado
		end
	end

endmodule