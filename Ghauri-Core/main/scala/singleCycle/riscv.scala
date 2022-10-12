package singleCycle
import chisel3._
import chisel3.util._
class riscv extends Module {
    val io = IO(new Bundle{
    })
    val program_counter = Module(new pc)
    dontTouch(program_counter.io)
    val control_m = Module(new control)
    dontTouch(control_m.io)
    val alu_control_m =Module(new alu_control)
    dontTouch(alu_control_m.io)
    val data_mem_m = Module(new data_mem)
    dontTouch(data_mem_m.io)
    val inst_mem_m = Module(new inst_mem("/home/masfiyan/Desktop/inst.hex"))
    dontTouch(inst_mem_m.io)
    val register_m = Module(new register)
    dontTouch(register_m.io)
    val alu_m = Module(new alu)
    dontTouch(alu_m.io)
    val jalr_m = Module(new jalr_immediate)
    dontTouch(jalr_m.io)
    val imm_m = Module(new imm)
    dontTouch(imm_m.io)

    inst_mem_m.io.addr := (program_counter.io.pc).asUInt
    //io.addr := 1.U//inst_mem_m.io.inst
    control_m.io.inst_op := inst_mem_m.io.inst
    register_m.io.inst := inst_mem_m.io.inst
    imm_m.io.instr := inst_mem_m.io.inst
    imm_m.io.pc_in := program_counter.io.pc

    val imm_generator = MuxLookup (  (control_m.io.extend_sel), 0.U , Array (
    (0. U ) -> (imm_m.io.itype),
    (1. U ) -> (imm_m.io.stype),
    (2. U ) -> (imm_m.io.utype),
    (3. U ) -> 0.S
    ))
    
    val opB = Mux(control_m.io.operand_B,imm_generator,register_m.io.rs2)
    
    val opA = Mux(control_m.io.operand_A(0),
    Mux(control_m.io.operand_A(1),register_m.io.rs1,(program_counter.io.pc4).asSInt),
    Mux(control_m.io.operand_A(1),(program_counter.io.pc).asSInt,register_m.io.rs1))


    alu_control_m.io.in := inst_mem_m.io.inst
    alu_control_m.io.aluop := control_m.io.Alu
    alu_m.io.opcode := alu_control_m.io.contol
    alu_m.io.s1 := opA
    alu_m.io.s2 := opB
    data_mem_m.io.A := (alu_m.io.out).asUInt
    data_mem_m.io.D := register_m.io.rs2
    data_mem_m.io.mem_Write := control_m.io.mem_Write
    data_mem_m.io.mem_Read := control_m.io.mem_Read
    
    val register_write = Mux(control_m.io.mem_to_reg , data_mem_m.io.Dout , (alu_m.io.out).asSInt)
    register_m.io.reg_Write := control_m.io.reg_Write
    register_m.io.write_date := register_write

    jalr_m.io.in1 := register_m.io.rs1
    jalr_m.io.in2 := imm_generator

    val branch_and = control_m.io.branch & alu_m.io.branch
    val sb_immediate = Mux(branch_and,(imm_m.io.sbtype),(program_counter.io.pc4).asSInt)
    dontTouch(sb_immediate)
    program_counter.io.start := program_counter.io.pc

    val jump = MuxLookup (  (control_m.io.Next_pc), 0.U , Array (
    (0. U ) -> (program_counter.io.pc4),
    (1. U ) -> sb_immediate,
    (2. U ) -> imm_m.io.ujtype,
    (3. U ) -> jalr_m.io.out1
    ))
        

    program_counter.io.start := jump
    inst_mem_m.io.addr := (program_counter.io.pc).asUInt
    //dontTouch(M)
    dontTouch(program_counter.io.pc)
    dontTouch(sb_immediate)
    dontTouch(imm_m.io.sbtype)

}
