onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/mult_intr0
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/mult_intr1
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/mult_intr2
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/mult_intr3
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/operand1_8bit0
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/operand1_8bit1
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/operand2_8bit0
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/operand2_8bit1
add wave -noupdate -expand -group DUT -radix unsigned /tb_randomized_mult/dut/clock
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/reg_mult_intr0
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/reg_mult_intr1
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/reg_mult_intr2
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/reg_mult_intr3
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/shift_intr0
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/shift_intr1
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/shift_intr2
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/shift_intr3
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/operand1
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/operand2
add wave -noupdate -expand -group DUT -radix unsigned /tb_randomized_mult/dut/adder_result
add wave -noupdate -expand -group DUT -radix unsigned /tb_randomized_mult/dut/reset_n
add wave -noupdate -expand -group DUT -radix unsigned /tb_randomized_mult/dut/result
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/reg_operand1
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_randomized_mult/dut/reg_operand2
add wave -noupdate -expand -group DUT -radix unsigned /tb_randomized_mult/dut/reg_result
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/clock
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/reset_n
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/operand1
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/operand2
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/result
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/buffered_operand1
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/buffered_operand2
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/ref_result
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_mult/error_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25 ns} 0} {{Cursor 2} {55 ns} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {0 ns} {79 ns}
