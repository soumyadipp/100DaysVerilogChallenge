`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 22:53:01
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
reg d,v,rst,clk;
wire y;
fsm_manchestorEncoder DUT(
.clk(clk),.rst(rst),.d(d),.v(v),
.y(y)
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
v<=1'b1;
d<=1'b0;
#10
d<=1'b1;
#10
d<=1'b0;
#10
d<=1'b1;
#10
d<=1'b0;
#10
d<=1'b1;
#10
d<=1'b1;
#10
d<=1'b0;
#10
d<=1'b1;
#10
d<=1'b1;
#10
d<=1'b0;
#10
d<=1'b0;
#10
d<=1'b0;
v<=1'b0;
#10
d<=1'b1;
#10
d<=1'b0;
#10
$finish;
end
endmodule
