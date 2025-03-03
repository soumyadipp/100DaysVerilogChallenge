`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2025 20:59:15
// Design Name: 
// Module Name: tb_HelloWorld
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


class myClass;
  function new();
  endfunction
  
  function void print_hello();
    $display("Hello World!\n");
  endfunction
  
endclass

module tb_HelloWorld ();
  myClass h1;
  
  initial begin
    h1=new();
    h1.print_hello();
    $finish();
  end
  
endmodule
