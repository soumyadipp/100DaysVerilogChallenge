`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2025 22:32:13
// Design Name: 
// Module Name: single_port_ram
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


module single_port_ram #(
                         parameter addr_width=4,
                         parameter data_width=32,
                         parameter data_depth=16
                         )
                         (
                         
                           input clk,
                           input WE,
                           input [addr_width-1:0] address,
                           input [data_width-1:0] data,
                           output reg[data_width-1:0] dout

                          );
                          reg [data_width-1:0]ram[data_depth-1:0];
                          
                       
                          always@(posedge clk)begin
                          
                          if(WE)
                            ram[address]<=data;
                          else
                            dout <= ram[address];
                          end
endmodule