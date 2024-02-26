// A Simple 4-bit Multiplier naive implementation
//
`timescale 1ns/1ps

module mult_pipeline(
	input wire clk,
	input wire rst_n,
    input wire start,
	input wire signed [3:0] a,
	input wire signed [3:0] b,
	output wire signed [7:0] c
	);

   reg [1:0] state_current;
   reg [1:0] state_next;

   reg [7:0] multiplicand;
   reg [15:0] product;
   reg [7:0] result;
   reg [7:0] result_next;
   reg [7:0] partial_product;
   reg [2:0] bit_counter; // Cycle Counte
   reg [2:0] bit_counter_next;

   // decalare state names
   parameter [1:0]   IDLE     = 2'd0;
   parameter [1:0]   MULTIPLY = 2'd1;
   parameter [1:0]   OUTPUT   = 2'd2;

///////////////////////////////////////////////////////////////////////////////
// State Control Section

// State Control Sequential
always @(posedge clk or negedge rst_n)
	begin
		if (rst_n == 1'b0) begin
            state_current <= IDLE;
            bit_counter   <= 0;
		end else begin
            state_current <= state_next;
            bit_counter   <= bit_counter_next;
		end
	end

// State Control Combinational
always @(*)
begin
    case (state_current)
        IDLE :
        begin
            state_next = start ? MULTIPLY : IDLE;
            bit_counter_next = 0;
        end
        MULTIPLY :
        begin
            state_next = (bit_counter == 7) ? IDLE : MULTIPLY;
            bit_counter_next = bit_counter + 1;
        end

        default :
        begin
            state_next = IDLE;
            bit_counter_next = 0;
        end
    endcase
end

///////////////////////////////////////////////////////////////////////////////

// Register capture
always @(posedge clk or negedge rst_n)
begin
    if (rst_n == 0) begin
        product      <= 0;
        multiplicand <= 0;
        result       <= 0;
    end else begin
        case (state_current)
            IDLE : begin
                multiplicand <= { {4{b[3]}}, {b[3:0]} };
                product      <= { 8'b0, {4{a[3]}}, {a[3:0]}};
            end // IDLE

            MULTIPLY : begin
                product [15]   = 0;
                product [14:7] = partial_product;
                product [6:0]  = product[7:1];
                result         = result_next;
            end // MULTIPLY

            default : begin
                multiplicand <= 0;
                product      <= 0;
            end
        endcase
    end
end // Always Sequential


// Combinational Logic for Multiplier
always @(*)
begin
    // Add the multiplicand
    if (product[0] == 1'b1) begin
        partial_product = product[15:8] + multiplicand;
    end else begin
        partial_product = product[15:8];
    end

    if (bit_counter == 7) begin
        result_next = product[7:0];
    end else begin
        result_next = result;
    end
end // Always Combinational


// Output Block
assign c = result;


///////////////////////////////////////////////////////////////////////////////

endmodule
