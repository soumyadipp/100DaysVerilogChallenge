`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 23:30:18
// Design Name: 
// Module Name: System_Verilog_interface
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


interface cnt_if #(parameter WIDTH = 4) (input bit clk);
  logic 			rstn;
  logic 			load_en;
  logic [WIDTH-1:0] load;
  logic [WIDTH-1:0] count;
  logic 			down;
  logic 			rollover;
endinterface

module System_Verilog_interface;
  reg clk;

  // TB Clock Generator used to provide the design
  // with a clock -> here half_period = 10ns => 50 MHz
  always #10 clk = ~clk;

  cnt_if 	  cnt_if0 (clk);
  Counter_ud  c0 ( 	.clk 		(cnt_if0.clk),
                  	.rstn 		(cnt_if0.rstn),
                  	.load 		(cnt_if0.load),
                  	.load_en 	(cnt_if0.load_en),
                  	.down 		(cnt_if0.down),
                  	.rollover 	(cnt_if0.rollover),
                  	.Count 		(cnt_if0.count));

  initial begin
    bit load_en, down;
    bit [3:0] load;
  int delay;
    $monitor("[%0t] down=%0b load_en=%0b load=0x%0h count=0x%0h rollover=%0b",
    	$time, cnt_if0.down, cnt_if0.load_en, cnt_if0.load, cnt_if0.count, cnt_if0.rollover);

    // Initialize testbench variables
    clk <= 0;
    cnt_if0.rstn <= 0;
    cnt_if0.load_en <= 0;
    cnt_if0.load <= 0;
    cnt_if0.down <= 0;

    // Drive design out of reset after 5 clocks
    repeat (5) @(posedge clk);
    cnt_if0.rstn <= 1;
 for (int i = 0; i < 5; i++) begin

      // Drive inputs after some random delay
      delay = $urandom_range (1,30);
      #(delay);

      // Randomize input values to be driven
      std::randomize(load, load_en, down);

      // Assign tb values to interface signals
      cnt_if0.load <= load;
      cnt_if0.load_en <= load_en;
      cnt_if0.down <= down;
    end

    // Wait for 5 clocks and finish simulation
    repeat(10) @ (posedge clk);
    $finish;
  end
endmodule