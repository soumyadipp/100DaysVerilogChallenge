`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 18:35:16
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


module tb;
reg [3:0] i_number;
wire [31:0] result;
integer x;
fact_num dut(i_number, result);

always for(x=0; x<11; x=x+1) #10 i_number=x;

initial begin 
$monitor("\t\t factorial of %d is %0d", i_number, result);
#120 $finish;
end
endmodule

