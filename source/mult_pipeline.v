// A Simple 4-bit Multiplier naive implementation
//
`timescale 1ns/1ps

module mult_pipeline(
	input wire clk,
	input wire rst_n,
	input wire signed [3:0] a,
	input wire signed [3:0] b,
	output reg signed [7:0] c
	);

   reg [7:0] multiplicand;
   reg [15:0] product;
   

   // decalare state names
   parameter [1:0]   IDLE     = 2'd0;
   parameter [1:0]   MULTIPLY = 2'd1;
   parameter [1:0]   OUTPUT   = 2'd2;

always @(posedge clk or negedge rst_n)
	begin
		if (rst_n == 1'b0) begin
			c <= 8'h00;
		end else begin
			multiplicand <= { 4{b[3]}, {b[3:0]}};
			product	     <= { 8'b0, { 4{a[3]}, {a[3:0]}};
		end
	end



endmodule
