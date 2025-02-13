`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2025 22:47:42
// Design Name: 
// Module Name: test_bench
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


module test_bench();
reg din,rst,clk;
wire out;
fsm_11001 DUT(
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
