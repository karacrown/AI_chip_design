`timescale 1ns/1ps

module tb_randomized_mult;

    // Parameters
    parameter N = 8;
    parameter LATENCY = 3;
    parameter NUM_TEST_VECTOR = 10000;

    // DUT Signals
    reg clock;
    reg reset_n;
    reg [2*N-1:0] operand1;
    reg [2*N-1:0] operand2;
    wire [4*N-1:0] result;

    // Reference Signals
    reg [LATENCY-1:0] [2*N-1:0] buffered_operand1;
    reg [LATENCY-1:0] [2*N-1:0] buffered_operand2;
    reg [4*N-1:0] ref_result;
    int error_count;

    // Instantiate the DUT
    mult_16_bit #(N) dut (
        .clock(clock),
        .reset_n(reset_n),
        .operand1(operand1),
        .operand2(operand2),
        .result(result)
    );

    // Clock Generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Reset Handling
    initial begin
        error_count = 0;
        reset_n = 0;
        operand1 = 0;
        operand2 = 0;
        #20 reset_n = 1;
    end

    // Stimulus Thread
    task generate_stimuli;
        integer i;
        begin
            @(posedge reset_n); // Wait for reset deassertion  
            for (i = 0; i < NUM_TEST_VECTOR; i++) begin          
                @(posedge clock);
                operand1 = $urandom & ((2**(2*N))-1);
                operand2 = $urandom & ((2**(2*N))-1);
            end
        end
    endtask


    always_ff @(posedge clock) begin
        buffered_operand1 [0] <= operand1;
        buffered_operand2 [0] <= operand2;
        buffered_operand1 [LATENCY-1:1] <= buffered_operand1 [LATENCY-2:0];
        buffered_operand2 [LATENCY-1:1] <= buffered_operand2 [LATENCY-2:0];
    end

    // Checking Thread
    task check_results;
        integer i;
        begin
            
            @(posedge reset_n); // Wait for reset deassertion            
            repeat(LATENCY+1) @(posedge clock);

            for (i = 0; i < NUM_TEST_VECTOR; i++) begin
                @(posedge clock);
                ref_result = buffered_operand1[LATENCY-1] * buffered_operand2[LATENCY-1];
                if (result != ref_result) begin
                    $display("[ERROR] Cycle %0t: operand1=%0d, operand2=%0d, result=%0d, expected=%0d",
                             $time, buffered_operand1[LATENCY-1], buffered_operand2[LATENCY-1], result, ref_result);
                    error_count = error_count + 1;
                end
                // else begin
                //     $display("[PASS]  Cycle %0t: operand1=%0d, operand2=%0d, result=%0d",
                //              $time, buffered_operand1[LATENCY-1], buffered_operand2[LATENCY-1], result);
                // end
            end

            $display("Test completed with %0d errors.", error_count);
        end
    endtask

    // Fork-Join for Parallel Threads
    initial begin
        fork
            begin
                generate_stimuli();
            end
            begin
                check_results();
            end
        join
        $finish;
    end


endmodule