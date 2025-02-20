`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 20:35:09
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
reg rst,clk;
reg [1:0]r;
wire [1:0]g;
arbiter2 DUT(
.clk(clk),.rst(rst),.r(r),.g(g)
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
r[0]<=1'b0;
r[1]<=1'b0;
#10
r[1]<=1'b1;
#10
r[1]<=1'b1;
r[0]<=1'b1;
#10
r[1]<=1'b1;
#10
r[1]<=1'b1;
r[0]<=1'b0;
#10
r[1]<=1'b1;
#10
r[1]<=1'b0;
#10
r[0]<=1'b1;
r[1]<=1'b0;
#10
r[0]<=1'b1;
#10
r[0]<=1'b1;
#10
r[0]<=1'b1;
#10
r[0]<=1'b0;
#10
$finish;
end
endmodule
