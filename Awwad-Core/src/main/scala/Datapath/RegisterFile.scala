package Datapath

import chisel3._

class RegFileIO(addressWidth:UInt, dataWidth:SInt) extends Bundle{

    val raddr1 = Input(addressWidth) // rs1sel
    val raddr2 = Input(addressWidth) //rs2sel
    val rdata1 = Output(dataWidth)  // rs1
    val rdata2 = Output(dataWidth) // rs2
    
    val regEn = Input(Bool())         
    val waddr = Input(addressWidth) // rdsel
    val wdata = Input(dataWidth) // rd

}

// trait CONFIG {
//     val REGFILE_LEN = 32
//     val XLEN = 32

// }

class RegFile extends Module with Config {
    
    val io = IO(new RegFileIO(address,data))
    val regs = Reg(Vec(REGFILE_LEN, SInt(XLEN.W)))
    regs(0) := 0.S
    io.rdata1 := Mux((io.raddr1.orR), regs(io.raddr1), 0.S)
    io.rdata2 := Mux((io.raddr2.orR), regs(io.raddr2), 0.S)

    when (io.regEn & io.waddr.orR) {
        
        regs (io.waddr) := io.wdata
    
    }
}