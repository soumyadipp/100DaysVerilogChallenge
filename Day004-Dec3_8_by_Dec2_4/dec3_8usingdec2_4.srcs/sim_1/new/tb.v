`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2025 22:15:55
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
reg [2:0]IP=3'b000,i;
wire [7:0]OP;
dec3_8 UUT(.O(OP),.A(IP));
initial begin
for(i=0;i<=8;i=i+1)
begin
 IP=IP+1'b1;
 #100;
 end
end

endmodule
