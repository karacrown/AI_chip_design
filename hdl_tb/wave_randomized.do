onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/N
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/NUM_TEST_VECTOR
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/clock
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/reset_n
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/operand1
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/operand2
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/result
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/cycle0_operands
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/cycle1_operands
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/ref_result
add wave -noupdate -expand -group tb -radix unsigned /tb_randomized_adder_N_bit/error_count
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/N
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/clock
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/reset_n
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/operand1
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/operand2
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/result
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/reg_operand1
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/reg_operand2
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/reg_result
add wave -noupdate -expand -group uut -radix unsigned /tb_randomized_adder_N_bit/uut/comb_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {239 ns} 0}
quietly wave cursor active 1
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
