`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2025 00:39:43
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
reg [3:0]i_p ;
reg[1:0]sel;
wire o_p; 
mux_4_1 M1(.ip(i_p),.select(sel),.op(o_p));
always begin
  i_p=$random;
  sel=$random;
  #10;
  end
   initial
    begin $monitor("Input Data : %b  Select Line : %b Output : %b ",i_p, sel, o_p);
    #100 $finish;
    end
endmodule
