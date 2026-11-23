module registerfile (
    input wire        clk,
    input wire        rst,
    input wire        en, //regwrite
    input wire [4:0]  rs1, //read from r1
    input wire [4:0]  rs2, //read from r2
    input wire [4:0]  rd,   //write to reg
    input wire [31:0] data, 
    output wire [31:0] op_a, //read data 1
    output wire [31:0] op_b //read data 2
);
    reg [31:0] register [1:31];
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for (i = 1; i < 32; i = i + 1)
                register[i] <= 32'b0;
        end else if (en && rd != 5'd0) begin
            register[rd] <= data;
        end
    end

    assign op_a = (rs1 == 5'd0) ? 32'b0 : register[rs1];
    assign op_b = (rs2 == 5'd0) ? 32'b0 : register[rs2];
endmodule