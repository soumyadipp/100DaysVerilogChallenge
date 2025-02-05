`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 23:06:20
// Design Name: 
// Module Name: b2g
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


module b2g(input [3:0]binary,
           output [3:0]gray
           );
           assign gray[3]=binary[3];
           assign gray[2]= binary[3]^binary[2];
           assign gray[1]= binary[2]^binary[1];
           assign gray[0]= binary[1]^binary[0];
           
endmodule
