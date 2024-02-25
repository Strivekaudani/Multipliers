// A Simple 4-bit Multiplier naive implementation
//
`timescale 1ns/1ps

module mult_ver(
	input wire clk,
	input wire rst_n,
	input wire signed [3:0] a,
	input wire signed [3:0] b,
	output reg signed [7:0] c
	);

always @(posedge clk or negedge rst_n)
	begin
		if (rst_n == 1'b0) begin
			c <= 8'h00;
		end else begin
			c <= a * b;
		end
	end
endmodule
