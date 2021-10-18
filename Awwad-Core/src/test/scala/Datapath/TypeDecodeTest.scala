package Datapath

import org.scalatest._
import chiseltest._
import chisel3._

class TypeDecodeTest extends FreeSpec with ChiselScalatestTester {
    
    "Type Decode Test" in {
    
        test(new TypeDecode) { c =>

        c.io.opCode.poke(35.U)

        c.clock.step(1)

        c.io.Store.expect(1.B)

        }   
    }
}

// package Datapath

// import org.scalatest._
// import chiseltest._
// import chisel3._

// class TypeDecodeTest extends FreeSpec with ChiselScalatestTester {
    
//     "Type Decode Test" in {
    
//         test(new TypeDecode(7)) { c =>

//         c.io.opcode.poke(35.U)

//         c.clock.step(1)

//         c.io.store.expect(1.B)

//         }   
//     }
// }
