// This module has 3 cycle latency
module mult_16_bit # ( parameter N = 8)
(
    input wire clock,
    input wire reset_n,

    input wire [2*N-1:0] operand1,
    input wire [2*N-1:0] operand2,

    output logic [4*N-1:0] result
);

    logic [2*N-1:0] reg_operand1, reg_operand2;
    logic [4*N-1:0] reg_result, adder_result;

    assign result = reg_result;

    always_ff @(posedge clock) begin
        if (!reset_n) begin
            reg_operand1 <= 'h0;
            reg_operand2 <= 'h0;
            reg_result   <= 'h0;
        end
        else begin
            reg_operand1 <= operand1;
            reg_operand2 <= operand2;
            reg_result   <= adder_result;
        end
    end

    logic [N-1:0] operand1_8bit0, operand1_8bit1, operand2_8bit0, operand2_8bit1;
    assign operand1_8bit0 = reg_operand1[N-1:0];
    assign operand1_8bit1 = reg_operand1[2*N-1:N];

    assign operand2_8bit0 = reg_operand2[N-1:0];
    assign operand2_8bit1 = reg_operand2[2*N-1:N];


    logic [2*N-1:0] mult_intr0, mult_intr1, mult_intr2, mult_intr3;
    logic [2*N-1:0] reg_mult_intr0, reg_mult_intr1, reg_mult_intr2, reg_mult_intr3;

    always_comb  begin : mult_operation
        mult_intr0 = operand1_8bit0*operand2_8bit0;
        mult_intr1 = operand1_8bit0*operand2_8bit1;
        mult_intr2 = operand1_8bit1*operand2_8bit0;
        mult_intr3 = operand1_8bit1*operand2_8bit1;
    end

    always_ff @(posedge clock) begin
        if (!reset_n) begin
            reg_mult_intr0 <= 'h0;
            reg_mult_intr1 <= 'h0;
            reg_mult_intr2 <= 'h0;
            reg_mult_intr3 <= 'h0;
        end
        else begin
            reg_mult_intr0 <= mult_intr0;
            reg_mult_intr1 <= mult_intr1;
            reg_mult_intr2 <= mult_intr2;
            reg_mult_intr3 <= mult_intr3;
        end
    end

    
    logic [2*N-1:0] shift_intr0;
    logic [3*N-1:0] shift_intr1, shift_intr2;
    logic [4*N-1:0] shift_intr3;

    always_comb begin  : add_and_shift_operation
        shift_intr0 = reg_mult_intr0;
        shift_intr1 = reg_mult_intr1<<8;
        shift_intr2 = reg_mult_intr2<<8;
        shift_intr3 = reg_mult_intr3<<16;

        adder_result = shift_intr0 + shift_intr1 + shift_intr2 + shift_intr3; 
    end


    
    

endmodule