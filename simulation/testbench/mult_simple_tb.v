// Testbench for a 4-bit Multiplier
//
`timescale 1ns/1ps

module mult_simple_tb();

	// Constants
	parameter CALC_CYCLES = 1;
	
	// Loop Variables
	integer i;
	integer j;
	
	// Clocks and Resets
	reg tb_clk   = 1'b0;
	reg rst_n = 1'b0;


	// Inputs
	reg [3:0] a; 
	reg [3:0] b;

	// Outputs
	wire [7:0] c;


	mult_simple DUT
	(
	.clk(tb_clk),
	.rst_n(rst_n),
	.a(a),
	.b(b),
	.c(c)
	);

	always #10 tb_clk = ~tb_clk;

	initial begin
		// Wait, Come Out of reset
		repeat (4) @(posedge tb_clk);
		rst_n = 1'b1;
		repeat (4) @(posedge tb_clk);		

		// Assert values
		for (i = -8; i < 7; i = i + 1) begin
		  a = i;
		  for (j = -8; j < 7; j = j + 1) begin
		    b = j;
		    repeat (CALC_CYCLES) @(posedge tb_clk);
		    if ($signed(c) !== (i*j) ) begin
			$display("ASSERTION FAILED in %m: signal %b != value %b", c, i*j);
			$stop;
		    end
		  end
		end
		
		$finish;
	end // Intial Begin
endmodule
