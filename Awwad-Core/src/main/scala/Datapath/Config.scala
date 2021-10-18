package Datapath

import chisel3._
import chisel3.util._

trait Config {

// Reg File

    val REGFILE_LEN = 32
    val XLEN = 32
    val address = UInt(5.W)
    val data = SInt(32.W)


    val WLEN = 32
    val ALUOP_SIG_LEN = 4
    val INST_MEM_LEN = 32
    val func3 = UInt(3.W)

// Instr Mem

    val datatype = UInt
    val AWLEN = 10
    val nRows = math.pow(2,AWLEN).toInt
    val initFile = "src/main/scala/Datapath/instrFile.txt"

// Type Decode

    val opCodeWidth = UInt(7.W)

//  Alu

    val in_out_Width = 32
    val AluCtrl = 5

//  Imm Gen

    val immOutType = SInt(32.W)
    val immInType = UInt(32.W)

//Alu COntrol
    val width_parameter=32

//DataMemory
    
    
//Jal
    val size=SInt(32.W)

//Pc
    val sizePc=UInt(32.W)
// Data Memory

    val addrType = UInt(32.W)
    val dataType = SInt(32.W)
    val memWidth = 32
    val rows = 1024
}