;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Alu : 
  module Alu : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip AluControl : UInt<5>, flip in1 : SInt<32>, flip in2 : SInt<32>, Branch : UInt<1>, out : SInt<32>}
    
    io.out <= asSInt(UInt<1>("h00")) @[Alu.scala 19:16]
    node _T = eq(io.AluControl, UInt<1>("h00")) @[Alu.scala 22:29]
    when _T : @[Alu.scala 22:44]
      node _io_out_T = add(io.in1, io.in2) @[Alu.scala 22:62]
      node _io_out_T_1 = tail(_io_out_T, 1) @[Alu.scala 22:62]
      node _io_out_T_2 = asSInt(_io_out_T_1) @[Alu.scala 22:62]
      io.out <= _io_out_T_2 @[Alu.scala 22:52]
      skip @[Alu.scala 22:44]
    else : @[Alu.scala 24:49]
      node _T_1 = eq(io.AluControl, UInt<1>("h01")) @[Alu.scala 24:34]
      when _T_1 : @[Alu.scala 24:49]
        node _io_out_T_3 = bits(io.in2, 4, 0) @[Alu.scala 24:76]
        node _io_out_T_4 = dshl(io.in1, _io_out_T_3) @[Alu.scala 24:67]
        io.out <= _io_out_T_4 @[Alu.scala 24:57]
        skip @[Alu.scala 24:49]
      else : @[Alu.scala 26:49]
        node _T_2 = eq(io.AluControl, UInt<3>("h04")) @[Alu.scala 26:34]
        when _T_2 : @[Alu.scala 26:49]
          node _io_out_T_5 = xor(io.in1, io.in2) @[Alu.scala 26:67]
          node _io_out_T_6 = asSInt(_io_out_T_5) @[Alu.scala 26:67]
          io.out <= _io_out_T_6 @[Alu.scala 26:57]
          skip @[Alu.scala 26:49]
        else : @[Alu.scala 28:81]
          node _T_3 = eq(io.AluControl, UInt<3>("h05")) @[Alu.scala 28:34]
          node _T_4 = eq(io.AluControl, UInt<4>("h0d")) @[Alu.scala 28:66]
          node _T_5 = or(_T_3, _T_4) @[Alu.scala 28:49]
          when _T_5 : @[Alu.scala 28:81]
            node _io_out_T_7 = bits(io.in2, 4, 0) @[Alu.scala 28:108]
            node _io_out_T_8 = dshr(io.in1, _io_out_T_7) @[Alu.scala 28:99]
            io.out <= _io_out_T_8 @[Alu.scala 28:89]
            skip @[Alu.scala 28:81]
          else : @[Alu.scala 30:49]
            node _T_6 = eq(io.AluControl, UInt<3>("h06")) @[Alu.scala 30:34]
            when _T_6 : @[Alu.scala 30:49]
              node _io_out_T_9 = or(io.in1, io.in2) @[Alu.scala 30:67]
              node _io_out_T_10 = asSInt(_io_out_T_9) @[Alu.scala 30:67]
              io.out <= _io_out_T_10 @[Alu.scala 30:57]
              skip @[Alu.scala 30:49]
            else : @[Alu.scala 32:49]
              node _T_7 = eq(io.AluControl, UInt<3>("h07")) @[Alu.scala 32:34]
              when _T_7 : @[Alu.scala 32:49]
                node _io_out_T_11 = and(io.in1, io.in2) @[Alu.scala 32:67]
                node _io_out_T_12 = asSInt(_io_out_T_11) @[Alu.scala 32:67]
                io.out <= _io_out_T_12 @[Alu.scala 32:57]
                skip @[Alu.scala 32:49]
              else : @[Alu.scala 34:49]
                node _T_8 = eq(io.AluControl, UInt<4>("h08")) @[Alu.scala 34:34]
                when _T_8 : @[Alu.scala 34:49]
                  node _io_out_T_13 = sub(io.in1, io.in2) @[Alu.scala 34:67]
                  node _io_out_T_14 = tail(_io_out_T_13, 1) @[Alu.scala 34:67]
                  node _io_out_T_15 = asSInt(_io_out_T_14) @[Alu.scala 34:67]
                  io.out <= _io_out_T_15 @[Alu.scala 34:57]
                  skip @[Alu.scala 34:49]
                else : @[Alu.scala 36:49]
                  node _T_9 = eq(io.AluControl, UInt<5>("h01f")) @[Alu.scala 36:34]
                  when _T_9 : @[Alu.scala 36:49]
                    io.out <= io.in1 @[Alu.scala 36:57]
                    skip @[Alu.scala 36:49]
                  else : @[Alu.scala 38:49]
                    node _T_10 = eq(io.AluControl, UInt<5>("h015")) @[Alu.scala 38:34]
                    when _T_10 : @[Alu.scala 38:49]
                      node _T_11 = geq(io.in1, io.in2) @[Alu.scala 39:30]
                      when _T_11 : @[Alu.scala 39:40]
                        io.out <= asSInt(UInt<2>("h01")) @[Alu.scala 39:48]
                        skip @[Alu.scala 39:40]
                      skip @[Alu.scala 38:49]
                    else : @[Alu.scala 42:49]
                      node _T_12 = eq(io.AluControl, UInt<5>("h017")) @[Alu.scala 42:34]
                      when _T_12 : @[Alu.scala 42:49]
                        node _T_13 = asUInt(io.in1) @[Alu.scala 43:30]
                        node _T_14 = asUInt(io.in2) @[Alu.scala 43:47]
                        node _T_15 = geq(_T_13, _T_14) @[Alu.scala 43:37]
                        when _T_15 : @[Alu.scala 43:54]
                          io.out <= asSInt(UInt<2>("h01")) @[Alu.scala 43:62]
                          skip @[Alu.scala 43:54]
                        else : @[Alu.scala 44:28]
                          io.out <= asSInt(UInt<1>("h00")) @[Alu.scala 44:36]
                          skip @[Alu.scala 44:28]
                        skip @[Alu.scala 42:49]
                      else : @[Alu.scala 46:81]
                        node _T_16 = eq(io.AluControl, UInt<2>("h03")) @[Alu.scala 46:34]
                        node _T_17 = eq(io.AluControl, UInt<5>("h016")) @[Alu.scala 46:66]
                        node _T_18 = or(_T_16, _T_17) @[Alu.scala 46:49]
                        when _T_18 : @[Alu.scala 46:81]
                          node _T_19 = asUInt(io.in1) @[Alu.scala 47:30]
                          node _T_20 = asUInt(io.in2) @[Alu.scala 47:46]
                          node _T_21 = lt(_T_19, _T_20) @[Alu.scala 47:37]
                          when _T_21 : @[Alu.scala 47:53]
                            io.out <= asSInt(UInt<2>("h01")) @[Alu.scala 47:61]
                            skip @[Alu.scala 47:53]
                          else : @[Alu.scala 48:28]
                            io.out <= asSInt(UInt<1>("h00")) @[Alu.scala 48:36]
                            skip @[Alu.scala 48:28]
                          skip @[Alu.scala 46:81]
                        else : @[Alu.scala 50:49]
                          node _T_22 = eq(io.AluControl, UInt<5>("h010")) @[Alu.scala 50:34]
                          when _T_22 : @[Alu.scala 50:49]
                            node _T_23 = eq(io.in1, io.in2) @[Alu.scala 51:30]
                            when _T_23 : @[Alu.scala 51:41]
                              io.out <= asSInt(UInt<2>("h01")) @[Alu.scala 51:49]
                              skip @[Alu.scala 51:41]
                            else : @[Alu.scala 52:28]
                              io.out <= asSInt(UInt<1>("h00")) @[Alu.scala 52:36]
                              skip @[Alu.scala 52:28]
                            skip @[Alu.scala 50:49]
                          else : @[Alu.scala 54:81]
                            node _T_24 = eq(io.AluControl, UInt<2>("h02")) @[Alu.scala 54:34]
                            node _T_25 = eq(io.AluControl, UInt<5>("h014")) @[Alu.scala 54:66]
                            node _T_26 = or(_T_24, _T_25) @[Alu.scala 54:49]
                            when _T_26 : @[Alu.scala 54:81]
                              node _T_27 = lt(io.in1, io.in2) @[Alu.scala 55:30]
                              when _T_27 : @[Alu.scala 55:39]
                                io.out <= asSInt(UInt<2>("h01")) @[Alu.scala 55:47]
                                skip @[Alu.scala 55:39]
                              else : @[Alu.scala 56:28]
                                io.out <= asSInt(UInt<1>("h00")) @[Alu.scala 56:36]
                                skip @[Alu.scala 56:28]
                              skip @[Alu.scala 54:81]
                            else : @[Alu.scala 58:49]
                              node _T_28 = eq(io.AluControl, UInt<5>("h011")) @[Alu.scala 58:34]
                              when _T_28 : @[Alu.scala 58:49]
                                node _T_29 = neq(io.in1, io.in2) @[Alu.scala 59:30]
                                when _T_29 : @[Alu.scala 59:41]
                                  io.out <= asSInt(UInt<2>("h01")) @[Alu.scala 59:49]
                                  skip @[Alu.scala 59:41]
                                else : @[Alu.scala 60:28]
                                  io.out <= asSInt(UInt<1>("h00")) @[Alu.scala 60:36]
                                  skip @[Alu.scala 60:28]
                                skip @[Alu.scala 58:49]
                              else : @[Alu.scala 61:20]
                                io.out is invalid @[Alu.scala 61:28]
                                skip @[Alu.scala 61:20]
    node _T_30 = eq(io.out, asSInt(UInt<2>("h01"))) @[Alu.scala 65:22]
    node _T_31 = bits(io.AluControl, 4, 3) @[Alu.scala 65:46]
    node _T_32 = eq(_T_31, UInt<2>("h02")) @[Alu.scala 65:52]
    node _T_33 = and(_T_30, _T_32) @[Alu.scala 65:30]
    when _T_33 : @[Alu.scala 65:64]
      io.Branch <= UInt<1>("h01") @[Alu.scala 66:27]
      skip @[Alu.scala 65:64]
    else : @[Alu.scala 69:20]
      io.Branch <= UInt<1>("h00") @[Alu.scala 70:27]
      skip @[Alu.scala 69:20]
    
