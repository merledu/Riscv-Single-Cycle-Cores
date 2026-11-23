//Design file

module immediate_generator(
    input wire [31:0] PC,
    input wire [31:0] Instruction,
    output [31:0] S_type,
    output [31:0] B_type,
    output [31:0] U_type,
    output [31:0] I_type,
    output [31:0] J_type
);
    assign I_type = {{20{Instruction[31]}}, Instruction[31:20]};
    assign S_type = {{20{Instruction[31]}}, Instruction[31:25], Instruction[11:7]};
    assign B_type = PC + {{19{Instruction[31]}}, Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8], 1'b0};
    assign U_type = {Instruction[31:12], 12'b0};
    assign J_type = PC + {{11{Instruction[31]}}, Instruction[31], Instruction[19:12], Instruction[20], Instruction[30:21], 1'b0};
endmodule