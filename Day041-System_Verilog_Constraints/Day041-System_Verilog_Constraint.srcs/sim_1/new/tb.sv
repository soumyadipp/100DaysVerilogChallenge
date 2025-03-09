`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2025 23:12:50
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
reg [7:0] a_i,b_i;
reg [2:0] op_i;
wire [7:0] alu;
class Packet;
	
	rand bit [7:0]  a;
	rand bit [7:0]  b;
	rand bit [2:0]  op;
endclass
formal_ALU DUT (
    .a_i		(a_i),
    .b_i		(b_i),
    .op_i		(op_i),
    .alu_o		(alu)
  );
initial begin
		Packet pkt = new ();
		for (int i = 0 ; i < 18; i++) begin
			pkt.randomize ();
			
			$display ("itr=%0d a=0x%0h b=0x%0h op=0x%0h", i, pkt.a,pkt.b,pkt.op);
		a_i=pkt.a;
		b_i=pkt.b;
		op_i=pkt.op;
		#100;
		end
		
	end
endmodule
