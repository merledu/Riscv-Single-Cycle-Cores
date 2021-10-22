circuit TopFile :
  module Alu :
    input clock : Clock
    input reset : UInt<1>
    input io_AluControl : UInt<5>
    input io_in1 : SInt<32>
    input io_in2 : SInt<32>
    output io_Branch : UInt<1>
    output io_out : SInt<32>

    node _T = eq(io_AluControl, UInt<1>("h0")) @[Alu.scala 22:29]
    node _io_out_T = add(io_in1, io_in2) @[Alu.scala 22:62]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Alu.scala 22:62]
    node _io_out_T_2 = asSInt(_io_out_T_1) @[Alu.scala 22:62]
    node _T_1 = eq(io_AluControl, UInt<1>("h1")) @[Alu.scala 24:34]
    node _io_out_T_3 = bits(io_in2, 4, 0) @[Alu.scala 24:76]
    node _io_out_T_4 = dshl(io_in1, _io_out_T_3) @[Alu.scala 24:67]
    node _T_2 = eq(io_AluControl, UInt<3>("h4")) @[Alu.scala 26:34]
    node _io_out_T_5 = xor(io_in1, io_in2) @[Alu.scala 26:67]
    node _io_out_T_6 = asSInt(_io_out_T_5) @[Alu.scala 26:67]
    node _T_3 = eq(io_AluControl, UInt<3>("h5")) @[Alu.scala 28:34]
    node _T_4 = eq(io_AluControl, UInt<4>("hd")) @[Alu.scala 28:66]
    node _T_5 = or(_T_3, _T_4) @[Alu.scala 28:49]
    node _io_out_T_7 = bits(io_in2, 4, 0) @[Alu.scala 28:108]
    node _io_out_T_8 = dshr(io_in1, _io_out_T_7) @[Alu.scala 28:99]
    node _T_6 = eq(io_AluControl, UInt<3>("h6")) @[Alu.scala 30:34]
    node _io_out_T_9 = or(io_in1, io_in2) @[Alu.scala 30:67]
    node _io_out_T_10 = asSInt(_io_out_T_9) @[Alu.scala 30:67]
    node _T_7 = eq(io_AluControl, UInt<3>("h7")) @[Alu.scala 32:34]
    node _io_out_T_11 = and(io_in1, io_in2) @[Alu.scala 32:67]
    node _io_out_T_12 = asSInt(_io_out_T_11) @[Alu.scala 32:67]
    node _T_8 = eq(io_AluControl, UInt<4>("h8")) @[Alu.scala 34:34]
    node _io_out_T_13 = sub(io_in1, io_in2) @[Alu.scala 34:67]
    node _io_out_T_14 = tail(_io_out_T_13, 1) @[Alu.scala 34:67]
    node _io_out_T_15 = asSInt(_io_out_T_14) @[Alu.scala 34:67]
    node _T_9 = eq(io_AluControl, UInt<5>("h1f")) @[Alu.scala 36:34]
    node _T_10 = eq(io_AluControl, UInt<5>("h15")) @[Alu.scala 38:34]
    node _T_11 = geq(io_in1, io_in2) @[Alu.scala 39:30]
    node _GEN_0 = mux(_T_11, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 39:40 Alu.scala 39:48 Alu.scala 19:16]
    node _T_12 = eq(io_AluControl, UInt<5>("h17")) @[Alu.scala 42:34]
    node _T_13 = asUInt(io_in1) @[Alu.scala 43:30]
    node _T_14 = asUInt(io_in2) @[Alu.scala 43:47]
    node _T_15 = geq(_T_13, _T_14) @[Alu.scala 43:37]
    node _GEN_1 = mux(_T_15, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 43:54 Alu.scala 43:62 Alu.scala 44:36]
    node _T_16 = eq(io_AluControl, UInt<2>("h3")) @[Alu.scala 46:34]
    node _T_17 = eq(io_AluControl, UInt<5>("h16")) @[Alu.scala 46:66]
    node _T_18 = or(_T_16, _T_17) @[Alu.scala 46:49]
    node _T_19 = asUInt(io_in1) @[Alu.scala 47:30]
    node _T_20 = asUInt(io_in2) @[Alu.scala 47:46]
    node _T_21 = lt(_T_19, _T_20) @[Alu.scala 47:37]
    node _GEN_2 = mux(_T_21, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 47:53 Alu.scala 47:61 Alu.scala 48:36]
    node _T_22 = eq(io_AluControl, UInt<5>("h10")) @[Alu.scala 50:34]
    node _T_23 = eq(io_in1, io_in2) @[Alu.scala 51:30]
    node _GEN_3 = mux(_T_23, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 51:41 Alu.scala 51:49 Alu.scala 52:36]
    node _T_24 = eq(io_AluControl, UInt<2>("h2")) @[Alu.scala 54:34]
    node _T_25 = eq(io_AluControl, UInt<5>("h14")) @[Alu.scala 54:66]
    node _T_26 = or(_T_24, _T_25) @[Alu.scala 54:49]
    node _T_27 = lt(io_in1, io_in2) @[Alu.scala 55:30]
    node _GEN_4 = mux(_T_27, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 55:39 Alu.scala 55:47 Alu.scala 56:36]
    node _T_28 = eq(io_AluControl, UInt<5>("h11")) @[Alu.scala 58:34]
    node _T_29 = neq(io_in1, io_in2) @[Alu.scala 60:30]
    node _GEN_5 = mux(_T_29, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 60:41 Alu.scala 61:32 Alu.scala 65:32]
    node _GEN_6 = validif(_T_28, _GEN_5) @[Alu.scala 58:49]
    node _GEN_7 = mux(_T_26, _GEN_4, _GEN_6) @[Alu.scala 54:81]
    node _GEN_8 = mux(_T_22, _GEN_3, _GEN_7) @[Alu.scala 50:49]
    node _GEN_9 = mux(_T_18, _GEN_2, _GEN_8) @[Alu.scala 46:81]
    node _GEN_10 = mux(_T_12, _GEN_1, _GEN_9) @[Alu.scala 42:49]
    node _GEN_11 = mux(_T_10, _GEN_0, _GEN_10) @[Alu.scala 38:49]
    node _GEN_12 = mux(_T_9, io_in1, _GEN_11) @[Alu.scala 36:49 Alu.scala 36:57]
    node _GEN_13 = mux(_T_8, _io_out_T_15, _GEN_12) @[Alu.scala 34:49 Alu.scala 34:57]
    node _GEN_14 = mux(_T_7, _io_out_T_12, _GEN_13) @[Alu.scala 32:49 Alu.scala 32:57]
    node _GEN_15 = mux(_T_6, _io_out_T_10, _GEN_14) @[Alu.scala 30:49 Alu.scala 30:57]
    node _GEN_16 = mux(_T_5, _io_out_T_8, _GEN_15) @[Alu.scala 28:81 Alu.scala 28:89]
    node _GEN_17 = mux(_T_2, _io_out_T_6, _GEN_16) @[Alu.scala 26:49 Alu.scala 26:57]
    node _GEN_18 = mux(_T_1, _io_out_T_4, _GEN_17) @[Alu.scala 24:49 Alu.scala 24:57]
    node _GEN_19 = mux(_T, _io_out_T_2, _GEN_18) @[Alu.scala 22:44 Alu.scala 22:52]
    node _T_30 = eq(io_out, asSInt(UInt<2>("h1"))) @[Alu.scala 75:22]
    node _T_31 = bits(io_AluControl, 4, 3) @[Alu.scala 75:46]
    node _T_32 = eq(_T_31, UInt<2>("h2")) @[Alu.scala 75:52]
    node _T_33 = and(_T_30, _T_32) @[Alu.scala 75:30]
    node _GEN_20 = mux(_T_33, UInt<1>("h1"), UInt<1>("h0")) @[Alu.scala 75:64 Alu.scala 76:27 Alu.scala 80:27]
    io_Branch <= _GEN_20
    io_out <= asSInt(bits(_GEN_19, 31, 0))

  module AluControl :
    input clock : Clock
    input reset : UInt<1>
    input io_Aluop : UInt<3>
    input io_func7 : UInt<1>
    input io_func3 : UInt<3>
    output io_control : UInt<5>

    node _io_control_T = eq(io_Aluop, UInt<1>("h0")) @[AluControl.scala 23:27]
    node _io_control_T_1 = eq(io_func7, UInt<1>("h0")) @[AluControl.scala 23:52]
    node _io_control_T_2 = and(_io_control_T, _io_control_T_1) @[AluControl.scala 23:40]
    node _io_control_T_3 = cat(UInt<1>("h0"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_4 = eq(io_Aluop, UInt<1>("h0")) @[AluControl.scala 24:27]
    node _io_control_T_5 = eq(io_func7, UInt<1>("h1")) @[AluControl.scala 24:52]
    node _io_control_T_6 = and(_io_control_T_4, _io_control_T_5) @[AluControl.scala 24:40]
    node _io_control_T_7 = cat(UInt<1>("h1"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_8 = eq(io_Aluop, UInt<1>("h1")) @[AluControl.scala 28:27]
    node _io_control_T_9 = eq(io_func3, UInt<3>("h5")) @[AluControl.scala 28:52]
    node _io_control_T_10 = and(_io_control_T_8, _io_control_T_9) @[AluControl.scala 28:40]
    node _io_control_T_11 = eq(io_func7, UInt<1>("h0")) @[AluControl.scala 28:77]
    node _io_control_T_12 = and(_io_control_T_10, _io_control_T_11) @[AluControl.scala 28:65]
    node _io_control_T_13 = cat(UInt<1>("h0"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_14 = eq(io_Aluop, UInt<1>("h1")) @[AluControl.scala 32:27]
    node _io_control_T_15 = eq(io_func3, UInt<3>("h5")) @[AluControl.scala 32:52]
    node _io_control_T_16 = and(_io_control_T_14, _io_control_T_15) @[AluControl.scala 32:40]
    node _io_control_T_17 = eq(io_func7, UInt<1>("h1")) @[AluControl.scala 32:77]
    node _io_control_T_18 = and(_io_control_T_16, _io_control_T_17) @[AluControl.scala 32:65]
    node _io_control_T_19 = cat(UInt<1>("h1"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_20 = eq(io_Aluop, UInt<1>("h1")) @[AluControl.scala 36:27]
    node _io_control_T_21 = eq(io_func3, UInt<1>("h1")) @[AluControl.scala 36:52]
    node _io_control_T_22 = and(_io_control_T_20, _io_control_T_21) @[AluControl.scala 36:40]
    node _io_control_T_23 = cat(UInt<1>("h0"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_24 = eq(io_Aluop, UInt<1>("h1")) @[AluControl.scala 40:27]
    node _io_control_T_25 = cat(UInt<1>("h0"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_26 = eq(io_Aluop, UInt<2>("h2")) @[AluControl.scala 44:27]
    node _io_control_T_27 = cat(UInt<2>("h2"), io_func3) @[Cat.scala 30:58]
    node _io_control_T_28 = eq(io_Aluop, UInt<2>("h3")) @[AluControl.scala 48:27]
    node _io_control_T_29 = mux(_io_control_T_28, UInt<5>("h1f"), UInt<1>("h0")) @[Mux.scala 98:16]
    node _io_control_T_30 = mux(_io_control_T_26, _io_control_T_27, _io_control_T_29) @[Mux.scala 98:16]
    node _io_control_T_31 = mux(_io_control_T_24, _io_control_T_25, _io_control_T_30) @[Mux.scala 98:16]
    node _io_control_T_32 = mux(_io_control_T_22, _io_control_T_23, _io_control_T_31) @[Mux.scala 98:16]
    node _io_control_T_33 = mux(_io_control_T_18, _io_control_T_19, _io_control_T_32) @[Mux.scala 98:16]
    node _io_control_T_34 = mux(_io_control_T_12, _io_control_T_13, _io_control_T_33) @[Mux.scala 98:16]
    node _io_control_T_35 = mux(_io_control_T_6, _io_control_T_7, _io_control_T_34) @[Mux.scala 98:16]
    node _io_control_T_36 = mux(_io_control_T_2, _io_control_T_3, _io_control_T_35) @[Mux.scala 98:16]
    io_control <= _io_control_T_36 @[AluControl.scala 19:20]

  module TypeDecode :
    input clock : Clock
    input reset : UInt<1>
    input io_opCode : UInt<7>
    output io_RType : UInt<1>
    output io_Load : UInt<1>
    output io_Store : UInt<1>
    output io_Branch : UInt<1>
    output io_IType : UInt<1>
    output io_Jalr : UInt<1>
    output io_Jal : UInt<1>
    output io_Lui : UInt<1>

    node _T = eq(io_opCode, UInt<6>("h33")) @[TypeDecode.scala 32:24]
    node _T_1 = eq(io_opCode, UInt<2>("h3")) @[TypeDecode.scala 36:29]
    node _T_2 = eq(io_opCode, UInt<6>("h23")) @[TypeDecode.scala 40:29]
    node _T_3 = eq(io_opCode, UInt<7>("h63")) @[TypeDecode.scala 44:29]
    node _T_4 = eq(io_opCode, UInt<5>("h13")) @[TypeDecode.scala 48:29]
    node _T_5 = eq(io_opCode, UInt<7>("h67")) @[TypeDecode.scala 52:29]
    node _T_6 = eq(io_opCode, UInt<7>("h6f")) @[TypeDecode.scala 56:29]
    node _T_7 = eq(io_opCode, UInt<6>("h37")) @[TypeDecode.scala 60:29]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 60:46 TypeDecode.scala 61:24 TypeDecode.scala 30:16]
    node _GEN_1 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 56:46 TypeDecode.scala 57:24 TypeDecode.scala 29:16]
    node _GEN_2 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[TypeDecode.scala 56:46 TypeDecode.scala 30:16]
    node _GEN_3 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 52:46 TypeDecode.scala 53:25 TypeDecode.scala 28:17]
    node _GEN_4 = mux(_T_5, UInt<1>("h0"), _GEN_1) @[TypeDecode.scala 52:46 TypeDecode.scala 29:16]
    node _GEN_5 = mux(_T_5, UInt<1>("h0"), _GEN_2) @[TypeDecode.scala 52:46 TypeDecode.scala 30:16]
    node _GEN_6 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 48:46 TypeDecode.scala 49:26 TypeDecode.scala 27:18]
    node _GEN_7 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[TypeDecode.scala 48:46 TypeDecode.scala 28:17]
    node _GEN_8 = mux(_T_4, UInt<1>("h0"), _GEN_4) @[TypeDecode.scala 48:46 TypeDecode.scala 29:16]
    node _GEN_9 = mux(_T_4, UInt<1>("h0"), _GEN_5) @[TypeDecode.scala 48:46 TypeDecode.scala 30:16]
    node _GEN_10 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 44:46 TypeDecode.scala 45:27 TypeDecode.scala 26:19]
    node _GEN_11 = mux(_T_3, UInt<1>("h0"), _GEN_6) @[TypeDecode.scala 44:46 TypeDecode.scala 27:18]
    node _GEN_12 = mux(_T_3, UInt<1>("h0"), _GEN_7) @[TypeDecode.scala 44:46 TypeDecode.scala 28:17]
    node _GEN_13 = mux(_T_3, UInt<1>("h0"), _GEN_8) @[TypeDecode.scala 44:46 TypeDecode.scala 29:16]
    node _GEN_14 = mux(_T_3, UInt<1>("h0"), _GEN_9) @[TypeDecode.scala 44:46 TypeDecode.scala 30:16]
    node _GEN_15 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 40:46 TypeDecode.scala 41:26 TypeDecode.scala 25:18]
    node _GEN_16 = mux(_T_2, UInt<1>("h0"), _GEN_10) @[TypeDecode.scala 40:46 TypeDecode.scala 26:19]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_11) @[TypeDecode.scala 40:46 TypeDecode.scala 27:18]
    node _GEN_18 = mux(_T_2, UInt<1>("h0"), _GEN_12) @[TypeDecode.scala 40:46 TypeDecode.scala 28:17]
    node _GEN_19 = mux(_T_2, UInt<1>("h0"), _GEN_13) @[TypeDecode.scala 40:46 TypeDecode.scala 29:16]
    node _GEN_20 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[TypeDecode.scala 40:46 TypeDecode.scala 30:16]
    node _GEN_21 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 36:46 TypeDecode.scala 37:25 TypeDecode.scala 24:17]
    node _GEN_22 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[TypeDecode.scala 36:46 TypeDecode.scala 25:18]
    node _GEN_23 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[TypeDecode.scala 36:46 TypeDecode.scala 26:19]
    node _GEN_24 = mux(_T_1, UInt<1>("h0"), _GEN_17) @[TypeDecode.scala 36:46 TypeDecode.scala 27:18]
    node _GEN_25 = mux(_T_1, UInt<1>("h0"), _GEN_18) @[TypeDecode.scala 36:46 TypeDecode.scala 28:17]
    node _GEN_26 = mux(_T_1, UInt<1>("h0"), _GEN_19) @[TypeDecode.scala 36:46 TypeDecode.scala 29:16]
    node _GEN_27 = mux(_T_1, UInt<1>("h0"), _GEN_20) @[TypeDecode.scala 36:46 TypeDecode.scala 30:16]
    node _GEN_28 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[TypeDecode.scala 32:41 TypeDecode.scala 33:26 TypeDecode.scala 23:18]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_21) @[TypeDecode.scala 32:41 TypeDecode.scala 24:17]
    node _GEN_30 = mux(_T, UInt<1>("h0"), _GEN_22) @[TypeDecode.scala 32:41 TypeDecode.scala 25:18]
    node _GEN_31 = mux(_T, UInt<1>("h0"), _GEN_23) @[TypeDecode.scala 32:41 TypeDecode.scala 26:19]
    node _GEN_32 = mux(_T, UInt<1>("h0"), _GEN_24) @[TypeDecode.scala 32:41 TypeDecode.scala 27:18]
    node _GEN_33 = mux(_T, UInt<1>("h0"), _GEN_25) @[TypeDecode.scala 32:41 TypeDecode.scala 28:17]
    node _GEN_34 = mux(_T, UInt<1>("h0"), _GEN_26) @[TypeDecode.scala 32:41 TypeDecode.scala 29:16]
    node _GEN_35 = mux(_T, UInt<1>("h0"), _GEN_27) @[TypeDecode.scala 32:41 TypeDecode.scala 30:16]
    io_RType <= _GEN_28
    io_Load <= _GEN_29
    io_Store <= _GEN_30
    io_Branch <= _GEN_31
    io_IType <= _GEN_32
    io_Jalr <= _GEN_33
    io_Jal <= _GEN_34
    io_Lui <= _GEN_35

  module ControlDecode :
    input clock : Clock
    input reset : UInt<1>
    input io_RType : UInt<1>
    input io_Load : UInt<1>
    input io_Store : UInt<1>
    input io_SBType : UInt<1>
    input io_IType : UInt<1>
    input io_Jalr : UInt<1>
    input io_Jal : UInt<1>
    input io_Lui : UInt<1>
    output io_MemWrite : UInt<1>
    output io_Branch : UInt<1>
    output io_MemRead : UInt<1>
    output io_RegWrite : UInt<1>
    output io_MemToReg : UInt<1>
    output io_AluOp : UInt<3>
    output io_Operand_aSel : UInt<2>
    output io_Operand_bSel : UInt<1>
    output io_ExtendSel : UInt<2>
    output io_NextPcSel : UInt<2>

    node _T = eq(io_RType, UInt<1>("h1")) @[ControlDecode.scala 45:23]
    node _T_1 = eq(io_Load, UInt<1>("h1")) @[ControlDecode.scala 49:23]
    node _T_2 = eq(io_Store, UInt<1>("h1")) @[ControlDecode.scala 57:24]
    node _T_3 = eq(io_SBType, UInt<1>("h1")) @[ControlDecode.scala 64:25]
    node _T_4 = eq(io_IType, UInt<1>("h1")) @[ControlDecode.scala 70:24]
    node _T_5 = eq(io_Jalr, UInt<1>("h1")) @[ControlDecode.scala 76:23]
    node _T_6 = eq(io_Jal, UInt<1>("h1")) @[ControlDecode.scala 83:22]
    node _T_7 = eq(io_Lui, UInt<1>("h1")) @[ControlDecode.scala 90:22]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[ControlDecode.scala 90:30 ControlDecode.scala 91:29 ControlDecode.scala 37:21]
    node _GEN_1 = mux(_T_7, UInt<3>("h6"), UInt<1>("h0")) @[ControlDecode.scala 90:30 ControlDecode.scala 92:26 ControlDecode.scala 39:18]
    node _GEN_2 = mux(_T_7, UInt<2>("h3"), UInt<1>("h0")) @[ControlDecode.scala 90:30 ControlDecode.scala 93:33 ControlDecode.scala 40:25]
    node _GEN_3 = mux(_T_6, UInt<1>("h1"), _GEN_0) @[ControlDecode.scala 83:30 ControlDecode.scala 84:29]
    node _GEN_4 = mux(_T_6, UInt<2>("h3"), _GEN_1) @[ControlDecode.scala 83:30 ControlDecode.scala 85:26]
    node _GEN_5 = mux(_T_6, UInt<2>("h2"), _GEN_2) @[ControlDecode.scala 83:30 ControlDecode.scala 86:33]
    node _GEN_6 = mux(_T_6, UInt<2>("h2"), UInt<1>("h0")) @[ControlDecode.scala 83:30 ControlDecode.scala 87:30 ControlDecode.scala 43:22]
    node _GEN_7 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[ControlDecode.scala 83:30 ControlDecode.scala 41:25]
    node _GEN_8 = mux(_T_5, UInt<1>("h1"), _GEN_3) @[ControlDecode.scala 76:31 ControlDecode.scala 77:29]
    node _GEN_9 = mux(_T_5, UInt<2>("h3"), _GEN_4) @[ControlDecode.scala 76:31 ControlDecode.scala 78:26]
    node _GEN_10 = mux(_T_5, UInt<2>("h2"), _GEN_5) @[ControlDecode.scala 76:31 ControlDecode.scala 79:33]
    node _GEN_11 = mux(_T_5, UInt<2>("h3"), _GEN_6) @[ControlDecode.scala 76:31 ControlDecode.scala 80:30]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_7) @[ControlDecode.scala 76:31 ControlDecode.scala 41:25]
    node _GEN_13 = mux(_T_4, UInt<1>("h1"), _GEN_8) @[ControlDecode.scala 70:32 ControlDecode.scala 71:29]
    node _GEN_14 = mux(_T_4, UInt<1>("h1"), _GEN_9) @[ControlDecode.scala 70:32 ControlDecode.scala 72:26]
    node _GEN_15 = mux(_T_4, UInt<1>("h1"), _GEN_12) @[ControlDecode.scala 70:32 ControlDecode.scala 73:33]
    node _GEN_16 = mux(_T_4, UInt<1>("h0"), _GEN_10) @[ControlDecode.scala 70:32 ControlDecode.scala 40:25]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[ControlDecode.scala 70:32 ControlDecode.scala 43:22]
    node _GEN_18 = mux(_T_4, UInt<1>("h0"), _GEN_12) @[ControlDecode.scala 70:32 ControlDecode.scala 42:22]
    node _GEN_19 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[ControlDecode.scala 64:33 ControlDecode.scala 65:27 ControlDecode.scala 35:19]
    node _GEN_20 = mux(_T_3, UInt<2>("h2"), _GEN_14) @[ControlDecode.scala 64:33 ControlDecode.scala 66:26]
    node _GEN_21 = mux(_T_3, UInt<1>("h1"), _GEN_17) @[ControlDecode.scala 64:33 ControlDecode.scala 67:29]
    node _GEN_22 = mux(_T_3, UInt<1>("h0"), _GEN_13) @[ControlDecode.scala 64:33 ControlDecode.scala 37:21]
    node _GEN_23 = mux(_T_3, UInt<1>("h0"), _GEN_15) @[ControlDecode.scala 64:33 ControlDecode.scala 41:25]
    node _GEN_24 = mux(_T_3, UInt<1>("h0"), _GEN_16) @[ControlDecode.scala 64:33 ControlDecode.scala 40:25]
    node _GEN_25 = mux(_T_3, UInt<1>("h0"), _GEN_18) @[ControlDecode.scala 64:33 ControlDecode.scala 42:22]
    node _GEN_26 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[ControlDecode.scala 57:32 ControlDecode.scala 58:29 ControlDecode.scala 34:21]
    node _GEN_27 = mux(_T_2, UInt<3>("h5"), _GEN_20) @[ControlDecode.scala 57:32 ControlDecode.scala 59:26]
    node _GEN_28 = mux(_T_2, UInt<1>("h1"), _GEN_23) @[ControlDecode.scala 57:32 ControlDecode.scala 60:33]
    node _GEN_29 = mux(_T_2, UInt<2>("h2"), _GEN_25) @[ControlDecode.scala 57:32 ControlDecode.scala 61:30]
    node _GEN_30 = mux(_T_2, UInt<1>("h0"), _GEN_19) @[ControlDecode.scala 57:32 ControlDecode.scala 35:19]
    node _GEN_31 = mux(_T_2, UInt<1>("h0"), _GEN_21) @[ControlDecode.scala 57:32 ControlDecode.scala 43:22]
    node _GEN_32 = mux(_T_2, UInt<1>("h0"), _GEN_22) @[ControlDecode.scala 57:32 ControlDecode.scala 37:21]
    node _GEN_33 = mux(_T_2, UInt<1>("h0"), _GEN_24) @[ControlDecode.scala 57:32 ControlDecode.scala 40:25]
    node _GEN_34 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[ControlDecode.scala 49:31 ControlDecode.scala 50:28 ControlDecode.scala 36:20]
    node _GEN_35 = mux(_T_1, UInt<1>("h1"), _GEN_32) @[ControlDecode.scala 49:31 ControlDecode.scala 51:29]
    node _GEN_36 = mux(_T_1, UInt<3>("h4"), _GEN_27) @[ControlDecode.scala 49:31 ControlDecode.scala 53:26]
    node _GEN_37 = mux(_T_1, UInt<1>("h1"), _GEN_28) @[ControlDecode.scala 49:31 ControlDecode.scala 54:33]
    node _GEN_38 = mux(_T_1, UInt<1>("h0"), _GEN_26) @[ControlDecode.scala 49:31 ControlDecode.scala 34:21]
    node _GEN_39 = mux(_T_1, UInt<1>("h0"), _GEN_29) @[ControlDecode.scala 49:31 ControlDecode.scala 42:22]
    node _GEN_40 = mux(_T_1, UInt<1>("h0"), _GEN_30) @[ControlDecode.scala 49:31 ControlDecode.scala 35:19]
    node _GEN_41 = mux(_T_1, UInt<1>("h0"), _GEN_31) @[ControlDecode.scala 49:31 ControlDecode.scala 43:22]
    node _GEN_42 = mux(_T_1, UInt<1>("h0"), _GEN_33) @[ControlDecode.scala 49:31 ControlDecode.scala 40:25]
    node _GEN_43 = mux(_T, UInt<1>("h1"), _GEN_35) @[ControlDecode.scala 45:31 ControlDecode.scala 46:29]
    node _GEN_44 = mux(_T, UInt<1>("h0"), _GEN_34) @[ControlDecode.scala 45:31 ControlDecode.scala 36:20]
    node _GEN_45 = mux(_T, UInt<1>("h0"), _GEN_36) @[ControlDecode.scala 45:31 ControlDecode.scala 39:18]
    node _GEN_46 = mux(_T, UInt<1>("h0"), _GEN_37) @[ControlDecode.scala 45:31 ControlDecode.scala 41:25]
    node _GEN_47 = mux(_T, UInt<1>("h0"), _GEN_38) @[ControlDecode.scala 45:31 ControlDecode.scala 34:21]
    node _GEN_48 = mux(_T, UInt<1>("h0"), _GEN_39) @[ControlDecode.scala 45:31 ControlDecode.scala 42:22]
    node _GEN_49 = mux(_T, UInt<1>("h0"), _GEN_40) @[ControlDecode.scala 45:31 ControlDecode.scala 35:19]
    node _GEN_50 = mux(_T, UInt<1>("h0"), _GEN_41) @[ControlDecode.scala 45:31 ControlDecode.scala 43:22]
    node _GEN_51 = mux(_T, UInt<1>("h0"), _GEN_42) @[ControlDecode.scala 45:31 ControlDecode.scala 40:25]
    io_MemWrite <= _GEN_47
    io_Branch <= _GEN_49
    io_MemRead <= _GEN_44
    io_RegWrite <= _GEN_43
    io_MemToReg <= _GEN_44
    io_AluOp <= _GEN_45
    io_Operand_aSel <= _GEN_51
    io_Operand_bSel <= _GEN_46
    io_ExtendSel <= _GEN_48
    io_NextPcSel <= _GEN_50

  module Control :
    input clock : Clock
    input reset : UInt<1>
    input io_opCode : UInt<7>
    output io_MemWrite : UInt<1>
    output io_Branch : UInt<1>
    output io_MemRead : UInt<1>
    output io_RegWrite : UInt<1>
    output io_MemToReg : UInt<1>
    output io_AluOp : UInt<3>
    output io_Operand_aSel : UInt<2>
    output io_Operand_bSel : UInt<1>
    output io_ExtendSel : UInt<2>
    output io_NextPcSel : UInt<2>

    inst typeDec of TypeDecode @[Control.scala 24:29]
    inst controlDec of ControlDecode @[Control.scala 25:32]
    io_MemWrite <= controlDec.io_MemWrite @[Control.scala 38:81]
    io_Branch <= controlDec.io_Branch @[Control.scala 38:81]
    io_MemRead <= controlDec.io_MemRead @[Control.scala 38:81]
    io_RegWrite <= controlDec.io_RegWrite @[Control.scala 38:81]
    io_MemToReg <= controlDec.io_MemToReg @[Control.scala 38:81]
    io_AluOp <= controlDec.io_AluOp @[Control.scala 38:81]
    io_Operand_aSel <= controlDec.io_Operand_aSel @[Control.scala 38:81]
    io_Operand_bSel <= controlDec.io_Operand_bSel @[Control.scala 38:81]
    io_ExtendSel <= controlDec.io_ExtendSel @[Control.scala 38:81]
    io_NextPcSel <= controlDec.io_NextPcSel @[Control.scala 38:81]
    typeDec.clock <= clock
    typeDec.reset <= reset
    typeDec.io_opCode <= io_opCode @[Control.scala 27:27]
    controlDec.clock <= clock
    controlDec.reset <= reset
    controlDec.io_RType <= typeDec.io_RType @[Control.scala 32:96]
    controlDec.io_Load <= typeDec.io_Load @[Control.scala 32:96]
    controlDec.io_Store <= typeDec.io_Store @[Control.scala 32:96]
    controlDec.io_SBType <= typeDec.io_Branch @[Control.scala 32:96]
    controlDec.io_IType <= typeDec.io_IType @[Control.scala 32:96]
    controlDec.io_Jalr <= typeDec.io_Jalr @[Control.scala 32:96]
    controlDec.io_Jal <= typeDec.io_Jal @[Control.scala 32:96]
    controlDec.io_Lui <= typeDec.io_Lui @[Control.scala 32:96]

  module DataMem :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in : SInt<32>
    output io_data_out : SInt<32>
    input io_addr : UInt<32>
    input io_wr_en : UInt<1>
    input io_rd_en : UInt<1>

    mem memory : @[DataMemory.scala 23:21]
      data-type => SInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = bits(io_addr, 9, 0)
    node _GEN_0 = validif(io_wr_en, _T) @[DataMemory.scala 28:21]
    node _GEN_1 = validif(io_wr_en, clock) @[DataMemory.scala 28:21]
    node _GEN_2 = mux(io_wr_en, UInt<1>("h1"), UInt<1>("h0")) @[DataMemory.scala 28:21 DataMemory.scala 23:21]
    node _GEN_3 = validif(io_wr_en, UInt<1>("h1")) @[DataMemory.scala 28:21]
    node _GEN_4 = validif(io_wr_en, io_data_in) @[DataMemory.scala 28:21]
    node _io_data_out_T = bits(io_addr, 9, 0) @[DataMemory.scala 35:35]
    node _GEN_5 = validif(io_rd_en, _io_data_out_T) @[DataMemory.scala 34:21 DataMemory.scala 35:35]
    node _GEN_6 = validif(io_rd_en, clock) @[DataMemory.scala 34:21 DataMemory.scala 35:35]
    node _GEN_7 = mux(io_rd_en, UInt<1>("h1"), UInt<1>("h0")) @[DataMemory.scala 34:21 DataMemory.scala 35:35 DataMemory.scala 23:21]
    node _GEN_8 = validif(io_rd_en, memory.io_data_out_MPORT.data) @[DataMemory.scala 34:21 DataMemory.scala 35:21]
    io_data_out <= _GEN_8
    memory.io_data_out_MPORT.addr <= _GEN_5
    memory.io_data_out_MPORT.en <= _GEN_7
    memory.io_data_out_MPORT.clk <= _GEN_6
    memory.MPORT.addr <= _GEN_0
    memory.MPORT.en <= _GEN_2
    memory.MPORT.clk <= _GEN_1
    memory.MPORT.data <= _GEN_4
    memory.MPORT.mask <= _GEN_3

  module ImmGen :
    input clock : Clock
    input reset : UInt<1>
    input io_instr : UInt<32>
    input io_pc : UInt<32>
    output io_s_imm : SInt<32>
    output io_sb_imm : SInt<32>
    output io_uj_imm : SInt<32>
    output io_u_imm : SInt<32>
    output io_i_imm : SInt<32>

    node s_imm13_hi = bits(io_instr, 31, 25) @[ImmGen.scala 23:36]
    node s_imm13_lo = bits(io_instr, 11, 7) @[ImmGen.scala 23:52]
    node s_imm13 = cat(s_imm13_hi, s_imm13_lo) @[Cat.scala 30:58]
    node _io_s_imm_T = bits(s_imm13, 11, 11) @[ImmGen.scala 24:41]
    node _io_s_imm_T_1 = bits(_io_s_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_s_imm_hi = mux(_io_s_imm_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node _io_s_imm_T_2 = cat(io_s_imm_hi, s_imm13) @[Cat.scala 30:58]
    node _io_s_imm_T_3 = asSInt(_io_s_imm_T_2) @[ImmGen.scala 24:57]
    node sb_imm13_hi_hi_hi = bits(io_instr, 31, 31) @[ImmGen.scala 27:37]
    node sb_imm13_hi_hi_lo = bits(io_instr, 7, 7) @[ImmGen.scala 27:50]
    node sb_imm13_hi_lo = bits(io_instr, 30, 25) @[ImmGen.scala 27:62]
    node sb_imm13_lo_hi = bits(io_instr, 11, 8) @[ImmGen.scala 27:78]
    node sb_imm13_lo = cat(sb_imm13_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node sb_imm13_hi_hi = cat(sb_imm13_hi_hi_hi, sb_imm13_hi_hi_lo) @[Cat.scala 30:58]
    node sb_imm13_hi = cat(sb_imm13_hi_hi, sb_imm13_hi_lo) @[Cat.scala 30:58]
    node sb_imm13 = cat(sb_imm13_hi, sb_imm13_lo) @[Cat.scala 30:58]
    node _io_sb_imm_T = bits(sb_imm13, 12, 12) @[ImmGen.scala 28:44]
    node _io_sb_imm_T_1 = bits(_io_sb_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_sb_imm_hi = mux(_io_sb_imm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node _io_sb_imm_T_2 = cat(io_sb_imm_hi, sb_imm13) @[Cat.scala 30:58]
    node _io_sb_imm_T_3 = add(_io_sb_imm_T_2, io_pc) @[ImmGen.scala 28:61]
    node _io_sb_imm_T_4 = tail(_io_sb_imm_T_3, 1) @[ImmGen.scala 28:61]
    node _io_sb_imm_T_5 = asSInt(_io_sb_imm_T_4) @[ImmGen.scala 28:70]
    node uj_imm21_hi_hi_hi = bits(io_instr, 31, 31) @[ImmGen.scala 31:37]
    node uj_imm21_hi_hi_lo = bits(io_instr, 19, 12) @[ImmGen.scala 31:50]
    node uj_imm21_hi_lo = bits(io_instr, 20, 20) @[ImmGen.scala 31:66]
    node uj_imm21_lo_hi = bits(io_instr, 30, 21) @[ImmGen.scala 31:79]
    node uj_imm21_lo = cat(uj_imm21_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node uj_imm21_hi_hi = cat(uj_imm21_hi_hi_hi, uj_imm21_hi_hi_lo) @[Cat.scala 30:58]
    node uj_imm21_hi = cat(uj_imm21_hi_hi, uj_imm21_hi_lo) @[Cat.scala 30:58]
    node uj_imm21 = cat(uj_imm21_hi, uj_imm21_lo) @[Cat.scala 30:58]
    node _io_uj_imm_T = bits(uj_imm21, 20, 20) @[ImmGen.scala 32:44]
    node _io_uj_imm_T_1 = bits(_io_uj_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_uj_imm_hi = mux(_io_uj_imm_T_1, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_uj_imm_T_2 = cat(io_uj_imm_hi, uj_imm21) @[Cat.scala 30:58]
    node _io_uj_imm_T_3 = add(_io_uj_imm_T_2, io_pc) @[ImmGen.scala 32:61]
    node _io_uj_imm_T_4 = tail(_io_uj_imm_T_3, 1) @[ImmGen.scala 32:61]
    node _io_uj_imm_T_5 = asSInt(_io_uj_imm_T_4) @[ImmGen.scala 32:70]
    node _io_u_imm_T = bits(io_instr, 31, 31) @[ImmGen.scala 35:43]
    node _io_u_imm_T_1 = bits(_io_u_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_u_imm_hi = mux(_io_u_imm_T_1, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node io_u_imm_lo = bits(io_instr, 31, 12) @[ImmGen.scala 35:57]
    node _io_u_imm_T_2 = cat(io_u_imm_hi, io_u_imm_lo) @[Cat.scala 30:58]
    node _io_u_imm_T_3 = shl(_io_u_imm_T_2, 12) @[ImmGen.scala 35:67]
    node _io_u_imm_T_4 = asSInt(_io_u_imm_T_3) @[ImmGen.scala 35:74]
    node _io_i_imm_T = bits(io_instr, 31, 31) @[ImmGen.scala 38:42]
    node _io_i_imm_T_1 = bits(_io_i_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_i_imm_hi = mux(_io_i_imm_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_i_imm_lo = bits(io_instr, 31, 20) @[ImmGen.scala 38:56]
    node _io_i_imm_T_2 = cat(io_i_imm_hi, io_i_imm_lo) @[Cat.scala 30:58]
    node _io_i_imm_T_3 = asSInt(_io_i_imm_T_2) @[ImmGen.scala 38:66]
    io_s_imm <= _io_s_imm_T_3 @[ImmGen.scala 24:18]
    io_sb_imm <= _io_sb_imm_T_5 @[ImmGen.scala 28:19]
    io_uj_imm <= asSInt(bits(_io_uj_imm_T_5, 31, 0)) @[ImmGen.scala 32:19]
    io_u_imm <= asSInt(bits(_io_u_imm_T_4, 31, 0)) @[ImmGen.scala 35:18]
    io_i_imm <= _io_i_imm_T_3 @[ImmGen.scala 38:18]

  module InstructionMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<10>
    output io_inst : UInt<32>

    mem imem : @[InstructionMemory.scala 15:19]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    io_inst <= imem.io_inst_MPORT.data @[InstructionMemory.scala 16:13]
    imem.io_inst_MPORT.addr <= io_addr @[InstructionMemory.scala 16:20]
    imem.io_inst_MPORT.en <= UInt<1>("h1") @[InstructionMemory.scala 16:20]
    imem.io_inst_MPORT.clk <= clock @[InstructionMemory.scala 16:20]

  module Jalr :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : SInt<32>
    input io_Type : SInt<32>
    output io_out : SInt<32>

    node _io_out_T = add(io_rs1, io_Type) @[Jalr.scala 17:24]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Jalr.scala 17:24]
    node _io_out_T_2 = asSInt(_io_out_T_1) @[Jalr.scala 17:24]
    node _io_out_T_3 = and(_io_out_T_2, asSInt(UInt<33>("hfffffffe"))) @[Jalr.scala 17:35]
    node _io_out_T_4 = asSInt(_io_out_T_3) @[Jalr.scala 17:35]
    io_out <= asSInt(bits(_io_out_T_4, 31, 0)) @[Jalr.scala 17:12]

  module PC :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<32>
    output io_pc : UInt<32>
    output io_pcPlus4 : UInt<32>

    reg reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg) @[ProgramCounter.scala 17:22]
    node _io_pcPlus4_T = add(reg, UInt<3>("h4")) @[ProgramCounter.scala 20:23]
    node _io_pcPlus4_T_1 = tail(_io_pcPlus4_T, 1) @[ProgramCounter.scala 20:23]
    io_pc <= reg @[ProgramCounter.scala 19:11]
    io_pcPlus4 <= _io_pcPlus4_T_1 @[ProgramCounter.scala 20:16]
    reg <= mux(reset, UInt<32>("h0"), io_in) @[ProgramCounter.scala 17:22 ProgramCounter.scala 17:22 ProgramCounter.scala 18:9]

  module RegFile :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr1 : UInt<5>
    input io_raddr2 : UInt<5>
    output io_rdata1 : SInt<32>
    output io_rdata2 : SInt<32>
    input io_regEn : UInt<1>
    input io_waddr : UInt<5>
    input io_wdata : SInt<32>

    reg regs_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_0) @[RegisterFile.scala 27:19]
    reg regs_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_1) @[RegisterFile.scala 27:19]
    reg regs_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_2) @[RegisterFile.scala 27:19]
    reg regs_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_3) @[RegisterFile.scala 27:19]
    reg regs_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_4) @[RegisterFile.scala 27:19]
    reg regs_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_5) @[RegisterFile.scala 27:19]
    reg regs_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_6) @[RegisterFile.scala 27:19]
    reg regs_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_7) @[RegisterFile.scala 27:19]
    reg regs_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_8) @[RegisterFile.scala 27:19]
    reg regs_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_9) @[RegisterFile.scala 27:19]
    reg regs_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_10) @[RegisterFile.scala 27:19]
    reg regs_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_11) @[RegisterFile.scala 27:19]
    reg regs_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_12) @[RegisterFile.scala 27:19]
    reg regs_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_13) @[RegisterFile.scala 27:19]
    reg regs_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_14) @[RegisterFile.scala 27:19]
    reg regs_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_15) @[RegisterFile.scala 27:19]
    reg regs_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_16) @[RegisterFile.scala 27:19]
    reg regs_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_17) @[RegisterFile.scala 27:19]
    reg regs_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_18) @[RegisterFile.scala 27:19]
    reg regs_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_19) @[RegisterFile.scala 27:19]
    reg regs_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_20) @[RegisterFile.scala 27:19]
    reg regs_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_21) @[RegisterFile.scala 27:19]
    reg regs_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_22) @[RegisterFile.scala 27:19]
    reg regs_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_23) @[RegisterFile.scala 27:19]
    reg regs_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_24) @[RegisterFile.scala 27:19]
    reg regs_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_25) @[RegisterFile.scala 27:19]
    reg regs_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_26) @[RegisterFile.scala 27:19]
    reg regs_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_27) @[RegisterFile.scala 27:19]
    reg regs_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_28) @[RegisterFile.scala 27:19]
    reg regs_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_29) @[RegisterFile.scala 27:19]
    reg regs_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_30) @[RegisterFile.scala 27:19]
    reg regs_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_31) @[RegisterFile.scala 27:19]
    node _io_rdata1_T = orr(io_raddr1) @[RegisterFile.scala 29:33]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_raddr1), regs_0) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_raddr1), regs_1, _GEN_0) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_raddr1), regs_2, _GEN_1) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_raddr1), regs_3, _GEN_2) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_raddr1), regs_4, _GEN_3) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_raddr1), regs_5, _GEN_4) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_raddr1), regs_6, _GEN_5) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_raddr1), regs_7, _GEN_6) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_raddr1), regs_8, _GEN_7) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_raddr1), regs_9, _GEN_8) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_raddr1), regs_10, _GEN_9) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_raddr1), regs_11, _GEN_10) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_raddr1), regs_12, _GEN_11) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_raddr1), regs_13, _GEN_12) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_raddr1), regs_14, _GEN_13) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_raddr1), regs_15, _GEN_14) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_raddr1), regs_16, _GEN_15) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_raddr1), regs_17, _GEN_16) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_raddr1), regs_18, _GEN_17) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_raddr1), regs_19, _GEN_18) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_raddr1), regs_20, _GEN_19) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_raddr1), regs_21, _GEN_20) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_raddr1), regs_22, _GEN_21) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_raddr1), regs_23, _GEN_22) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_raddr1), regs_24, _GEN_23) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_raddr1), regs_25, _GEN_24) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_raddr1), regs_26, _GEN_25) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_raddr1), regs_27, _GEN_26) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_raddr1), regs_28, _GEN_27) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_raddr1), regs_29, _GEN_28) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_raddr1), regs_30, _GEN_29) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_raddr1), regs_31, _GEN_30) @[RegisterFile.scala 29:21 RegisterFile.scala 29:21]
    node _regs_io_raddr1 = _GEN_31 @[RegisterFile.scala 29:21]
    node _io_rdata1_T_1 = mux(_io_rdata1_T, _regs_io_raddr1, asSInt(UInt<1>("h0"))) @[RegisterFile.scala 29:21]
    node _io_rdata2_T = orr(io_raddr2) @[RegisterFile.scala 30:33]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_raddr2), regs_0) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_raddr2), regs_1, _GEN_32) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_raddr2), regs_2, _GEN_33) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_raddr2), regs_3, _GEN_34) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_raddr2), regs_4, _GEN_35) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_raddr2), regs_5, _GEN_36) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_raddr2), regs_6, _GEN_37) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_raddr2), regs_7, _GEN_38) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_raddr2), regs_8, _GEN_39) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_raddr2), regs_9, _GEN_40) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_raddr2), regs_10, _GEN_41) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_raddr2), regs_11, _GEN_42) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_raddr2), regs_12, _GEN_43) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_raddr2), regs_13, _GEN_44) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_raddr2), regs_14, _GEN_45) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_raddr2), regs_15, _GEN_46) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_raddr2), regs_16, _GEN_47) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_raddr2), regs_17, _GEN_48) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_raddr2), regs_18, _GEN_49) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_raddr2), regs_19, _GEN_50) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_raddr2), regs_20, _GEN_51) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_raddr2), regs_21, _GEN_52) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_raddr2), regs_22, _GEN_53) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_raddr2), regs_23, _GEN_54) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_raddr2), regs_24, _GEN_55) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_raddr2), regs_25, _GEN_56) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_raddr2), regs_26, _GEN_57) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_raddr2), regs_27, _GEN_58) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_raddr2), regs_28, _GEN_59) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_raddr2), regs_29, _GEN_60) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_raddr2), regs_30, _GEN_61) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_raddr2), regs_31, _GEN_62) @[RegisterFile.scala 30:21 RegisterFile.scala 30:21]
    node _regs_io_raddr2 = _GEN_63 @[RegisterFile.scala 30:21]
    node _io_rdata2_T_1 = mux(_io_rdata2_T, _regs_io_raddr2, asSInt(UInt<1>("h0"))) @[RegisterFile.scala 30:21]
    node _T = orr(io_waddr) @[RegisterFile.scala 32:31]
    node _T_1 = and(io_regEn, _T) @[RegisterFile.scala 32:20]
    node _regs_io_waddr = io_wdata @[RegisterFile.scala 34:25 RegisterFile.scala 34:25]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_waddr), _regs_io_waddr, asSInt(UInt<1>("h0"))) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 28:13]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_waddr), _regs_io_waddr, regs_1) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_waddr), _regs_io_waddr, regs_2) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_waddr), _regs_io_waddr, regs_3) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_waddr), _regs_io_waddr, regs_4) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_waddr), _regs_io_waddr, regs_5) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_waddr), _regs_io_waddr, regs_6) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_waddr), _regs_io_waddr, regs_7) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_waddr), _regs_io_waddr, regs_8) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_waddr), _regs_io_waddr, regs_9) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_waddr), _regs_io_waddr, regs_10) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_waddr), _regs_io_waddr, regs_11) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_waddr), _regs_io_waddr, regs_12) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_waddr), _regs_io_waddr, regs_13) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_waddr), _regs_io_waddr, regs_14) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_waddr), _regs_io_waddr, regs_15) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_waddr), _regs_io_waddr, regs_16) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_waddr), _regs_io_waddr, regs_17) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_waddr), _regs_io_waddr, regs_18) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_waddr), _regs_io_waddr, regs_19) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_waddr), _regs_io_waddr, regs_20) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_waddr), _regs_io_waddr, regs_21) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_waddr), _regs_io_waddr, regs_22) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_waddr), _regs_io_waddr, regs_23) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_waddr), _regs_io_waddr, regs_24) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_waddr), _regs_io_waddr, regs_25) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_waddr), _regs_io_waddr, regs_26) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_waddr), _regs_io_waddr, regs_27) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_waddr), _regs_io_waddr, regs_28) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_waddr), _regs_io_waddr, regs_29) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_waddr), _regs_io_waddr, regs_30) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_waddr), _regs_io_waddr, regs_31) @[RegisterFile.scala 34:25 RegisterFile.scala 34:25 RegisterFile.scala 27:19]
    node _GEN_96 = mux(_T_1, _GEN_64, asSInt(UInt<1>("h0"))) @[RegisterFile.scala 32:36 RegisterFile.scala 28:13]
    node _GEN_97 = mux(_T_1, _GEN_65, regs_1) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_98 = mux(_T_1, _GEN_66, regs_2) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_99 = mux(_T_1, _GEN_67, regs_3) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_100 = mux(_T_1, _GEN_68, regs_4) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_101 = mux(_T_1, _GEN_69, regs_5) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_102 = mux(_T_1, _GEN_70, regs_6) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_103 = mux(_T_1, _GEN_71, regs_7) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_104 = mux(_T_1, _GEN_72, regs_8) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_105 = mux(_T_1, _GEN_73, regs_9) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_106 = mux(_T_1, _GEN_74, regs_10) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_107 = mux(_T_1, _GEN_75, regs_11) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_108 = mux(_T_1, _GEN_76, regs_12) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_109 = mux(_T_1, _GEN_77, regs_13) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_110 = mux(_T_1, _GEN_78, regs_14) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_111 = mux(_T_1, _GEN_79, regs_15) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_112 = mux(_T_1, _GEN_80, regs_16) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_113 = mux(_T_1, _GEN_81, regs_17) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_114 = mux(_T_1, _GEN_82, regs_18) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_115 = mux(_T_1, _GEN_83, regs_19) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_116 = mux(_T_1, _GEN_84, regs_20) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_117 = mux(_T_1, _GEN_85, regs_21) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_118 = mux(_T_1, _GEN_86, regs_22) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_119 = mux(_T_1, _GEN_87, regs_23) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_120 = mux(_T_1, _GEN_88, regs_24) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_121 = mux(_T_1, _GEN_89, regs_25) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_122 = mux(_T_1, _GEN_90, regs_26) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_123 = mux(_T_1, _GEN_91, regs_27) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_124 = mux(_T_1, _GEN_92, regs_28) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_125 = mux(_T_1, _GEN_93, regs_29) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_126 = mux(_T_1, _GEN_94, regs_30) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    node _GEN_127 = mux(_T_1, _GEN_95, regs_31) @[RegisterFile.scala 32:36 RegisterFile.scala 27:19]
    io_rdata1 <= _io_rdata1_T_1 @[RegisterFile.scala 29:15]
    io_rdata2 <= _io_rdata2_T_1 @[RegisterFile.scala 30:15]
    regs_0 <= _GEN_96
    regs_1 <= _GEN_97
    regs_2 <= _GEN_98
    regs_3 <= _GEN_99
    regs_4 <= _GEN_100
    regs_5 <= _GEN_101
    regs_6 <= _GEN_102
    regs_7 <= _GEN_103
    regs_8 <= _GEN_104
    regs_9 <= _GEN_105
    regs_10 <= _GEN_106
    regs_11 <= _GEN_107
    regs_12 <= _GEN_108
    regs_13 <= _GEN_109
    regs_14 <= _GEN_110
    regs_15 <= _GEN_111
    regs_16 <= _GEN_112
    regs_17 <= _GEN_113
    regs_18 <= _GEN_114
    regs_19 <= _GEN_115
    regs_20 <= _GEN_116
    regs_21 <= _GEN_117
    regs_22 <= _GEN_118
    regs_23 <= _GEN_119
    regs_24 <= _GEN_120
    regs_25 <= _GEN_121
    regs_26 <= _GEN_122
    regs_27 <= _GEN_123
    regs_28 <= _GEN_124
    regs_29 <= _GEN_125
    regs_30 <= _GEN_126
    regs_31 <= _GEN_127

  module TopFile :
    input clock : Clock
    input reset : UInt<1>
    output io_RegOut : SInt<32>

    inst alu of Alu @[TopFile.scala 14:25]
    inst aluControl of AluControl @[TopFile.scala 15:28]
    inst control of Control @[TopFile.scala 16:29]
    inst dataMemory of DataMem @[TopFile.scala 17:32]
    inst ImmediateGeneration of ImmGen @[TopFile.scala 18:41]
    inst Memory of InstructionMemory @[TopFile.scala 19:28]
    inst jalr of Jalr @[TopFile.scala 20:26]
    inst pc of PC @[TopFile.scala 21:24]
    inst registerFile of RegFile @[TopFile.scala 22:34]
    node _Memory_io_addr_T = bits(pc.io_pc, 11, 2) @[TopFile.scala 26:35]
    node _control_io_opCode_T = bits(Memory.io_inst, 6, 0) @[TopFile.scala 31:40]
    node _registerFile_io_raddr1_T = bits(Memory.io_inst, 19, 15) @[TopFile.scala 38:49]
    node _registerFile_io_raddr2_T = bits(Memory.io_inst, 24, 20) @[TopFile.scala 39:49]
    node _registerFile_io_waddr_T = bits(Memory.io_inst, 11, 7) @[TopFile.scala 40:48]
    node _aluControl_io_func3_T = bits(Memory.io_inst, 14, 12) @[TopFile.scala 45:46]
    node _aluControl_io_func7_T = bits(Memory.io_inst, 30, 30) @[TopFile.scala 46:46]
    node _T = eq(control.io_ExtendSel, UInt<1>("h0")) @[TopFile.scala 53:32]
    node _T_1 = eq(control.io_Operand_bSel, UInt<1>("h1")) @[TopFile.scala 53:71]
    node _T_2 = and(_T, _T_1) @[TopFile.scala 53:44]
    node _T_3 = eq(control.io_ExtendSel, UInt<1>("h1")) @[TopFile.scala 57:41]
    node _T_4 = eq(control.io_Operand_bSel, UInt<1>("h1")) @[TopFile.scala 57:80]
    node _T_5 = and(_T_3, _T_4) @[TopFile.scala 57:53]
    node _T_6 = eq(control.io_ExtendSel, UInt<2>("h2")) @[TopFile.scala 61:41]
    node _T_7 = eq(control.io_Operand_bSel, UInt<1>("h1")) @[TopFile.scala 61:80]
    node _T_8 = and(_T_6, _T_7) @[TopFile.scala 61:53]
    node _GEN_0 = mux(_T_8, ImmediateGeneration.io_s_imm, registerFile.io_rdata2) @[TopFile.scala 61:91 TopFile.scala 62:28 TopFile.scala 64:32]
    node _GEN_1 = mux(_T_5, ImmediateGeneration.io_u_imm, _GEN_0) @[TopFile.scala 57:91 TopFile.scala 58:20]
    node _GEN_2 = mux(_T_2, ImmediateGeneration.io_i_imm, _GEN_1) @[TopFile.scala 53:82 TopFile.scala 54:20]
    node _pc_io_in_T = eq(control.io_NextPcSel, UInt<1>("h1")) @[TopFile.scala 72:31]
    node _pc_io_in_T_1 = eq(control.io_Branch, UInt<1>("h0")) @[TopFile.scala 72:64]
    node _pc_io_in_T_2 = and(_pc_io_in_T, _pc_io_in_T_1) @[TopFile.scala 72:43]
    node _pc_io_in_T_3 = eq(alu.io_Branch, UInt<1>("h0")) @[TopFile.scala 72:92]
    node _pc_io_in_T_4 = and(_pc_io_in_T_2, _pc_io_in_T_3) @[TopFile.scala 72:75]
    node _pc_io_in_T_5 = eq(control.io_NextPcSel, UInt<1>("h1")) @[TopFile.scala 73:31]
    node _pc_io_in_T_6 = eq(control.io_Branch, UInt<1>("h1")) @[TopFile.scala 73:64]
    node _pc_io_in_T_7 = and(_pc_io_in_T_5, _pc_io_in_T_6) @[TopFile.scala 73:43]
    node _pc_io_in_T_8 = eq(alu.io_Branch, UInt<1>("h0")) @[TopFile.scala 73:92]
    node _pc_io_in_T_9 = and(_pc_io_in_T_7, _pc_io_in_T_8) @[TopFile.scala 73:75]
    node _pc_io_in_T_10 = eq(control.io_NextPcSel, UInt<1>("h1")) @[TopFile.scala 74:35]
    node _pc_io_in_T_11 = eq(control.io_Branch, UInt<1>("h0")) @[TopFile.scala 74:68]
    node _pc_io_in_T_12 = and(_pc_io_in_T_10, _pc_io_in_T_11) @[TopFile.scala 74:47]
    node _pc_io_in_T_13 = eq(alu.io_Branch, UInt<1>("h1")) @[TopFile.scala 74:96]
    node _pc_io_in_T_14 = and(_pc_io_in_T_12, _pc_io_in_T_13) @[TopFile.scala 74:79]
    node _pc_io_in_T_15 = eq(control.io_NextPcSel, UInt<1>("h1")) @[TopFile.scala 75:35]
    node _pc_io_in_T_16 = eq(control.io_Branch, UInt<1>("h1")) @[TopFile.scala 75:68]
    node _pc_io_in_T_17 = and(_pc_io_in_T_15, _pc_io_in_T_16) @[TopFile.scala 75:47]
    node _pc_io_in_T_18 = eq(alu.io_Branch, UInt<1>("h1")) @[TopFile.scala 75:96]
    node _pc_io_in_T_19 = and(_pc_io_in_T_17, _pc_io_in_T_18) @[TopFile.scala 75:79]
    node _pc_io_in_T_20 = asUInt(ImmediateGeneration.io_sb_imm) @[TopFile.scala 75:141]
    node _pc_io_in_T_21 = eq(control.io_NextPcSel, UInt<1>("h0")) @[TopFile.scala 76:31]
    node _pc_io_in_T_22 = eq(control.io_NextPcSel, UInt<2>("h2")) @[TopFile.scala 77:31]
    node _pc_io_in_T_23 = asUInt(ImmediateGeneration.io_uj_imm) @[TopFile.scala 77:77]
    node _pc_io_in_T_24 = eq(control.io_NextPcSel, UInt<2>("h3")) @[TopFile.scala 78:31]
    node _pc_io_in_T_25 = asUInt(jalr.io_out) @[TopFile.scala 78:59]
    node _pc_io_in_T_26 = mux(_pc_io_in_T_24, _pc_io_in_T_25, UInt<1>("h0")) @[Mux.scala 98:16]
    node _pc_io_in_T_27 = mux(_pc_io_in_T_22, _pc_io_in_T_23, _pc_io_in_T_26) @[Mux.scala 98:16]
    node _pc_io_in_T_28 = mux(_pc_io_in_T_21, pc.io_pcPlus4, _pc_io_in_T_27) @[Mux.scala 98:16]
    node _pc_io_in_T_29 = mux(_pc_io_in_T_19, _pc_io_in_T_20, _pc_io_in_T_28) @[Mux.scala 98:16]
    node _pc_io_in_T_30 = mux(_pc_io_in_T_14, pc.io_pcPlus4, _pc_io_in_T_29) @[Mux.scala 98:16]
    node _pc_io_in_T_31 = mux(_pc_io_in_T_9, pc.io_pcPlus4, _pc_io_in_T_30) @[Mux.scala 98:16]
    node _pc_io_in_T_32 = mux(_pc_io_in_T_4, pc.io_pcPlus4, _pc_io_in_T_31) @[Mux.scala 98:16]
    node _dataMemory_io_addr_T = bits(alu.io_out, 9, 2) @[TopFile.scala 85:38]
    node _T_9 = eq(control.io_MemToReg, UInt<1>("h1")) @[TopFile.scala 90:31]
    node _GEN_3 = mux(_T_9, dataMemory.io_data_out, alu.io_out) @[TopFile.scala 90:40 TopFile.scala 91:31 TopFile.scala 95:31]
    node _T_10 = eq(control.io_Operand_aSel, UInt<1>("h0")) @[TopFile.scala 98:39]
    node _T_11 = eq(control.io_Operand_aSel, UInt<2>("h3")) @[TopFile.scala 98:78]
    node _T_12 = or(_T_10, _T_11) @[TopFile.scala 98:51]
    node _T_13 = eq(control.io_Operand_aSel, UInt<2>("h2")) @[TopFile.scala 102:44]
    node _alu_io_in1_T = asSInt(pc.io_pcPlus4) @[TopFile.scala 103:37]
    node _GEN_4 = validif(_T_13, _alu_io_in1_T) @[TopFile.scala 102:57 TopFile.scala 103:20]
    node _GEN_5 = mux(_T_12, registerFile.io_rdata1, _GEN_4) @[TopFile.scala 98:91 TopFile.scala 99:20]
    io_RegOut <= registerFile.io_wdata @[TopFile.scala 68:19]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_AluControl <= aluControl.io_control @[TopFile.scala 66:27]
    alu.io_in1 <= _GEN_5
    alu.io_in2 <= _GEN_2
    aluControl.clock <= clock
    aluControl.reset <= reset
    aluControl.io_Aluop <= control.io_AluOp @[TopFile.scala 44:25]
    aluControl.io_func7 <= _aluControl_io_func7_T @[TopFile.scala 46:29]
    aluControl.io_func3 <= _aluControl_io_func3_T @[TopFile.scala 45:29]
    control.clock <= clock
    control.reset <= reset
    control.io_opCode <= _control_io_opCode_T @[TopFile.scala 31:23]
    dataMemory.clock <= clock
    dataMemory.reset <= reset
    dataMemory.io_data_in <= registerFile.io_rdata2 @[TopFile.scala 86:31]
    dataMemory.io_addr <= _dataMemory_io_addr_T @[TopFile.scala 85:24]
    dataMemory.io_wr_en <= control.io_MemWrite @[TopFile.scala 87:29]
    dataMemory.io_rd_en <= control.io_MemRead @[TopFile.scala 88:29]
    ImmediateGeneration.clock <= clock
    ImmediateGeneration.reset <= reset
    ImmediateGeneration.io_instr <= Memory.io_inst @[TopFile.scala 32:38]
    ImmediateGeneration.io_pc <= pc.io_pc @[TopFile.scala 33:35]
    Memory.clock <= clock
    Memory.reset <= reset
    Memory.io_addr <= _Memory_io_addr_T @[TopFile.scala 26:24]
    jalr.clock <= clock
    jalr.reset <= reset
    jalr.io_rs1 <= registerFile.io_rdata1 @[TopFile.scala 50:17]
    jalr.io_Type <= ImmediateGeneration.io_i_imm @[TopFile.scala 51:18]
    pc.clock <= clock
    pc.reset <= reset
    pc.io_in <= _pc_io_in_T_32 @[TopFile.scala 70:14]
    registerFile.clock <= clock
    registerFile.reset <= reset
    registerFile.io_raddr1 <= _registerFile_io_raddr1_T @[TopFile.scala 38:32]
    registerFile.io_raddr2 <= _registerFile_io_raddr2_T @[TopFile.scala 39:32]
    registerFile.io_regEn <= control.io_RegWrite @[TopFile.scala 37:27]
    registerFile.io_waddr <= _registerFile_io_waddr_T @[TopFile.scala 40:31]
    registerFile.io_wdata <= _GEN_3
