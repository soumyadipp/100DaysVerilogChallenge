`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2025 22:50:07
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
parameter addr_width=4;
parameter data_width=8;
parameter data_depth=16;

reg clk ,WE;
reg [addr_width-1:0]address;
reg [data_width-1:0]data;
wire  [data_width-1:0]dout;
 
 
 single_port_ram DUT(clk,WE,address,data,dout);
 
 always #10 clk=~clk;
 
 initial begin
 clk=0;
 WE=1;
 #20
 address=4'b1011;
 data=8'b11001111;
 #20
 address=4'b0001;
 data=8'b11001011;
 #20
 address=4'b1001;
 data=8'b11000011;
 #20
 address=4'b1000;
 data=8'b00001111;
 #20
 address=4'b1101;
 data=8'b11110111;
 #20
 WE=0;
 #20
 address=4'b1101;
 #20
 address=4'b1011;
 #20
 address=4'b1000;
 #20
 address=4'b1001;
 #20
 address=4'b0001;
 #20 $finish;
 end
 
 
 


endmodule
