package example

import chisel3._ 

class example extends Module {
    val io = IO(new Bundle{
        val in = Input(UInt(1.W))
        val out = Output(UInt(1.W))
    })

    io.out := ~io.in
}