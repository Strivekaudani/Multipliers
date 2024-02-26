radix define States {
    2'h0 "IDLE",
    2'h1 "MULTIPLY",
   -default hex
}

add wave -position insertpoint  \
sim:/mult_pipeline_tb/DUT/clk \
sim:/mult_pipeline_tb/DUT/rst_n \
sim:/mult_pipeline_tb/DUT/start

add wave -position insertpoint -radix States \
sim:/mult_pipeline_tb/DUT/state_current \
sim:/mult_pipeline_tb/DUT/state_next

add wave -position insertpoint -radix decimal \
sim:/mult_pipeline_tb/DUT/a \
sim:/mult_pipeline_tb/DUT/b \
sim:/mult_pipeline_tb/DUT/c \
sim:/mult_pipeline_tb/DUT/multiplicand \
sim:/mult_pipeline_tb/DUT/product \
sim:/mult_pipeline_tb/DUT/partial_product \
sim:/mult_pipeline_tb/DUT/bit_counter \
sim:/mult_pipeline_tb/DUT/bit_counter_next

run -all
