package singleCycle
import chisel3._
import chisel3.util._
object op{
    val add = 0.U(5.W)
    val sub = 1.U(5.W)
    val sll = 2.U(5.W)
    val slt = 3.U(5.W)
    val sltu = 4.U(5.W)
    val xor = 5.U(5.W)
    val srl = 6.U(5.W)
    val sra = 7.U(5.W)
    val or = 8.U(5.W)
    val and = 9.U(5.W)
    val beq = 10.U(5.W)
    val bne = 11.U(5.W)
    val blt = 12.U(5.W)
    val bge = 13.U(5.W)
    val bltu = 14.U(5.W)
    val bgeu = 15.U(5.W)
    val jal = 16.U(10.W)
    val jalr = 17.U(10.W)
    val lui = 18.U(10.W)
    val lb = 19.U(10.W)
    val sb = 20.U(10.W)
    val sh = 21.U(10.W)
    val sw = 22.U(10.W)
    val lh = 23.U(10.W)
    val lw = 24.U(10.W)
}
class alu extends Module {
    val io = IO(new Bundle{
        val s1 = Input(SInt(32.W))
        val s2 = Input(SInt(32.W))
        val opcode = Input(UInt(5.W))
        val branch = Output(Bool())
        val out = Output(SInt(32.W))
    })
    val addition = io.s1 + io.s2
    io.out := Mux(io.opcode === op.add,io.s1 + io.s2,
    Mux(io.opcode === op.sub,io.s1 - io.s2,
    Mux(io.opcode === op.sll , (io.s1.asUInt << io.s2(18,0)).asSInt,
    Mux(io.opcode === op.slt , (io.s1 < io.s2).asSInt,
    Mux(io.opcode === op.sltu, (io.s1< io.s2).asSInt,
    Mux(io.opcode === op.xor , io.s1 ^ io.s2 ,
    Mux(io.opcode === op.srl , (io.s1.asUInt >> io.s2(18,0).asUInt).asSInt , 
    Mux(io.opcode === op.sra , (io.s1 >> io.s2(18,0).asUInt).asSInt,
    Mux(io.opcode === op.or , io.s1 | io.s2 , 
    Mux(io.opcode === op.and , io.s1 & io.s2 , 
    Mux(io.opcode === op.jal , io.s1 ,
    Mux(io.opcode === op.jalr , io.s1 + 0.S, 
    Mux(io.opcode === op.lui , io.s2 , 
    Mux(io.opcode === op.lb ,(Cat("b000000000000000000000000".U,addition(7,0))).asSInt ,
    Mux(io.opcode === op.lh ,(addition(15,0)).asSInt,
    Mux(io.opcode === op.lw ,(addition(31,0)).asSInt,
    Mux(io.opcode === op.sb ,(Cat("b000000000000000000000000".U,addition(7,0))).asSInt,
    Mux(io.opcode === op.sh ,(addition(15,0)).asSInt,
    Mux(io.opcode === op.sw  ,(addition(31,0)).asSInt, 0.S)))))))))))))))))))
    
    io.branch := 0.U
    when ( io.opcode === op.beq) {
        when ( io.s1 === io.s2) {
            io.branch := 1.B
        }
    }.elsewhen ( io.opcode ===  op.bne) {
        when (io.s1 =/= io.s2) {
            io.branch := 1.B
        }
    }.elsewhen (io.opcode === op.blt) {
        when ( io.s1 < io.s2) {
            io.branch := 1.B
        }
    }.elsewhen (io.opcode === op.bge) {
        when(io.s1 >= io.s2) {
            io.branch := 1.B
        }
    }.elsewhen (io.opcode === op.bltu) {
        when (io.s1.asUInt < io.s2.asUInt) {
            io.branch := 1.B
        }
    }.elsewhen (io.opcode === op.bgeu) {
        when (io.s1.asUInt >= io.s2.asUInt) {
            io.branch := 1.B
        }
    }
}