module imem (
    input  wire [31:0] addr,
    output wire [31:0] instr
);
    reg [31:0] mem [0:1023];
    initial $readmemh("program.hex", mem);
    assign instr = mem[addr[11:2]];  
endmodule