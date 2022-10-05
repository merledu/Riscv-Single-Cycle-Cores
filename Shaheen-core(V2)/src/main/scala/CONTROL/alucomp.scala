package CONTROL

 import chisel3._
import chisel3.util._

class ALUcomp extends Module{
    val io = IO(new  Bundle{
        val alucontrol = Input(UInt(5.W))
        val val1 = Input(SInt(32.W))
        val val2 = Input(SInt(32.W))
        val out = Output(SInt(32.W))
        val branch_tk = Output(UInt(1.W))
    })
    io.out := 0.S
    when(io.alucontrol === "b00000".U) {
        // ADD
        io.out := io.val1 + io.val2

    } .elsewhen(io.alucontrol === "b00001".U) {
        // SLL/SLLI     // works for both signed and unsigned numbers
        val shift_left_by = io.val2(4,0)
        io.out:= io.val1 << shift_left_by

    } .elsewhen(io.alucontrol === "b00010".U) {
        // SLT/SLTI
        when(io.val1 < io.val2) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        } 

    } .elsewhen(io.alucontrol === "b00011".U || io.alucontrol === "b10110".U) {
        // SLTU/SLTUI/BLTU
        when(io.val1.asUInt < io.val2.asUInt) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        }

    } .elsewhen(io.alucontrol === "b00100".U) {
        // XOR/XORI
        io.out := io.val1 ^ io.val2

    } .elsewhen(io.alucontrol === "b00101".U || io.alucontrol === "b01101".U) {
        // SRL/SRLI/SRA/SRAI
        val shift_right_by = io.val2(4,0)
        io.out := io.val1 >> shift_right_by

    } .elsewhen(io.alucontrol === "b00110".U) {
        // OR/ORI
        io.out := io.val1 | io.val2

    } .elsewhen(io.alucontrol === "b00111".U) {
        // AND/ANDI
        io.out := io.val1 & io.val2

    } .elsewhen(io.alucontrol === "b01000".U) {
        // SUB
        io.out := io.val1 - io.val2
    
    } .elsewhen(io.alucontrol === "b10000".U) {
        // BEQ
        when(io.val1 === io.val2) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        }

    } .elsewhen(io.alucontrol === "b10001".U) {
        // BNE
        when(~(io.val1 === io.val2)) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        }

    } .elsewhen(io.alucontrol === "b10100".U) {
        // BLT
        when(io.val1 < io.val2) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        }

    } .elsewhen(io.alucontrol === "b10101".U) {
        // BGE
        when(io.val1 >= io.val2) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        }

    } .elsewhen(io.alucontrol === "b10111".U) {
        // BGEU
        when(io.val1.asUInt >= io.val2.asUInt) {
            io.out := 1.S
        } .otherwise {
            io.out := 0.S
        }

    } .elsewhen(io.alucontrol === "b11111".U) {
        // JALR/JAL
        io.out := io.val1
    }

    .otherwise {
        io.out := DontCare
    }

    when(io.alucontrol(4,3) === "b10".U && io.out === 1.S) {
        io.branch_tk := 1.U
    } .otherwise {
        io.branch_tk := 0.U
    }

}