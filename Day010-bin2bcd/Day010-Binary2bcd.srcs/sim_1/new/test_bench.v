`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2025 19:41:24
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


module test_bench;
reg [7:0]data;
wire [3:0] bit0, bit1, bit2;
wire [11:0] BCD;

bin2bcd dut(.data(data), .bit0(bit0), .bit1(bit1), .bit2(bit2), .BCD(BCD));

	always 
	begin
    data=$random;
    #10;
	end
	initial
    begin $monitor("data: %d  BCD: %b",data,BCD);
    #80 $finish;
    end
endmodule

