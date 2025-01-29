`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2025 23:15:45
// Design Name: 
// Module Name: Full_Add_Full_Sub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_Add_Full_Sub(
input a,
input b,
input c_in,
input b_in,
output c_out,
output b_out,
output Sum,
output Diff
     );
     
 assign  Sum = a^b^c_in;
 assign  c_out = (a&b)+(a^b)&c_in;
assign  Diff = a^b^b_in;
assign b_out = (~a&b)+(a&b_in)+(b&b_in);

 
 
endmodule
