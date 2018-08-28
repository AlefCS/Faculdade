module BIN_2_BCD_tb ();
	wire [4*4 - 1:0] out_o;
	reg  [12 - 1:0] in_i;

	initial begin
		$dumpfile("bin/bin2bcd.vcd");
		$dumpvars;

		$monitor("BIN: %d\nBCD: %b\n\n", in_i, out_o);

		#100
		$stop;
	end

	always begin
		#10 in_i = $urandom % (1 << 12);
	end

	BIN_2_BCD DUT (
		.OUT_o (out_o),
		.IN_i  (in_i)
	);
endmodule
