`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2025 18:43:38
// Design Name: 
// Module Name: tb_Class_Constructor
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
class test;
bit [2:0] header;
bit       encode;
bit [2:0] mode;
bit [7:0] data;
bit       stop;
  function new (bit [2:0] header = 3'h1, bit [2:0] mode = 5, bit[7:0] data=$random); // constuctor explicitly defined
		this.header = header;
		this.encode = 0;
		this.mode   = mode;
		this.data   = data;
		this.stop   = 1;
endfunction

	function display ();
		$display ("Header = 0x%0h, Encode = %0b, Mode = 0x%0h,Data =0x%0h, Stop = %0b",
		           this.header, this.encode, this.mode,this.data, this.stop);
	endfunction
endclass


class test_ex extends test;
  rand bit  [3:0] id;
  rand bit [2:0] pkt;
endclass

module tb_Class_Constructor();

	test int3 [3];
	test_ex int4[4];
	initial begin
    	for(int i = 0; i < $size (int3); i++) begin
   	   		int3[i] = new ();
       		int3[i].display ();
   		end
   
    	for(int i = 0; i < $size (int3); i++) begin
   	   		int4[i] = new ();
           	int4[i].randomize();
   	$display ("Iteration = 0x%0d, Header = 0x%0h, Encode = %0b, Mode = 0x%0h,Data=0x%0h, Stop = %0b, id=%0h, pkt=%0h",
		           i,int4[i].header, int4[i].encode, int4[i].mode,int4[i].data, int4[i].stop, int4[i].id, int4[i].pkt);
   	end
   	
 end  	
   	
endmodule


