
// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_rv32i;

    // Testbench signals
    reg clk;
    reg rst;

    // Instantiate the Top Module
    rv32i_core_top uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Simulation sequence
    initial begin
        // Waveform dumping (for EDA Playground, Vivado, or GTKWave)
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_rv32i);

        // 1. Apply Reset
        rst = 1;
        #15; // Hold reset for 1.5 clock cycles
        
        // 2. Release Reset - CPU starts fetching from PC = 0
        rst = 0;

        // 3. Wait for the program to execute
        // Fib(8) takes around 50-60 cycles to finish the loop
        #800; 

        // 4. Display Results
        $display("========================================");
        $display("   Execution Complete - Checking State  ");
        $display("========================================");
        
        // Peek directly into the instantiated register file array
        // Your RF array is named `register` inside `u_RF`
        $display("Loop Counter (x3) = %0d", uut.u_RF.register[3]);
        $display("Fib N-2      (x1) = %0d", uut.u_RF.register[1]);
        $display("Fib N-1      (x2) = %0d", uut.u_RF.register[2]);
        $display("Fib Current  (x5) = %0d", uut.u_RF.register[5]);
        $display("----------------------------------------");

        if (uut.u_RF.register[5] == 32'd34) begin
            $display("SUCCESS: Fibonacci(8) calculated correctly! Answer is 34.");
        end else begin
            $display("FAILED: Expected 34, but got %0d", uut.u_RF.register[5]);
        end
        $display("========================================");

        // 5. End Simulation
        $finish;
    end

endmodule



