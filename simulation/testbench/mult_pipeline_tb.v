// Testbench for a 4-bit Multiplier

`timescale 1ns/1ps

module mult_pipeline_tb();

	// Constants
	parameter CALC_CYCLES = 16;

	// Loop Variables
	integer i;
	integer j;

	// Clocks and Resets
	reg tb_clk   = 1'b0;
	reg rst_n = 1'b0;


	// Inputs
	reg [3:0] a = 0;
	reg [3:0] b = 0;

	// Outputs
	wire [7:0] c;
    reg  [7:0] result;

    // Control
    reg start = 0;

	mult_pipeline DUT
	(
	.clk(tb_clk),
	.rst_n(rst_n),
    .start(start),
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
		for (i = 0; i < 15; i = i + 1) begin
		   a = i;
		   for (j = 0; j < 15; j = j + 1) begin
		      b = j;
              start = 1;
		      repeat (CALC_CYCLES) @(posedge tb_clk);  // Wait for the multiply to finish
              result = $signed(a*b);                   // Calculate the expected result

              // Check the result is correct.
              if ( c !== result ) begin
			     $display("ASSERTION FAILED in %m: signal %b != value %b (%b * %b)", c, result,a,b);
			     $stop;
		      end

		    end  // j loop
		end  // i loop

		$finish;
	end // Intial Begin
endmodule
