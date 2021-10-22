package Datapath

import chisel3._
import chisel3.util._



class DataMemIO(address: UInt, data:SInt) extends Bundle{

    val data_in = Input(data)
    val data_out = Output(data)
    val addr = Input(address)
    val wr_en = Input(Bool())
    val rd_en = Input(Bool())
}

class DataMem extends Module with Config{
    
    val io = IO(new DataMemIO(addrType, dataType))

    // Make memory of 32 x 32

    val memory = Mem(1024, dataType)


    io.data_out := 0.S

    when (io.wr_en) {

        memory.write(io.addr, io.data_in)

    } 
    
    when (io.rd_en) {
        io.data_out := memory.read(io.addr)
    }

    .otherwise {
        io.data_out := DontCare
    }
}



