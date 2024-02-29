#!/bin/bash

# list of design files to be compiled

design_files=("../../source/mult_simple.v" "../../source/mult_pipeline.v" "../../source/mult_booth.v")


testbench_files=("../testbench/mult_pipeline_tb.v" "../testbench/mult_simple_tb.v" "../testbench/mult_booth_tb.v")

ver_files=("${design_files[@]}" "${testbench_files[@]}")

