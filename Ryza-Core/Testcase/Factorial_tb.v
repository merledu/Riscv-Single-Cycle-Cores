`timescale 1ns / 1ps

module tb_rv32i;

    reg clk;
    reg rst;

    rv32i_core_top uut (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_rv32i);

        rst = 1;
        #15;
        rst = 0;

        // 5 outer iterations, up to 15 inner-loop adds total, plus overhead —
        // generous margin so it settles into the END self-loop well before this
        #1500;

        $display("========================================");
        $display("   Execution Complete - Checking State   ");
        $display("========================================");

        // dmem uses raw, UNSHIFTED addressing (confirmed earlier), so the
        // store addresses 0,4,8,12,16 land at those exact array indices —
        // not sequential mem[0..4]
        $display("1! = %0d", uut.u_DMEM.mem[0]);
        $display("2! = %0d", uut.u_DMEM.mem[4]);
        $display("3! = %0d", uut.u_DMEM.mem[8]);
        $display("4! = %0d", uut.u_DMEM.mem[12]);
        $display("5! = %0d", uut.u_DMEM.mem[16]);
        $display("----------------------------------------");

        if (uut.u_DMEM.mem[16] == 32'd120) begin
            $display("SUCCESS: Factorial series correct! 5! = 120");
        end else begin
            $display("FAILED: Expected 5! = 120, got %0d", uut.u_DMEM.mem[16]);
        end
        $display("========================================");

        $finish;
    end

endmodule