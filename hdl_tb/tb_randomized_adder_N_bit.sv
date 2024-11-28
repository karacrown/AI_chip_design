`timescale 1ns/1ps

module tb_randomized_adder_N_bit;

    // Parameters
    parameter N = 4;
    parameter NUM_TEST_VECTOR = 10000;

    // DUT Signals
    reg clock;
    reg reset_n;
    reg [N-1:0] operand1;
    reg [N-1:0] operand2;
    wire [N:0] result;

    // Reference Signals
    reg [1:0] [N-1:0] cycle0_operands;
    reg [1:0] [N-1:0] cycle1_operands;
    reg [N:0] ref_result;
    int error_count;

    // Instantiate the DUT
    adder_N_bit #(N) uut (
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
                operand1 = $urandom & ((2**N)-1);
                operand2 = $urandom & ((2**N)-1);
            end
        end
    endtask


    always_ff @(posedge clock) begin
        cycle0_operands[0]  <= operand1;
        cycle0_operands[1]  <= operand2;
        cycle1_operands     <= cycle0_operands;
    end

    // Checking Thread
    task check_results;
        integer i;
        begin
            
            @(posedge reset_n); // Wait for reset deassertion            
            @(posedge clock);
            @(posedge clock);

            for (i = 0; i < NUM_TEST_VECTOR; i++) begin
                @(posedge clock);
                ref_result = cycle1_operands[0] + cycle1_operands[1];
                if (result != ref_result) begin
                    $display("[ERROR] Cycle %0t: operand1=%0d, operand2=%0d, result=%0d, expected=%0d",
                             $time, cycle1_operands[0], cycle1_operands[1], result, ref_result);
                    error_count = error_count + 1;
                end
                // else begin
                //     $display("[PASS]  Cycle %0t: operand1=%0d, operand2=%0d, result=%0d",
                //              $time, cycle1_operands[0], cycle1_operands[1], result);
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