`timescale 1ns / 1ps
//module for a multiplier that implements the booth algorithm

module mult_booth(
		input wire clk,
		input wire rst_n,
		input wire start,
		input wire [3:0] a,
		input wire [3:0] b,
		output reg [7:0] c
		);
		
  reg [7:0]  c_next;
  reg        state_next;
  reg [16:0] product_next;
  reg [3:0]  bit_count_next;
  reg [7:0]  multiplicand_next;
		
  reg [7:0]  multiplicand;
  reg [7:0]  multiplier;
  reg [16:0] product_current;
  reg	     state_current;
  reg [1:0]  control_bits; //for holding the previous bit and the LSB of the multiplier
  reg [3:0]  bit_count_current;

  // FSM State Definitions
  parameter S0_IDLE     = 1'b0;
  parameter S1_MULTIPLY = 1'b1;
  
  always @(posedge clk or negedge rst_n)
    begin
      if(rst_n == 1'b0)begin
	control_bits      <= 2'b00;
	product_current   <= 17'd0;
	bit_count_current <= 4'd8;
	c 		  <= 8'd0;
	state_current     <= S0_IDLE;
	multiplicand      <= 8'h00;
      end else begin
	control_bits      <= {product_next[1], product_next[0]};
	product_current   <= product_next;
	bit_count_current <= bit_count_next;
	c 		  <= c_next;
	state_current     <= state_next;
	multiplicand      <= multiplicand_next;
      end
    end
    
  always @(*)
    begin
      c_next = c;
      bit_count_next = bit_count_current;
      product_next   = product_current;
      state_next     = state_current;
      multiplicand_next = multiplicand;

      case(state_current)
	S0_IDLE: begin
	  if(start == 1'b1) begin
	    multiplicand_next = { {4{a[3]}}, {a[3:0]}};
	    multiplier        = { {4{b[3]}}, {b[3:0]}};
	    product_next[16:9] = 8'd0;
	    product_next[8:1] = multiplier;//{{8{1'b0}}, multiplier, 1'b0};
	    product_next[0] = 1'b0;
	    state_next = S1_MULTIPLY;
	  end
	end
	  
	S1_MULTIPLY: begin
	  bit_count_next = bit_count_current - 1'b1;
	 
	  case(control_bits)
	    2'b01: begin //addition
	      //product_next = {1'b0, (product_current[16:9] + multiplicand), product_current[8:1]};
	      product_next[16] = 1'b0;
	      product_next[15:8] = product_current[16:9] + multiplicand;
	      product_next[7:0] = product_current[8:1];
	    end
	    
	    2'b10: begin //subtraction
	      //product_next = {1'b0, (product_current[16:9] - multiplicand), product_current[8:1]};
	      product_next[16] = 1'b0;
	      product_next[15:8] = product_current[16:9] - multiplicand;
	      product_next[7:0] = product_current[8:1];
	    end
	    
	    default: begin //do nothing but shift the register
	      //product_next = {1'b0, product_current[16:1]};
	      product_next[16] = 1'b0;
	      product_next[15:0] = product_current[16:1];
	    end
	  endcase
	 
	  if(bit_count_current == 4'd0)begin
	      c_next = product_current[8:1];
	      state_next = S0_IDLE;
	      bit_count_next = 4'd8;
	  end
	end 
	
	default: begin
	  state_next = S0_IDLE;
	end 
	
      endcase
    end 
    
endmodule

      
      
	
	
	      
	  
      
    

	

