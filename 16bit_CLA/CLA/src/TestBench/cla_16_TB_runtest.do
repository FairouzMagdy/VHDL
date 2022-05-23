SetActiveLib -work
comp -include "$DSN\src\16bitcla.vhd" 
comp -include "$DSN\src\TestBench\cla_16_TB.vhd" 
asim TESTBENCH_FOR_cla_16 
wave 
wave -noreg A
wave -noreg B
wave -noreg Cin
wave -noreg S
wave -noreg Cout
wave -noreg GII
wave -noreg PII
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\cla_16_TB_tim_cfg.vhd" 
# asim TIMING_FOR_cla_16 
