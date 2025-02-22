`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 22:22:57
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
reg mem;
wire ras_n,cas_n;
Rd_strobe DUT(
.clk(clk),.rst(rst),.mem(mem),.ras_n(ras_n),.cas_n(cas_n)
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
mem<=1'b0;
#5
mem<=1'b1;
#100
$finish;
end
endmodule
