package CONTROL

import chisel3._
import chisel3.util._

class Top extends Module {
    val io = IO(new Bundle {
        // val addr = Input(UInt(32.W))
        val reg_out = Output(SInt(32.W))
        val addr = Output(UInt(10.W))
    })
    val alucomp_Module = Module(new ALUcomp())
    val alucontrol_Module = Module(new alucontrol())
    val controller_Module = Module(new controller())
    val datamem_Module = Module(new datamem())
    val immedgen_Module = Module(new immedgen())
    val instrmem_Module = Module(new instrmem())
    val jalR_Module = Module(new jalR())
    val pccount_Module = Module(new pccount())
    val regwrite_Module = Module(new regwrite())

pccount_Module.io.cin := MuxCase (0.U , Array(
    (controller_Module.io.next_PC_select.asUInt === 0.U) -> pccount_Module.io.pc4,
    (controller_Module.io.next_PC_select.asUInt === 1.U) -> Mux(alucomp_Module.io.branch_tk.asBool ,immedgen_Module.io.sb_imm.asUInt, pccount_Module.io.pc4),
    (controller_Module.io.next_PC_select.asUInt === 2.U) -> (pccount_Module.io.pc.asUInt + immedgen_Module.io.uj_imm.asUInt),
    (controller_Module.io.next_PC_select.asUInt === 3.U) -> jalR_Module.io.andfun.asUInt
    ))

// Control decode Module wiring 
                // Controller decode Input
    // pccount_Module.io.cin := pccount_Module.io.pc4
    instrmem_Module.io.writeaddr := pccount_Module.io.pc(11,2) //.asUInt
    controller_Module.io.opcode := instrmem_Module.io.readdata(6,0)
               io.addr := instrmem_Module.io.writeaddr 
                // Controller decode Output
    datamem_Module.io.memwrite := controller_Module.io.memwrite
    datamem_Module.io.memread := controller_Module.io.memread
    regwrite_Module.io.regwrite := controller_Module.io.regwrite
    alucontrol_Module.io.aluop := controller_Module.io.aluop

// pc value generator

// Register File Wiring
                //Register File Input
    regwrite_Module.io.rs1s := instrmem_Module.io.readdata(19,15)
    regwrite_Module.io.rs2s := instrmem_Module.io.readdata(24,20)
    regwrite_Module.io.rd := instrmem_Module.io.readdata(11,7)
    // regwrite_Module.io.write := // out not arrived will generate when mux build

// Instruction & PC IC wiring area2
                // Input of Intruction Generation
    immedgen_Module.io.instruction := instrmem_Module.io.readdata
    immedgen_Module.io.pc := pccount_Module.io.pc

    //  ALU control Wiring 
    alucontrol_Module.io.func3 := instrmem_Module.io.readdata(14,12)
    alucontrol_Module.io.func7 := instrmem_Module.io.readdata(30)
    alucomp_Module.io.alucontrol := alucontrol_Module.io.out
// Mux Wiring & setting between ALU and Reg File
    alucomp_Module.io.val1 := MuxCase(0.S , Array (
        (controller_Module.io.operand_A === (0.U)) -> regwrite_Module.io.rs1,
        (controller_Module.io.operand_A === (1.U)) -> pccount_Module.io.pc4.asSInt,
        (controller_Module.io.operand_A === (2.U)) -> pccount_Module.io.pc.asSInt,
        (controller_Module.io.operand_A === (3.U)) -> regwrite_Module.io.rs1
    ))


                // Output of Instruction Generation
    val mux_join = MuxCase(0.S ,Array(
         (controller_Module.io.extend === 0.U) -> immedgen_Module.io.i_imm,
        (controller_Module.io.extend === 1.U) -> immedgen_Module.io.s_imm,
         (controller_Module.io.extend === 2.U) -> immedgen_Module.io.u_imm
     ))

//  ALU mux 2 of value 2 

    alucomp_Module.io.val2 := MuxCase(0.S , Array(
        (controller_Module.io.operand_B === 0.B) -> regwrite_Module.io.rs2.asSInt,
        (controller_Module.io.operand_B === 1.B) -> mux_join
        ))


// AND gate module manual which will become input of mux
    //val and_gate_branch = alucomp_Module.io.branch.asBool & controller_Module.io.branch.asBool
    


// jalR wiring 
    jalR_Module.io.vl1 := regwrite_Module.io.rs1
    jalR_Module.io.vl2 := immedgen_Module.io.i_imm
    // OUTPUT OF JALR WILL BE ON MUX

    //val mux2 = Mux(and_gate_branch.asBool ,immedgen_Module.io.sb_imm.asUInt, pccount_Module.io.out)
    // val mux3 = MuxCase (0.U , Array(
    //     (controller_Module.io.next_PC_select.asUInt === 0.U) -> pccount_Module.io.pc,
    //     (controller_Module.io.next_PC_select.asUInt === 1.U) -> Mux(alucomp_Module.io.branch_tk.asBool ,immedgen_Module.io.sb_imm.asUInt, pccount_Module.io.pc4),
    //     (controller_Module.io.next_PC_select.asUInt === 2.U) -> immedgen_Module.io.uj_imm.asUInt,
    //     (controller_Module.io.next_PC_select.asUInt === 3.U) -> jalR_Module.io.andfun.asUInt
    // ))
// Data memory 
    datamem_Module.io.addr := alucomp_Module.io.out(9,2)
    datamem_Module.io.memdata := regwrite_Module.io.rs2

val last_mux = Mux(controller_Module.io.memtoreg,datamem_Module.io.memout,alucomp_Module.io.out)
regwrite_Module.io.writedat := last_mux
// pccount_Module.io.cin := MuxCase (0.U , Array(
//         (controller_Module.io.next_PC_select.asUInt === 0.U) -> pccount_Module.io.pc,
//         (controller_Module.io.next_PC_select.asUInt === 1.U) -> Mux(alucomp_Module.io.branch_tk.asBool ,immedgen_Module.io.sb_imm.asUInt, pccount_Module.io.pc4),
//         (controller_Module.io.next_PC_select.asUInt === 2.U) -> immedgen_Module.io.uj_imm.asUInt,
//         (controller_Module.io.next_PC_select.asUInt === 3.U) -> jalR_Module.io.andfun.asUInt
//     ))
io.reg_out := 0.S

}