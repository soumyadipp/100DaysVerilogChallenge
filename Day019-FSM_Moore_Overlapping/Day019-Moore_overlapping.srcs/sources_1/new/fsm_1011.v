`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2025 22:55:53
// Design Name: 
// Module Name: fsm_1011
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


module fsm_1011(
input clk,rst,din,
output reg out
);

parameter S0=3'b000,
          S1=3'b001,
          S2=3'b010,
          S3=3'b011,
          S4=3'b100;
          
 reg [2:0]CS,NS;
always@(posedge rst, posedge clk)
    begin
        if(rst)
            CS<=S0;
        else
            CS<=NS;
    end



always@(CS,din)
    begin
        case(CS)
          S0: if(din==1'b1)
               NS<=S1;
               else
               NS<=S0;
               
          S1: if(din==1'b0)
               NS<=S2;
               else 
               NS<=S1;
               
          S2: if(din==1'b1)
              NS<=S3;
              else
              NS<=S0;
          S3: if(din==1'b1)
              NS<=S4;
              else
              NS<=S2;
          S4: if(din==1'b0)
             NS<=S2;
             else
             NS<=S1;
          
          endcase
    
    end
always@(CS)
    begin
         case(CS)
             S0:out<=1'b0;
             S1:out<=1'b0;
             S2:out<=1'b0;
             S3:out<=1'b0;
             S4:out<=1'b1;
             default: out=1'b0;
         endcase
    end
endmodule
