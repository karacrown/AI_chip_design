

module adder_N_bit # ( parameter N = 4)
(
    input wire clock,
    input wire reset_n,

    input wire [N-1:0] operand1,
    input wire [N-1:0] operand2,

    output logic [N:0] result
);

    logic [N-1:0] reg_operand1, reg_operand2;
    logic [N:0] reg_result, comb_result;

    always_ff @(posedge clock) begin
        if (!reset_n) begin
            reg_operand1 <= 'h0;
            reg_operand2 <= 'h0;
            reg_result   <= 'h0;
        end
        else begin
            reg_operand1 <= operand1;
            reg_operand2 <= operand2;
            reg_result   <= comb_result;
        end
    end

    always_comb begin
        comb_result = reg_operand1 + reg_operand2;
        result = reg_result;
    end
   // assign result = reg_result;

endmodule