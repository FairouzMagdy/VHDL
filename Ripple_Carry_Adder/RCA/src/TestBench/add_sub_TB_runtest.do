SetActiveLib -work
comp -include "$DSN\src\RCA_8.vhd" 
comp -include "$DSN\src\TestBench\add_sub_TB.vhd" 
asim TESTBENCH_FOR_add_sub 
wave 
wave -noreg M
wave -noreg A
wave -noreg B
wave -noreg CARRY
wave -noreg V
wave -noreg SUM
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\add_sub_TB_tim_cfg.vhd" 
# asim TIMING_FOR_add_sub 
