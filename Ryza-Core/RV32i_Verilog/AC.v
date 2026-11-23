module alu_control(
    input  wire [2:0] aluop,     // from c_decode
    input  wire [2:0] funct3,    // instr[14:12]
    input  wire       funct7_5,  // instr[30] — only funct7 bit that ever matters
    output reg  [4:0] alu_ctrl
);
    wire alt_r = funct7_5 & (funct3 == 3'b000 | funct3 == 3'b101);  // sub / sra only
    wire alt_i = funct7_5 & (funct3 == 3'b101);                     // srai only — addi never subtracts

    always @(*) begin
        case (aluop)
            3'b000:  alu_ctrl = {1'b0, alt_r, funct3};   // R-type   — formula covers all 8 ops
            3'b001:  alu_ctrl = {1'b0, alt_i, funct3};   // I-type   — same formula, minus sub
            3'b010:  alu_ctrl = {2'b10, funct3};         // Branch   — funct3 passthrough, code 16-31
            3'b011:  alu_ctrl = 5'b11111;                // JAL/JALR — pass-through (code 31)
            3'b100:  alu_ctrl = 5'b00000;                // Load     — plain add for address calc
            3'b101:  alu_ctrl = 5'b00000;                // Store    — plain add for address calc
            3'b110:  alu_ctrl = 5'b00000;                // LUI      — plain add (0 + imm)
            default: alu_ctrl = 5'b00000;
        endcase
    end
endmodule