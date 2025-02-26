`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2025 19:25:05
// Design Name: 
// Module Name: DualPortRam
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


module DualPortRam #(parameter addr_width=4,
                                data_width=8,
                                data_depth=16
                     )
                     
                     (input  clk0,
                             clk1,                             
                             wren_a,
                             wren_b,
                             rden_a,
                             rden_b,
                      input  [addr_width-1:0] address_a,
                             address_b,
                      input  [data_width-1:0] data_a,
                              data_b,
                      output reg[data_width-1:0]Q_a,Q_b
                     

                       );
                       
                     reg [data_width-1:0] ram [data_depth-1:0];
                     
                     always@(posedge clk0)begin
                     if(wren_a)
                       ram[address_a]<=data_a;
                     end
                     
                     always@(posedge clk0)begin
                     if(rden_a)
                       Q_a<=ram[address_a];
                     end
                     
                     always@(posedge clk1)begin
                     if(wren_b)
                       ram[address_b]<=data_b;
                     end
                     
                     always@(posedge clk1)begin
                     if(rden_b)
                      Q_b<=ram[address_b];
                     end
endmodule
