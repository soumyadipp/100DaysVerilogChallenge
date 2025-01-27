`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 23:53:01
// Design Name: 
// Module Name: logicGates_dataflow
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


module logicGates_dataflow(input a,
                           input b,
                           output g_not,
                           output g_and,
                           output g_or,
                           output g_nand,
                           output g_nor,
                           output g_xor,
                           output g_xnor
                            );
                            
     assign g_not = ~a;
     assign g_and = a & b;
     assign g_or = a | b;
     assign g_nand = ~(a&b);
     assign g_nor = ~(a|b);
     assign g_xor = a^b;
     assign g_xnor = ~(a^b);
                            
endmodule
