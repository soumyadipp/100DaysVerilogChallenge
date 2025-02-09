`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 19:45:40
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


`timescale 1ns / 1ps

module test_bench;
reg clk,reset,a,b;
wire Q_d,Q_t,Q_S,Q_j;

  dFF aut(.clk(clk),.reset(reset),.d(a),.Q(Q_d));
  tFF but(.clk(clk),.reset(reset),.t(a),.Q(Q_t));
  srFF cut(.clk(clk),.reset(reset),.s(a),.r(b),.Q(Q_S));
  jkFF dut(.clk(clk),.reset(reset),.j(a),.k(b),.Q(Q_j));
  
  initial begin 
  clk=0;
  a=0;
  b=0;
  forever #4 clk=~clk;
  end
  
  initial 
    begin
     reset=1;
     a=0;
     b=0;
     #10;  
     reset=0;
     a=0;
     b=1;
     #10;  
     reset=0;
     a=1;
     b=0;
     #10;  
     reset=0;
     a=1;
     b=1;
     #10;  
     reset=1;
 $finish;
    end 
 
endmodule

