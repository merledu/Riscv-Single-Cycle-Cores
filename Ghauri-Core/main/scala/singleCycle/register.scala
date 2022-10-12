package singleCycle
import chisel3._
import chisel3.util._
class register extends Module {
    val io = IO (new Bundle{
        val inst = Input(UInt(32.W))
        val reg_Write = Input(Bool())
        val write_date = Input(SInt(32.W))
        val rs1 = Output(SInt(32.W))
        val rs2 = Output(SInt(32.W))
        //val rd = Output(UInt(32.W))
    })
    dontTouch(io.inst)
    val regs = RegInit( VecInit (Seq.fill(32)(0.S( 32 . W ) ) ))
    io . rs1 := Mux (( io . inst(19,15) . orR ) , regs ( io . inst(19,15) ) , 0.S )
    io . rs2 := Mux (( io . inst(24,20). orR ) , regs ( io . inst(24,20) ) , 0.S )
    when ( io.reg_Write & io.inst(11,7).orR ) {
        regs ( io .inst(11,7) ) := io . write_date
    }
}
