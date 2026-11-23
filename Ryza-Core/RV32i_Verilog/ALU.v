module alu (
    input  [31:0] A,
    input  [31:0] B,
    input  [4:0]  Alu_control,
    output reg [31:0] Alu_out,
    output reg        Alu_branch
);
    // straightforward compute paths — one wire per operation
    wire [31:0] add_out = A + B;
    wire [31:0] sub_out = A - B;
    wire [31:0] and_out = A & B;
    wire [31:0] or_out  = A | B;
    wire [31:0] xor_out = A ^ B;
    wire [31:0] sll_out = A << B[4:0];
    wire [31:0] srl_out = A >> B[4:0];
    wire [31:0] sra_out = $signed(A) >>> B[4:0];

    // comparisons, named after the instructions that use them
    wire slt  = ($signed(A) < $signed(B));   // slt, slti, blt
    wire sltu = (A < B);                     // sltu, sltiu, bltu
    wire beq  = (A == B);
    wire bne  = ~beq;
    wire blt  = slt;     // same computed value as slt — just a differently-named use
    wire bge  = ~slt;
    wire bltu = sltu;    // same computed value as sltu
    wire bgeu = ~sltu;

    always @(*) begin
        case (Alu_control[4:0])
            5'b00000: Alu_out = add_out;               // add, addi
            5'b01000: Alu_out = sub_out;                // sub
            5'b00111: Alu_out = and_out;                // and, andi
            5'b00110: Alu_out = or_out;                 // or, ori
            5'b00100: Alu_out = xor_out;                // xor, xori
            5'b00001: Alu_out = sll_out;                // sll, slli
            5'b00101: Alu_out = srl_out;                // srl, srli
            5'b01101: Alu_out = sra_out;                // sra, srai
            5'b00010: Alu_out = {31'b0, slt};           // slt, slti
            5'b00011, 5'b10110: Alu_out = {31'b0, sltu};// sltu, sltiu, bltu
            5'b10000: Alu_out = {31'b0, beq};
            5'b10001: Alu_out = {31'b0, bne};
            5'b10100: Alu_out = {31'b0, blt};
            5'b10101: Alu_out = {31'b0, bge};
            5'b10111: Alu_out = {31'b0, bgeu};
            5'b11111: Alu_out = A;                      // jal, jalr
            default:  Alu_out = 32'b0;
        endcase
    end

    always @(*) begin
        // "is this a branch-category op" AND "did the selected comparison come out true"
        Alu_branch = (Alu_control[4:3] == 2'b10) && (Alu_out == 32'd1);
    end
endmodule