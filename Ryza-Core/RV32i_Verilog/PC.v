module PC (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] pc_in,
    output reg  [31:0] pc_out,
    output wire [31:0] pc_plus4
);
    always @(posedge clk) begin
        if (rst)
            pc_out <= 32'd0;
        else
            pc_out <= pc_in;
    end

    assign pc_plus4 = pc_out + 32'd4;
endmodule