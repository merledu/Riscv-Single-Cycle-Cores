module i_decode(
    input  wire [6:0] opcode,
    output wire r_type, i_type, l_type, s_type, b_type, jalr_type, jal_type, lui_type, auipc_type
);
    assign r_type     = (opcode == 7'h33);
    assign l_type     = (opcode == 7'h03);
    assign s_type     = (opcode == 7'h23);
    assign b_type     = (opcode == 7'h63);
    assign i_type     = (opcode == 7'h13);
    assign jalr_type  = (opcode == 7'h67);
    assign jal_type   = (opcode == 7'h6f);
    assign lui_type   = (opcode == 7'h37);
    assign auipc_type = (opcode == 7'h17);  
endmodule


module c_decode(
    input  wire r_type, i_type, l_type, s_type, b_type, jalr_type, jal_type, lui_type, auipc_type,
    output reg  memwrite, branch, memread, regwrite, memtoreg, op_b,
    output reg  [2:0] aluop,
    output reg  [1:0] op_a,
    output reg  [1:0] extend_sel,   // imm select
    output reg  [1:0] nextpc_sel
);
    always @(*) begin
        regwrite   = 1'b0;
        memread    = 1'b0;
        memwrite   = 1'b0;
        memtoreg   = 1'b0;
        branch     = 1'b0;
        op_b       = 1'b0;
        op_a       = 2'd0;
        aluop      = 3'b000;
        extend_sel = 2'b00;
        nextpc_sel = 2'b00;

        if (r_type) begin
            regwrite = 1'b1;
            aluop    = 3'b000;
        end
        else if (i_type) begin
            regwrite   = 1'b1;
            op_b       = 1'b1;
            aluop      = 3'b001;
            extend_sel = 2'b11;
        end
        else if (s_type) begin
            memwrite   = 1'b1;
            op_b       = 1'b1;
            aluop      = 3'b101;
            extend_sel = 2'b00;
        end
        else if (l_type) begin
            memread    = 1'b1;
            regwrite   = 1'b1;
            memtoreg   = 1'b1;
            op_b       = 1'b1;
            aluop      = 3'b100;
            extend_sel = 2'b11;
        end
        else if (b_type) begin
            branch     = 1'b1;
            aluop      = 3'b010;
            nextpc_sel = 2'b01;
            extend_sel = 2'b00;
        end
        else if (lui_type) begin
            regwrite   = 1'b1;
            op_b       = 1'b1;
            op_a       = 2'b11;
            aluop      = 3'b110;
            extend_sel = 2'b10;
        end
        else if (auipc_type) begin           // NEW: rd = PC + (imm20 << 12)
            regwrite   = 1'b1;
            op_b       = 1'b1;               // B = immediate
            op_a       = 2'b01;              // A = current PC
            aluop      = 3'b110;             // plain ADD
            extend_sel = 2'b10;              // U_type
            nextpc_sel = 2'b00;
        end
        else if (jalr_type) begin
            regwrite   = 1'b1;
            op_a       = 2'b10;
            aluop      = 3'b011;
            nextpc_sel = 2'b11;
        end
        else if (jal_type) begin
            regwrite   = 1'b1;
            op_a       = 2'b10;
            aluop      = 3'b011;
            nextpc_sel = 2'b10;
        end
    end
endmodule


module control_unit(
    input  wire [31:0] instr,
    output wire memwrite, branch, memread, regwrite, memtoreg, op_b,
    output wire [2:0] aluop,
    output wire [1:0] op_a,
    output wire [1:0] extend_sel,
    output wire [1:0] nextpc_sel
);
    wire [6:0] opcode = instr[6:0];
    wire r_type, i_type, l_type, s_type, b_type, jalr_type, jal_type, lui_type, auipc_type;

    i_decode u_i_decode (
        .opcode(opcode),
        .r_type(r_type), .i_type(i_type), .l_type(l_type), .s_type(s_type), .b_type(b_type),
        .jalr_type(jalr_type), .jal_type(jal_type), .lui_type(lui_type), .auipc_type(auipc_type)
    );

    c_decode u_c_decode (
        .r_type(r_type), .i_type(i_type), .l_type(l_type), .s_type(s_type), .b_type(b_type),
        .jalr_type(jalr_type), .jal_type(jal_type), .lui_type(lui_type), .auipc_type(auipc_type),
        .memwrite(memwrite), .branch(branch), .memread(memread),
        .regwrite(regwrite), .memtoreg(memtoreg), .op_b(op_b),
        .aluop(aluop), .op_a(op_a),
        .extend_sel(extend_sel), .nextpc_sel(nextpc_sel)
    );
endmodule

