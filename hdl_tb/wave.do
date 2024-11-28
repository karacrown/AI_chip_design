onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tb -radix unsigned /tb_adder_N_bit/clock
add wave -noupdate -expand -group tb -radix unsigned /tb_adder_N_bit/reset_n
add wave -noupdate -expand -group tb -radix unsigned /tb_adder_N_bit/operand1
add wave -noupdate -expand -group tb -radix unsigned /tb_adder_N_bit/operand2
add wave -noupdate -expand -group tb -radix unsigned /tb_adder_N_bit/result
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/clock
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/reset_n
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/operand1
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/operand2
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/result
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/reg_operand1
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/reg_operand2
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/reg_result
add wave -noupdate -expand -group dut -radix unsigned /tb_adder_N_bit/dut/comb_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
