#!/bin/bash
source ../scripts/design_files.sh
vlog -work my_lib "${design_files[@]}" "${testbench_files[@]}"
