`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 00:32:54
// Design Name: 
// Module Name: logicGatesBehv
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


module logicGatesBehv(
input a,
input b,
output reg o_not,
output reg o_and,
output reg o_or,
output reg o_nor,
output reg o_nand,
output reg o_xor,
output reg o_xnor
    );
    always @(a,b)
    begin
    o_not = ~a;
    o_and = a&b;
    o_or = a|b;
    o_nor = ~(a|b);
    o_nand = ~(a&b);
    o_xor = a^b ;
    o_xnor = ~(a^b);
    end
endmodule
