`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 01:17:37
// Design Name: 
// Module Name: logicGatesData
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


module logicGatesData(
input a,
input b,
output o_not,
output o_and,
output o_or,
output o_nor,
output o_nand,
output o_xor,
output o_xnor
    );
  
   assign o_not = ~a;
   assign o_and = a&b;
   assign o_or = a|b;
   assign  o_nor = ~(a|b);
   assign  o_nand = ~(a&b);
   assign  o_xor = a^b ;
   assign  o_xnor = ~(a^b);
   
endmodule
 
