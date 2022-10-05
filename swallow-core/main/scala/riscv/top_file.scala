package riscv
import chisel3 . _
import chisel3 . util . _
class top_file extends Module {
    val io = IO(new Bundle{
    //val out =Output(UInt(32.W))
    })
    val pc_module = Module(new pc_counter_plus_4)
    dontTouch(pc_module.io)
    val alu_control_module = Module(new alu_control)
    dontTouch(alu_control_module.io)
    val alu_module = Module(new alu)
    dontTouch(alu_module.io)
    val control_unit_module = Module(new control_unit)
    dontTouch(control_unit_module.io)
    val immediate_module = Module(new immediate_instruction)
    dontTouch(immediate_module.io)
    val instr_module = Module(new instr_memory)
    dontTouch(instr_module.io)
    val register_file_module = Module(new register_file)
    dontTouch(register_file_module.io)
    val s_memory_module = Module(new s_memory)
    dontTouch(s_memory_module.io)

    
    instr_module.io.address := pc_module.io.out >> 2.U
    control_unit_module.io.op_code := instr_module.io.r_data(7,0)
    register_file_module.io.rs1_in := instr_module.io.r_data(19,15)
    register_file_module.io.rs2_in := instr_module.io.r_data(24,20)

    immediate_module.io.i_instruction := instr_module.io.r_data

    alu_control_module.io.op_code := instr_module.io.r_data(7,0)
    alu_control_module.io.fn3 := instr_module.io.r_data(14,12)
    alu_control_module.io.fn7 := instr_module.io.r_data(30)

    immediate_module.io.pc_in := pc_module.io.out

    alu_module.io.b := Mux(control_unit_module.io.operand_b,immediate_module.io.out,register_file_module.io.rs2_out.asSInt)

    alu_module.io.a := MuxLookup(control_unit_module.io.operand_a,false.B,Array(
        (0.U) -> register_file_module.io.rs1_out.asSInt,
        (1.U) -> pc_module.io.out4.asSInt,
        (2.U) -> pc_module.io.out.asSInt,
        (3.U) -> register_file_module.io.rs1_out.asSInt)
    )
    alu_module.io.alu := alu_control_module.io.out
    s_memory_module.io.addr := alu_module.io.out.asUInt
    s_memory_module.io.mem_data := register_file_module.io.rs2_out.asSInt
    s_memory_module.io.w_enable := control_unit_module.io.mem_write
    s_memory_module.io.r_enable := control_unit_module.io.mem_read
    // register_file_module.io. reg_enable := control_unit_module.io.reg_write
    //val a = Mux(control_unit_module.io.mem_to_reg,s_memory_module.io.dataout,alu_module.io.out)
    // register_file_module.io.reg_data := (Mux(control_unit_module.io.mem_to_reg,s_memory_module.io.dataout,alu_module.io.out)).asSInt
    //dontTouch(a)

    register_file_module.io.rd := instr_module.io.r_data(11,7)
    register_file_module.io. reg_enable := control_unit_module.io.reg_write
    register_file_module.io.reg_data := (Mux(control_unit_module.io.mem_to_reg,s_memory_module.io.dataout,alu_module.io.out)).asSInt


    val logically_end = alu_module.io.branch && control_unit_module.io.branch

    val mux1 = Mux(logically_end,immediate_module.io.out_j_b,pc_module.io.out4.asSInt)
    val plus = immediate_module.io.out + register_file_module.io.rs1_out

    val nextPC = MuxLookup(control_unit_module.io.next_pc_selector,false.B,Array(
        (0.U) -> pc_module.io.out4,
        (1.U) -> mux1.asUInt,
        (2.U) -> immediate_module.io.out_j_b.asUInt,
        (3.U) -> plus.asUInt)
    )
    pc_module.io.pc := nextPC
    // register_file_module.io.rd := instr_module.io.r_data(11,7)
    // register_file_module.io. reg_enable := control_unit_module.io.reg_write
    // register_file_module.io.reg_data := (Mux(control_unit_module.io.mem_to_reg,s_memory_module.io.dataout,alu_module.io.out)).asSInt
}
