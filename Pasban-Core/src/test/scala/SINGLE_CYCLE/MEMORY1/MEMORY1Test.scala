package practice

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._ 

class MEMORY1Test extends FreeSpec with ChiselScalatestTester{
   "MEMORY1Test test" in{
       test(new InstMem1 ( "C:/Users/Muhammad Sameed/Desktop/Desktop clean/Hafsa/Merl/sample.txt" ) ){c =>
          c.io.addr.poke(0.U)
          c.clock.step(1) 
          c.io.data.expect("h00200293".U)

       }
    }
}    

