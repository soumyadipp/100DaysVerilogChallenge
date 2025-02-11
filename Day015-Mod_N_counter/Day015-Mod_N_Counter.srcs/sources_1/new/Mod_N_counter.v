`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 21:31:41
// Design Name: 
// Module Name: Mod_N_counter
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


module Mod_N_counter
#(parameter N=6,
parameter LENGTH=3)

(input clk,reset,output reg [LENGTH-1:0] counter
    );
    always begin @(posedge clk)
    if(reset)
    counter <= 0;
    else 
     if(counter==N-1)
       counter<=0;
       else
       counter=counter+1;
       end
    
endmodule
