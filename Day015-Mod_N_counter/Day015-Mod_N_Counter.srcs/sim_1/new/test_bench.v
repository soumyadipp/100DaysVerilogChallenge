`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 21:37:17
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
parameter N=6;
parameter LENGTH=3;
reg clk,reset;
wire [LENGTH-1:0] counter;

Mod_N_counter dut(clk, reset, counter);

initial
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
        
        initial
        begin
            reset = 1;
            #10;
            reset = 0;    
        end

initial begin
    $monitor("\t\t\t counter: %d",counter);
    #125 $finish;
end

endmodule
