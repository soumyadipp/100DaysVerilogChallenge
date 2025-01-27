
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 00:39:47
// Design Name: 
// Module Name: tb
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


module tb();
reg a,b;
wire and_g,
     or_g,
     not_g,
     nor_g,
     nand_g,
     xor_g,
     xnor_g;
     
     logicGates_dataflow UUT (
                              .a(a),
                              .b(b),
                              .g_not(not_g),
                              .g_and(and_g),
                              .g_or(or_g),
                              .g_nand(nand_g),
                              .g_nor(nor_g),
                              .g_xor(xor_g),
                              .g_xnor(xnor_g)
                            );
initial begin
a=0;
b=0;
#100
a=0;b=1;
#100
a=1;b=0;
#100
a=1;b=1;
end 

endmodule