module dmem (
    input  wire        clk,
    input  wire        mem_write,     // from CU — confirm this drives `str`
    input  wire [9:0]  addr,          // raw alu_out[9:0], no shift
    input  wire [31:0] write_data,
    output wire [31:0] read_data
);
    reg [31:0] mem [0:1023];

    always @(posedge clk) begin
        if (mem_write)
            mem[addr] <= write_data;
    end

    assign read_data = mem[addr];
endmodule