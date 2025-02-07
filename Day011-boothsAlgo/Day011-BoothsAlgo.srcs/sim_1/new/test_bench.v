`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2025 23:24:42
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
reg signed[3:0]A,B;
wire signed[7:0]Res;
BoothAlgo UUT(
                 .Q(A),
                 .M(B),
                 .Acc(Res)
    );
initial begin
A=3;
B=7;
#10;
A=9;
B=5;
#10;
A=-8;
B=3;
#10;
A=-4;
B=-7;
#10;
A=5;
B=-6;
#10;
A=4;
B=7;
#10;
A=9;
B=0;
#10;
end
initial begin
$monitor("A: %d * B: %d = %d",A,B,Res);
#60; 
 $finish;
end
endmodule
