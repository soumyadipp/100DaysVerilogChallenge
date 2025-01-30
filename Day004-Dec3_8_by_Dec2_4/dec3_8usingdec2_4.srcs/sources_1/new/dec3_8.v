`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2025 22:04:58
// Design Name: 
// Module Name: dec3_8
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


module dec3_8(output [7:0]O,input [2:0]A);
dec2_4 inst1 (.Y(O[3:0]),.e(A[0]),.a(A[2:1]));
dec2_4 inst2 (.Y(O[7:4]),.e(~A[0]),.a(A[2:1]));

endmodule
