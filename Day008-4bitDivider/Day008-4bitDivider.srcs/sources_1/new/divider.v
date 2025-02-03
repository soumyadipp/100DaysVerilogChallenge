`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 21:39:16
// Design Name: 
// Module Name: divider
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


module divider(input [3:0] dividend,divisor,
               output reg [3:0]quotient,remainder
               );
               always @(dividend,divisor) begin
               quotient=0;
               remainder=dividend;
               while(divisor<=remainder)begin
               quotient=quotient+1;
               remainder=remainder-divisor;
               end
               end
endmodule
