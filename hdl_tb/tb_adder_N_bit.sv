`timescale 1ns/1ps

module tb_adder_N_bit;

    parameter N = 4; // Parameterize the width

    // DUT signals
    reg clock;
    reg reset_n;
    reg [N-1:0] operand1;
    reg [N-1:0] operand2;
    wire [N:0] result;

    // Instantiate the DUT
    adder_N_bit #(.N(N)) dut (
        .clock(clock),
        .reset_n(reset_n),
        .operand1(operand1),
        .operand2(operand2),
        .result(result)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        operand1 = 0;
        operand2 = 0;
        reset_n = 0;

        // Apply reset
        #20;
        reset_n = 1;

        // Apply test cases
        @(posedge clock);
        operand1 = 4'b0011; // 3
        operand2 = 4'b0101; // 5

        @(posedge clock);
        operand1 = 4'b1111; // 15
        operand2 = 4'b0001; // 1

        @(posedge clock);
        operand1 = 4'b1010; // 10
        operand2 = 4'b0101; // 5

        @(posedge clock);
        operand1 = 4'b0000; // 0
        operand2 = 4'b0000; // 0

        // End simulation
        #50;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor($time, " operand1=%b, operand2=%b, result=%b", operand1, operand2, result);
    end

endmodule