`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 00:14:05
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
reg [3:0]a,b;
wire [3:0]c,d;
divider UUT(.dividend(a),
            .divisor(b),
            .quotient(c),
            .remainder(d)
               );
 always begin 
 a= $random;
 b= $random;
 #10;
 end
 initial begin
  $monitor("%0d | %0d | %0d | %0d",a, b, c, d);
    #100 $finish;
    end

endmodule
