package Singlecycle
import chisel3._

class Top extends Module {
    val io = IO(new Bundle {
        
        val reg_out = Output(SInt(32.W))         
 })
    
    val control = Module(new Control())
    val reg_file = Module(new RegisterFile())
    val alu = Module(new Alu())
    val alu_control = Module(new AluControl())
    val imm_generation = Module(new ImmediateGeneration())
    val jalr = Module(new Jalr())
    val pc = Module(new Pc())
    val imem = Module(new InstructionMem())
    val dmem = Module(new DataMem())

    
    imem.io.wrAddr := pc.io.out(11,2).asUInt
    val instruction = imem.io.readData
    pc.io.in := pc.io.pc4
    
    // Sending the input to the Control
    control.io.opcode := instruction(6, 0)

    // Sending current PC and instruction in Immediate Generation
    imm_generation.io.instruction := instruction
    imm_generation.io.pc := pc.io.out
    
    // Sending AluOp from Control and Func3 & Func7 from instruction
    alu_control.io.aluOp := control.io.out_aluOp
    alu_control.io.func7 := instruction(30)
    alu_control.io.func3 := instruction(14, 12)

    // Sending the register addresses from the instruction to the Register File
    reg_file.io.rs1_sel := instruction(19, 15)
    reg_file.io.rs2_sel := instruction(24, 20)
    reg_file.io.rd_sel := instruction(11, 7)
    reg_file.io.regWrite := control.io.out_regWrite

    // Wiring Jalr module
    jalr.io.input_a := reg_file.io.rs1
    jalr.io.input_b := imm_generation.io.i_imm

    // Controlling Operand A for ALU
    when(control.io.out_operand_a_sel === "b10".U) {
        alu.io.oper_a := pc.io.pc4
    } .otherwise {
        alu.io.oper_a := reg_file.io.rs1
    }
    // Controlling Operand B for ALU based on the Control signal Operand_b_sel and Extend_sel
    when(control.io.out_operand_b_sel === "b1".U) {
        when(control.io.out_extend_sel === "b00".U) {
            // I-Type
            alu.io.oper_b := imm_generation.io.i_imm    
        } .elsewhen(control.io.out_extend_sel === "b01".U) {
            // S-Type
            alu.io.oper_b := imm_generation.io.s_imm
        } .elsewhen(control.io.out_extend_sel === "b10".U) {
            // U-Type
            alu.io.oper_b := imm_generation.io.u_imm 
        } .otherwise {
            alu.io.oper_b := 0.S(32.W)
        }
    } .otherwise {
        alu.io.oper_b := reg_file.io.rs2
    }
    

    // Wiring the ALU operation with the ALU Control output
    alu.io.aluCtrl := alu_control.io.output

    // Controlling the next value of PC
    when(control.io.out_next_pc_sel === "b01".U) {
        when(control.io.out_branch === "b1".U && alu.io.branch === "b1".U) {
            pc.io.in := imm_generation.io.sb_imm
        } .otherwise {
            pc.io.in := pc.io.pc4
        }
    } .elsewhen(control.io.out_next_pc_sel === "b10".U) {
        pc.io.in := imm_generation.io.uj_imm+ pc.io.out
    } .elsewhen(control.io.out_next_pc_sel === "b11".U) {
        pc.io.in := jalr.io.output
    } .otherwise {
        pc.io.in := pc.io.pc4
    }


    // Writing the output of the ALU to the Register File
    //reg_file.io.writeData := alu.io.output

    dmem.io.memAddress := alu.io.out(11,2).asUInt
    dmem.io.memData := reg_file.io.rs2
    dmem.io.memWrite := control.io.out_memWrite
    dmem.io.memRead := control.io.out_memRead

    when(control.io.out_memToReg === "b1".U) {
        reg_file.io.writeData := dmem.io.memOut
    } .otherwise {
        reg_file.io.writeData := alu.io.out
    }

    // Just for testing
    io.reg_out := reg_file.io.rs1

}