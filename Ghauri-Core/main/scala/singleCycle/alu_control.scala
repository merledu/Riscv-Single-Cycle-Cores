package singleCycle
import chisel3._
import chisel3.util._
class alu_control extends Module {
    val io = IO(new Bundle{
        val in = Input(UInt(32.W))
        val aluop = Input(Bool())
        val contol = Output(UInt(32.W))
    })
    io.contol := 0.U
    when (io.aluop === 1.B) {
        when (io.in(6,0) === "b0110011".U) {
            when (io.in(14,12) === "b000".U && io.in(31,25) === "b0000000".U) {//R-type (add)
                io.contol := 0.U//(add)
            }.elsewhen (io.in(14,12) === "b000".U && io.in(31,25) === "b0100000".U) {//R-type (sub)
                io.contol := 1.U
            }.elsewhen ( io.in(14,12) === "b001".U && io.in(31,25) === "b0000000".U ) {//R (sll)
                io.contol := 2.U
            }.elsewhen ( io.in(14,12) === "b010".U && io.in(31,25) === "b0000000".U) {//R (slt)
                io.contol := 3.U
            }.elsewhen ( io.in(14,12)  === "b011".U && io.in(31,25) === "b0000000".U) {//R (sltu)
                io.contol := 4.U
            }.elsewhen (io.in(14,12) === "b100".U && io.in(31,25) === "b0000000".U) {//R (xor)
                io.contol := 5.U
            }.elsewhen ( io.in(14,12) === "b101".U && io.in(31,25) === "b0000000".U) {//R (srl) or I (srli)
                io.contol := 6.U
            }.elsewhen ( io.in(14,12) === "b101".U && io.in(31,25) === "b0100000".U) {//R (sra) or I (srai)
                io.contol := 7.U
            }.elsewhen ( io.in(14,12) === "b110".U && io.in(31,25) === "b0000000".U ) {//R (or)
                io.contol := 8.U
            }.elsewhen ( io.in(14,12) === "b111".U && io.in(31,25) === "b0000000".U) {//R (and)
                io.contol := 9.U
            }
        }.elsewhen (io.in(6,0) === "b0010011".U) {
            when (io.in(14,12) === "b000".U) { //I (addi)
                io.contol := 0.U
            }.elsewhen (io.in(14,12) === "b001".U) {//I (slli)
                io.contol := 2.U
            }.elsewhen (io.in(14,12) === "b010".U) {//I (slti)
                io.contol := 3.U
            }.elsewhen (io.in(14,12) === "b011".U) {//I (sltui)
                io.contol := 4.U
            }.elsewhen (io.in(14,12) === "b100".U) {//I (xori)
                io.contol := 5.U
            }.elsewhen (io.in(14,12) === "b110".U) {//I (ori)
                io.contol := 8.U
            }.elsewhen (io.in(14,12) === "b111".U) {//I (andi)
                io.contol := 9.U
            }
        }.elsewhen (io.in(6,0) === "b0100011".U) {//S type 
            when (io.in(14,12) === "b000".U) {//S sb
                io.contol := 20.U
            }.elsewhen(io.in(14,12) === "b001".U) {//S sh
                io.contol := 21.U
            }.elsewhen(io.in(14,12) === "b010".U) {//S sw
                io.contol := 22.U 
            }
        }.elsewhen (io.in(6,0) === "b1100011".U) {//SB type
            when ( io.in(14,12) === "b000".U) {//sb (beq)
                io.contol := 10.U 
            }.elsewhen (io.in(14,12) === "b001".U) {//sb (bne)
                io.contol := 11.U
            }.elsewhen (io.in(14,12) === "b100".U) {//sb (blt)
                io.contol := 12.U
            }.elsewhen (io.in(14,12) === "b101".U) {//sb (bge)
                io.contol := 13.U
            }.elsewhen (io.in(14,12) === "b110".U) {//sb (bltu)
                io.contol := 14.U
            }.elsewhen (io.in(14,12) === "b111".U) {//sb (bgeu)
                io.contol := 15.U
            }
        }.elsewhen (io.in(6,0) === "b1101111".U) {//UJ type (jal)
            io.contol := 16.U
        }.elsewhen (io.in(6,0) === "b11000111".U) {//I type (jalr)
            io.contol := 17.U
        }.elsewhen (io.in(6,0) === "b0110111".U) {//U type
            io.contol := 18.U
        }.elsewhen (io.in(6,0) === "b0000011".U) {// load 
            when (io.in(14,12) === "b000".U) {//lb
                io.contol := 19.U
            }.elsewhen(io.in(14,12) === "b001".U) {// lh
                io.contol := 23.U
            }.elsewhen(io.in(14,12) === "b010".U) {// lw
                io.contol := 24.U 
            }
        }
    }.otherwise {
        io.contol := 0.U
    }
}

