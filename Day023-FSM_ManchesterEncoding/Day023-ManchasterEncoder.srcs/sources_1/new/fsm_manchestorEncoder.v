`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 22:38:55
// Design Name: 
// Module Name: fsm_manchestorEncoder
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


module fsm_manchestorEncoder(
input clk,rst,d,v,
output reg y
);

parameter idle=3'b000,
          S1a=3'b001,
          S0a=3'b010,
          S1b=3'b011,
          S0b=3'b100;
          
 reg [2:0]CS,NS;
always@(posedge rst, posedge clk)
    begin
        if(rst)
            CS<=idle;
        else
            CS<=NS;
    end



always@(CS,d,v)
    begin
        case(CS)
          idle: if(v==1'b1)
              begin
                 if(d==1'b1)
               NS<=S1a;
               else
               NS<=S0a;
               end
               else
               NS<=idle;
               
          S1a: 
               NS<=S1b;
               
          S0a: 
              NS<=S0b;
              
          S1b: if(v==1'b1)
              begin
                 if(d==1'b1)
               NS<=S1a;
               else
               NS<=S0a;
               end
               else
               NS<=idle;
          S0b: if(v==1'b1)
              begin
                 if(d==1'b1)
               NS<=S1a;
               else
               NS<=S0a;
               end
               else
               NS<=idle;
          
          endcase
    
    end
always@(CS)
    begin
         case(CS)
             idle:y<=1'b0;
             S1a:y<=1'b1;
             S0a:y<=1'b0;
             S1b:y<=1'b0;
             S0b:y<=1'b1;
             default: y=1'b0;
         endcase
    end
endmodule


