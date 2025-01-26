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
     
     logicGatesBehv UUT(
.a(a),
.b(b),
.o_not(not_g),
.o_and(and_g),
.o_or(or_g),
.o_nor(nor_g),
.o_nand(nand_g),
.o_xor(xor_g),
.o_xnor(xnor_g)
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

