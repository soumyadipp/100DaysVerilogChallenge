`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2025 21:45:51
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


module tb ;
wire op;
reg[3:0]num;
EvenOrOdd DUT(.number(num),.even_odd(op));
initial begin
#10
num=1001;
if(op==1)$display("%d is a Even Number",num);
else $display("%d is a Odd Number",num);
#10
num=1101;
if(op==1)$display("%d is a Even Number",num);
else $display("%d is a Odd Number",num);
#10
num=0100;
if(op==1)$display("%d is a Even Number",num);
else $display("%d is a Odd Number",num);
#10
num=0101;
if(op==1)$display("%d is a Even Number",num);
else $display("%d is a Odd Number",num);
#10
num=1000;
if(op==1)$display("%d is a Even Number",num);
else $display("%d is a Odd Number",num);
#10$finish;
end

endmodule
