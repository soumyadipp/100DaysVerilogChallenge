`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2025 20:42:28
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
reg en,rst,a,b;
wire Q_S,Q_J;

  j_k dut(.en(en),
          .rst(rst),
          .j(a),
          .k(b),
          .Q(Q_J));
  S_R uut(.en(en),
          .rst(rst),
          .s(a),
          .r(b),
          .Q(Q_S));
  
   initial 
    begin
    en=0;
    rst=0;
     #10;
     a = 1'b1;
     b = 1'b0;     
     #10;
     rst=1;
     #10;
     rst=0;
     en=1;
     a = 1'b0;
     b = 1'b0;     
     #10;
     a = 1'b0;
     b = 1'b1;     
     #10;
     
     a = 1'b1;
     b = 1'b0;     
     #10;
     
     a = 1'b1;
     b = 1'b1;
     #10;
    end 
   endmodule