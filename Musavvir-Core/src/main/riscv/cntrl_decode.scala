package riscv
import chisel3._
import chisel3.util._
object cntrl{
    val r_type="b0110011".U(7.W)
    val i_type = "b0010011".U (7.W )
    val s_type = "b0100011".U (7.W )
    val u_type = "b0110111".U (7.W )
    val sb_type = "b1100011".U (7.W )
    val jal ="b1101111".U (7.W )
    val jalr ="b1100111".U(7.W)
    val load = "b0000011".U (7.W )
}

class interface extends Bundle {
    val Op_code= Input ( UInt (7. W ) )
    val MemWrite = Output(UInt(1.W))
	val Branch = Output(UInt(1.W))
	val MemRead = Output(UInt(1.W))
	val RegWrite = Output(UInt(1.W))
	val MemtoReg = Output(UInt(1.W))
	val AluOp = Output(UInt(3.W))
	val OpA = Output(UInt(2.W))
	val OpB = Output(UInt(1.W))
	val ExtSel = Output(UInt(2.W))
	val NextPc = Output(UInt(2.W))
  
}
import cntrl._
class control_decode extends Module {
    val io = IO (new interface )
// Start coding here
        io.MemWrite := 0.U
        io.Branch := 0.U
        io.MemRead := 0.U
        io.RegWrite := 0.U
        io.MemtoReg := 0.U
        io.AluOp := 0.U
        io.OpA := 0.U
        io.OpB := 0.U
        io.ExtSel := 0.U
        io.NextPc := 0.U
    switch(io.Op_code){
        is( r_type){
            io.MemWrite := 0.U
            io.Branch := 0.U
            io.MemRead := 0.U
            io.RegWrite := 1.U
            io.MemtoReg := 0.U
            io.AluOp := 0.U
            io.OpA := 0.U
            io.OpB := 0.U
            io.ExtSel := 0.U
            io.NextPc := 0.U
        }
        is( i_type){
            io.MemWrite := 0.U
            io.Branch := 0.U
            io.MemRead := 0.U
            io.RegWrite := 1.U
            io.MemtoReg := 0.U
            io.AluOp := 1.U
            io.OpA := 0.U
            io.OpB := 1.U
            io.ExtSel := 0.U
            io.NextPc := 0.U
        }
        is(sb_type){
            io.MemWrite := 0.U
            io.Branch := 1.U
            io.MemRead := 0.U
            io.RegWrite := 0.U
            io.MemtoReg := 0.U
            io.AluOp := 2.U
            io.OpA := 0.U
            io.OpB := 0.U
            io.ExtSel := 0.U
            io.NextPc := 1.U
        }
       is( jal ){
            io.MemWrite := 0.U
            io.Branch := 0.U
            io.MemRead := 0.U
            io.RegWrite := 1.U
            io.MemtoReg := 0.U
            io.AluOp := 3.U
            io.OpA := 1.U
            io.OpB := 0.U
            io.ExtSel := 0.U
            io.NextPc := 2.U
        }
        is( jalr ){
            io.MemWrite := 0.U
            io.Branch := 0.U
            io.MemRead := 0.U
            io.RegWrite := 1.U
            io.MemtoReg := 0.U
            io.AluOp := 3.U
            io.OpA := 1.U
            io.OpB := 1.U
            io.ExtSel := 0.U
            io.NextPc := 3.U
        }
        is(load){
            io.MemWrite := 0.U
            io.Branch := 0.U
            io.MemRead := 1.U
            io.RegWrite := 1.U
            io.MemtoReg := 1.U
            io.AluOp := 4.U
            io.OpA := 0.U
            io.OpB := 1.U
            io.ExtSel := 0.U
            io.NextPc := 0.U
        }
        is( s_type ){
            io.MemWrite := 1.U
            io.Branch := 0.U
            io.MemRead := 0.U
            io.RegWrite := 0.U
            io.MemtoReg := 0.U
            io.AluOp := 5.U
            io.OpA := 0.U
            io.OpB := 2.U
            io.ExtSel := 1.U
            io.NextPc := 0.U
        }
        is(u_type){
            io.MemWrite := 0.U
            io.Branch := 0.U
            io.MemRead := 0.U
            io.RegWrite := 1.U
            io.MemtoReg := 0.U
            io.AluOp := 6.U
            io.OpA := 2.U
            io.OpB := 1.U
            io.ExtSel := 2.U
            io.NextPc := 0.U
        }
         
    }
}