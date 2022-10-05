package CONTROL
import chisel3._
import org.scalatest._
import chiseltest._

class toptestmain extends FreeSpec with ChiselScalatestTester{
    "top test merl" in {
    test(new Top()){c=>
   c.clock.step(500)
   }
   }
   }