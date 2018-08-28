module REG_FILE_tb #(parameter reg_word_width = 32, parameter reg_addr_width = 5) ();
	wire [reg_word_width - 1:0] read_data1_o;
	wire [reg_word_width - 1:0] read_data2_o;
	reg  [reg_addr_width - 1:0] read_reg1_i;
	reg  [reg_addr_width - 1:0] read_reg2_i;
	reg  [reg_addr_width - 1:0] write_reg_i;
	reg  [reg_word_width - 1:0] write_data_i;
	reg  write_en_i;
	reg  clk;

	integer i;

	initial begin
		$dumpfile("bin/regfile.vcd");         // Cria o arquivo para visualização de onda
		$dumpvars;                            // Coloca as variáveis no arquivo
		$dumpvars(1, DUT.regs[1]);            // Coloca especificamente o registrador 01 do módulo instanciado
		$dumpvars(1, DUT.regs[16]);           // Coloca especificamente o registrador 16 do módulo instanciado
		$dumpvars(1, DUT.regs[31]);           // Coloca especificamente o registrador 31 do módulo instanciado

		clk = 0;
		write_en_i = 0;
		// Mostra os valores dos registradores especificados
		$display("CLOCK:  %d\nREG_0:  %d\nREG_16: %d\nREG_31: %d\n", clk, DUT.reg0, DUT.regs[16], DUT.regs[31]);
		#20
		write_data_i = 11;
		write_reg_i  = 0;
		read_reg1_i  = 0;
		read_reg2_i  = 31;
		// $display("CLOCK:   %d\nWRITE_E: %d\nREG_0:   %d\nREG_1:   %d\nREG_16:   %d\nREG_31:   %d\n", clk, DUT.reg0);
		#20
		write_data_i = 12;
		write_reg_i  = 1;
		read_reg1_i  = 1;
		read_reg2_i  = 0;
		// $display("CLOCK:   %d\nWRITE_E: %d\nREG_0:   %d\nREG_1:   %d\nREG_16:   %d\nREG_31:   %d\n", clk, DUT.reg0);
		#20
		write_data_i = 13;
		write_reg_i  = 16;
		read_reg1_i  = 16;
		read_reg2_i  = 1;
		// $display("CLOCK:   %d\nWRITE_E: %d\nREG_0:   %d\nREG_1:   %d\nREG_16:   %d\nREG_31:   %d\n", clk, DUT.reg0);
		#20
		write_data_i = 14;
		write_reg_i  = 31;
		read_reg1_i  = 31;
		read_reg2_i  = 16;
		// $display("CLOCK:   %d\nWRITE_E: %d\nREG_0:   %d\nREG_1:   %d\nREG_16:   %d\nREG_31:   %d\n", clk, DUT.reg0);
		#20

		$stop;
	end

	always begin
		#5 clk = ~clk;
	end

	always begin
		#10 write_en_i = ~write_en_i;
	end

	REG_FILE #(reg_word_width, reg_addr_width) DUT (
		.READ_DATA1_o (read_data1_o),
		.READ_DATA2_o (read_data2_o),
		.READ_REG1_i  (read_reg1_i),
		.READ_REG2_i  (read_reg2_i),
		.WRITE_REG_i  (write_reg_i),
		.WRITE_DATA_i (write_data_i),
		.WRITE_EN_i   (write_en_i),
		.CLK          (clk)
	);
endmodule