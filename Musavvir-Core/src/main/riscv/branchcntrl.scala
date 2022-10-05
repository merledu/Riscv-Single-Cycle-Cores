// Branch control ( Assignment )
package riscv
import chisel3._
import chisel3.util._

object Alucnt {
// ALU Operations , may expand / modify in future
    val beq = "b10000". U 
    val bne = "b10011". U 
    val blt = "b10100". U 
    val bge = "b10101". U 
    val bltu = "b10110". U 
    val bgeu = "b10111". U 
}
import Alucnt._
class BranchControl extends Module {
val io = IO (new Bundle{
    val alucnt = Input(UInt(5.W))
    val Branch = Input(Bool())
    val in1 = Input(SInt(32.W))
    val in2 = Input(SInt(32.W))
    val br_taken = Output(Bool())
})
// Start Coding here
io.br_taken:=0.B
switch (io.alucnt){
    is (beq) {
        val check = io.in1 === io.in2
            io.br_taken:= Mux(io.in1 === io.in2,1.B,0.B) & io.Branch
        }
    is (bne) {
            io.br_taken:= Mux(io.in1 =/= io.in2,1.B,0.B) & io.Branch
        }
    is (blt) {
            io.br_taken:= Mux(io.in1 < io.in2,1.B,0.B) & io.Branch
        }
    is (bge ) {
            io.br_taken:= Mux(io.in1> io.in2,1.B,0.B) & io.Branch
        }
    is (bltu ) {
            io.br_taken:= Mux(io.in1.asUInt< io.in2.asUInt,1.B,0.B) & io.Branch
        }
    is (bgeu) {
            io.br_taken:= Mux(io.in1.asUInt<= io.in2.asUInt,1.B,0.B) & io.Branch
        }

}
}
