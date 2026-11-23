// ============================================================================
// Top module: RV32I Single-Cycle Core
// Wires together PC, IMEM, Control Unit, Register File, Immediate Generator,
// ALU Control, ALU, JALR Target unit, and DMEM.
// ============================================================================

module rv32i_core_top (
    input  wire clk,
    input  wire rst
);

    // ------------------------------------------------------------------
    // PC stage
    // ------------------------------------------------------------------
    wire [31:0] pc_out;
    wire [31:0] pc_plus4;
    wire [31:0] next_pc;

    PC u_PC (
        .clk      (clk),
        .rst      (rst),
        .pc_in    (next_pc),
        .pc_out   (pc_out),
        .pc_plus4 (pc_plus4)
    );

    // ------------------------------------------------------------------
    // Instruction memory
    // ------------------------------------------------------------------
    wire [31:0] instr;

    imem u_imem (
        .addr  (pc_out),
        .instr (instr)
    );

    // Instruction field slices
    wire [4:0] rs1       = instr[19:15];
    wire [4:0] rs2       = instr[24:20];
    wire [4:0] rd        = instr[11:7];
    wire [2:0] funct3    = instr[14:12];
    wire       funct7_5  = instr[30];

    // ------------------------------------------------------------------
    // Control Unit
    // ------------------------------------------------------------------
    wire        memwrite, branch, memread, regwrite, memtoreg, op_b_sel;
    wire [2:0]  aluop;
    wire [1:0]  op_a_sel;
    wire [1:0]  extend_sel;
    wire [1:0]  nextpc_sel;

    control_unit u_CU (
        .instr      (instr),
        .memwrite   (memwrite),
        .branch     (branch),
        .memread    (memread),
        .regwrite   (regwrite),
        .memtoreg   (memtoreg),
        .op_b       (op_b_sel),
        .aluop      (aluop),
        .op_a       (op_a_sel),
        .extend_sel (extend_sel),
        .nextpc_sel (nextpc_sel)
    );

    // ------------------------------------------------------------------
    // Register File
    // ------------------------------------------------------------------
    wire [31:0] rf_op_a, rf_op_b;
    wire [31:0] write_back_data;

    registerfile u_RF (
        .clk  (clk),
        .rst  (rst),
        .en   (regwrite),
        .rs1  (rs1),
        .rs2  (rs2),
        .rd   (rd),
        .data (write_back_data),
        .op_a (rf_op_a),
        .op_b (rf_op_b)
    );

    // ------------------------------------------------------------------
    // Immediate Generator
    // ------------------------------------------------------------------
    wire [31:0] S_type, B_type, U_type, I_type, J_type;

    immediate_generator u_IG (
        .PC          (pc_out),
        .Instruction (instr),
        .S_type      (S_type),
        .B_type      (B_type),
        .U_type      (U_type),
        .I_type      (I_type),
        .J_type      (J_type)
    );

    // Imm Sel mux: picks the immediate that feeds the ALU's B operand
    reg [31:0] imm_out;
    always @(*) begin
        case (extend_sel)
            2'b00:   imm_out = S_type;   // store
            2'b01:   imm_out = B_type;   // unused by current decode, kept for completeness
            2'b10:   imm_out = U_type;   // lui, auipc
            2'b11:   imm_out = I_type;   // addi/andi/... , loads
            default: imm_out = 32'b0;
        endcase
    end

    // ------------------------------------------------------------------
    // OpA / OpB muxes feeding the ALU
    // ------------------------------------------------------------------
    reg [31:0] alu_a;
    always @(*) begin
        case (op_a_sel)
            2'b00:   alu_a = rf_op_a;    // r/i/l/s/b types
            2'b01:   alu_a = pc_out;     // auipc -> PC + imm
            2'b10:   alu_a = pc_plus4;   // jal/jalr -> link address
            2'b11:   alu_a = 32'b0;      // lui -> 0 + imm
            default: alu_a = rf_op_a;
        endcase
    end

    wire [31:0] alu_b = op_b_sel ? imm_out : rf_op_b;

    // ------------------------------------------------------------------
    // ALU Control + ALU
    // ------------------------------------------------------------------
    wire [4:0] alu_ctrl;

    alu_control u_AC (
        .aluop     (aluop),
        .funct3    (funct3),
        .funct7_5  (funct7_5),
        .alu_ctrl  (alu_ctrl)
    );

    wire [31:0] alu_out;
    wire        alu_branch;

    alu u_ALU (
        .A            (alu_a),
        .B            (alu_b),
        .Alu_control  (alu_ctrl),
        .Alu_out      (alu_out),
        .Alu_branch   (alu_branch)
    );

    // ------------------------------------------------------------------
    // JALR target
    // ------------------------------------------------------------------
    wire [31:0] jalr_target;

    Jalr_Target u_JT (
        .rs1_data   (rf_op_a),
        .immsel_12  (I_type),
        .jalrt      (jalr_target)
    );

    // ------------------------------------------------------------------
    // Branch resolution + Next PC mux
    // ------------------------------------------------------------------
    wire        branch_taken   = branch & alu_branch;
    wire [31:0] branch_mux_out = branch_taken ? B_type : pc_plus4;

    reg [31:0] pc_mux_out;
    always @(*) begin
        case (nextpc_sel)
            2'b00:   pc_mux_out = pc_plus4;       // sequential
            2'b01:   pc_mux_out = branch_mux_out; // branch (taken or not)
            2'b10:   pc_mux_out = J_type;         // jal
            2'b11:   pc_mux_out = jalr_target;    // jalr
            default: pc_mux_out = pc_plus4;
        endcase
    end

    assign next_pc = pc_mux_out;

    // ------------------------------------------------------------------
    // Data memory
    // ------------------------------------------------------------------
    wire [31:0] dmem_read_data;

    dmem u_DMEM (
        .clk        (clk),
        .mem_write  (memwrite),
        .addr       (alu_out[9:0]),
        .write_data (rf_op_b),
        .read_data  (dmem_read_data)
    );

    // Mem/Rd mux -> register write-back data
    assign write_back_data = memtoreg ? dmem_read_data : alu_out;

endmodule