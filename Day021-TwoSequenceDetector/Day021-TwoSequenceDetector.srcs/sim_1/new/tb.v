`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 22:54:17
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
FSM_0010_0001 DUT(
.din(din),.rst(rst),.clk(clk),
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
din<=1'b0;
#10
din<=1'b1;
#10
din<=1'b0;
#10
din<=1'b0;
#10
din<=1'b0;
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
din<=1'b1;
#10
din<=1'b0;
#10
$finish;
end
endmodule

