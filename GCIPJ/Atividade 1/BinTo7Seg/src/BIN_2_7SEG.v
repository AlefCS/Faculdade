module BIN_2_7SEG (
	// output reg [7*4 - 1:0] OUT_o,
	output reg [3:0] OUTa_o,
	output reg [3:0] OUTb_o,
	output reg [3:0] OUTc_o,
	output reg [3:0] OUTd_o,
	output reg [3:0] OUTe_o,
	output reg [3:0] OUTf_o,
	output reg [3:0] OUTg_o,
	input  [12 - 1:0] IN_i
);

	wire [4*4 - 1:0] bcd;
	integer i;

	always @(*) begin
		// OUT_o = {7*4{1'b0}};
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

	BIN_2_BCD DUT (
		.OUT_o (bcd),
		.IN_i  (IN_i)
	);

endmodule