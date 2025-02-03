`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 20:28:13
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg [3:0]a,b;
	wire [7:0]mul_out;

    multiplier dut(.a(a),.b(b),.out(mul_out));
		always begin
			
			a=$random;
			b=$random;
            #10;
		end
    initial
    begin $monitor("%0d * %0d = %0d ",a, b, mul_out);
    #100 $finish;
    end
endmodule
