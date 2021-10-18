package Datapath

import chisel3._
import chisel3.util._

class Branch_Control_IO[T <: Data]( width : T ) extends Bundle {

    val fnct3 = Input(UInt(3.W))
    val branch = Input(Bool())
    val arg_x = Input(width)
    val arg_y = Input(width)
    val br_taken = Output(Bool()) //bNew
}

class BranchControl(size:UInt) extends Module {

    val io = IO (new Branch_Control_IO(size))
    io.br_taken := 0.B
    
    when (io.branch === 1.B) {
        
        when ((io.arg_x === io.arg_y) && io.fnct3 === "b000".U) {
            io.br_taken := 1.B
        }

        .elsewhen ((io.arg_x =/= io.arg_y) && io.fnct3 === "b001".U) {
            io.br_taken := 1.B
        }

        .elsewhen ((io.arg_x < io.arg_y) && (io.fnct3 === "b100".U | io.fnct3 === "b110".U)) {
            io.br_taken := 1.B
        }

        .elsewhen ((io.arg_x >= io.arg_y) && (io.fnct3 === "b101".U | io.fnct3 === "b111".U)) {
            io.br_taken := 1.B
        }

        .otherwise{
            io.br_taken := 0.B
        }
    }
    
    .otherwise{
        io.br_taken := 0.B
    }
}