// Code your design here
module Jalr_Target(

  input [31:0] rs1_data,
  input [31:0] immsel_12,
  output [31:0] jalrt


);
  
  assign jalrt= (rs1_data + immsel_12) & 32'hFFFFFFFE;
  
endmodule