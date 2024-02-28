// Testbench for a 4-bit Multiplier

`timescale 1ns/1ps

module mult_pipeline_tb();

    // Constants
    parameter CALC_CYCLES = 10;

    // Loop Variables
    integer i = 0;
    integer j = 0;

    // Clocks and Resets
    reg tb_clk   = 1'b0;
    reg rst_n = 1'b0;


    // Inputs
    reg [3:0] a = 0;
    reg [3:0] b = 0;

    // Outputs
    wire [7:0] c;
    wire       valid;
    reg  [7:0] actual_result = 0;
    reg  [7:0] expected_result = 0;

    // Control
    reg start = 0;

    mult_pipeline DUT
    (
    .clk(tb_clk),
    .rst_n(rst_n),
    .start(start),
    .valid(valid),
    .a(a),
    .b(b),
    .c(c)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        // Wait, Come Out of reset
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //  Reset the Device
        rst_n = 1'b0;
        repeat (1) @(posedge tb_clk);
        rst_n = 1'b1;
        repeat (1) @(posedge tb_clk);

        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //  Stimulate Device

        for (i = -8; i < 8; i = i + 1) begin
           for (j = -8; j < 8; j = j + 1) begin
              // Update the test values, clock in values
              a = i;
              b = j;
              start = 1;
              expected_result = i*j;
              repeat (1) @(posedge tb_clk);

              // Run the calculation, deassert start flag
              start = 0;
              repeat (CALC_CYCLES) @(posedge tb_clk);

              actual_result   = c;
              if ( actual_result !== expected_result ) begin
                 $display("ASSERTION FAILED in %m: signal %b != value %b (%b * %b)", actual_result, expected_result, a, b);
                 $stop;
              end

            end  // j loop
        end  // i loop

        $finish;
    end // Intial Begin
endmodule
