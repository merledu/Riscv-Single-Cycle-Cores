package riscv
import chisel3 . _
import chisel3 . util . _
class s_memory extends Module {
    val io = IO(new Bundle{
    val addr = Input(UInt(30.W))
    val mem_data = Input(SInt(32.W))
    val  w_enable= Input(Bool())
    val r_enable = Input(Bool())
    val dataout = Output(SInt(32.W))
    })
    val memory = Mem(1024,SInt(32.W))
    when(io.w_enable){
        memory.write(io.addr,io.mem_data)
    }
    io.dataout := memory.read(io.addr)
}