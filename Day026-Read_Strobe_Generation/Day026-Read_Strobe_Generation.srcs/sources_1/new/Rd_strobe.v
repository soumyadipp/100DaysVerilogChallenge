`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 22:12:26
// Design Name: 
// Module Name: Rd_strobe
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


module Rd_strobe(
input clk,rst,mem,
output reg ras_n,cas_n
);

parameter idle=3'b000,
          r=3'b001,
          c=3'b010,
          p=3'b100;
         
          
 reg [2:0]CS,NS;
always@(posedge rst, posedge clk)
    begin
        if(rst)
            CS<=idle;
        else
            CS<=NS;
    end



always@(CS,mem)
    begin
        case(CS)
          idle:if(mem==1'b1)
                     NS<=r;
                else 
                    NS<=CS;
          r:  NS<=c;
                     
               
          c:   NS<=p;
               
          p:   NS<=idle;
      
          
          endcase
    
    end
always@(CS)
    begin
         case(CS)
             idle:begin
              ras_n=1'b1;
              cas_n=1'b1;
              end
             r:begin
              ras_n=1'b0;
              cas_n=1'b1;
              end
             c:begin
              ras_n=1'b0;
              cas_n=1'b0;
              end
             p:begin
              ras_n=1'b1;
              cas_n=1'b1;
              end
             
             default:
             begin
              ras_n=1'b1;
              cas_n=1'b1;
              end
         endcase
    end
endmodule