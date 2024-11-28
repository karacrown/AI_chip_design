# cd ../../Users/udemy/github_repos/AI_chip_design/hdl_tb

vlib work

vlog -work work "../hdl/adder_N_bit.sv"
vlog -work work "tb_adder_N_bit.sv"
vlog -work work "tb_randomized_adder_N_bit.sv"

vsim -l transcript.log -t 1ns -lib work tb_randomized_adder_N_bit


view wave
view structure
view signals

# do wave.do
do wave_randomized.do

run 10ms
