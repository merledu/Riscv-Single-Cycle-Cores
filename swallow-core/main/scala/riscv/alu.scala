package riscv
import chisel3 . _
import chisel3 . util . _
object alu_op {
    val add = 0.U(5.W)
    val addi = 1.U(5.W)
    val sll = 2.U(5.W)
    val slli = 3.U(5.W)
    val slt = 4.U(5.W)
    val slti = 5.U(5.W)
    val sltu = 6.U(5.W)
    val sltui = 7.U(5.W)
    val bltu = 8.U(5.W)
    val xor = 9.U(5.W)
    val xori = 10.U(5.W)
    val srl = 11.U(5.W)
    val srli = 12.U(5.W)
    val or = 13.U(5.W)
    val ori = 14.U(5.W)
    val and = 15.U(5.W)
    val andi = 16.U(5.W)
    val sub = 17.U(5.W)
    val sra = 18.U(5.W)
    val srai = 19.U(5.W)
    val beq = 20.U(5.W)
    val bne = 21.U(5.W)
    val blt = 22.U(5.W)
    val bgeu = 23.U(5.W)
    val bge = 26.U(5.W)
    val jal = 24.U(5.W)
    val jalr = 25.U(5.W)
    val sw = 27.U(5.W)
    val lw = 28.U(5.W)

}
import alu_op._
class alu() extends Module {
    val io = IO(new Bundle{
        //val instruction = Input(UInt(32.W))
        val alu =Input(UInt(5.W))
        val a =Input(SInt(32.W))
        val b =Input(SInt(32.W))
        val out = Output(SInt(32.W))
        val branch = Output(Bool())
    })
    io.out :=
    Mux(io.alu === add || io.alu === addi,io.a + io.b,
    Mux(io.alu === sll || io.alu === slli,io.a << io.b(15,0),
    Mux(io.alu === slt || io.alu === slti,Mux(io.a < io.b,1.S,0.S),
    Mux(io.alu === sltu || io.alu === sltui ,Mux(io.a.asUInt < io.b.asUInt,1.S,0.S),
    Mux(io.alu === xor || io.alu === xori, io.a ^ io.b,
    Mux(io.alu === srl || io.alu === srli, io.a >> io.b(15,0),
    Mux(io.alu === or || io.alu === ori,io.a | io.b,
    Mux(io.alu === and || io.alu === andi,io.a & io.b,
    Mux(io.alu === sub,io.a - io.b,
    Mux(io.alu === sra || io.alu === srai,io.a >> io.b(15,0),
    Mux(io.alu === jal || io.alu === jalr,io.a,
    Mux(io.alu === sw,io.a + io.b,0.S))))))))))))


    io.branch := Mux(io.alu === beq,io.a  ===  io.b,
    Mux(io.alu === bne,io.a =/= io.b,
    Mux(io.alu === blt,io.a < io.b,
    Mux(io.alu === bgeu,io.a.asUInt >= io.b.asUInt,
    Mux(io.alu === bltu,io.a.asUInt < io.b.asUInt,
    Mux(io.alu === bge,io.a >= io.b,0.B))))))
}