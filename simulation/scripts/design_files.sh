#!/bin/bash

# list of design files to be compiled

design_files=("../../source/multiplier_simple_4-bit.v")


testbench_files=("../testbench/multiplier_tb.v")

ver_files=("${design_files[@]}" "${testbench_files[@]}")

