`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 22:23:43
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
reg din,rst,clk;
wire out;
fsm_1011 DUT(
.clk(clk),.rst(rst),.din(din),
.out(out)
);

initial begin
clk<=1'b0;
forever #5 clk=~clk;
end

initial begin
rst<=1'b1;
#10
rst<=1'b0;
#5
din<=1'b0;
#10
din<=1'b1;
#10
din<=1'b0;
#10
din<=1'b1;
#10
din<=1'b0;
#10
din<=1'b1;
#10
din<=1'b1;
#10
din<=1'b0;
#10
din<=1'b1;
#10
din<=1'b1;
#10
din<=1'b0;
#10
din<=1'b0;
#10
din<=1'b0;
#10
din<=1'b1;
#10
din<=1'b0;
#10
$finish;
end
endmodule