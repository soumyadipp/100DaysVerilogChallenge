`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 21:06:31
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
reg clk, reset;
wire[3:0]state;
wire [1:0]out;
oneHotFSM UUT(
.clk(clk),.reset(reset),
.state(state),
.out(out)
);
initial begin
clk=0;
forever #10 clk=~clk;
end

initial begin
reset=1;
#20
reset=0;
end
initial begin
$monitor("\t\t State:%b || Output:%b",state,out);
#170 $finish;
end
endmodule
