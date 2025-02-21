`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2025 20:28:42
// Design Name: 
// Module Name: R_arbiter2
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



module R_arbiter2(
input clk,rst,[1:0]r,
output reg[1:0]g
);

parameter waitr0=3'b000,
          waitr1=3'b001,
          grant0=3'b010,
          grant1=3'b100;
         
          
 reg [2:0]CS,NS;
always@(posedge rst, posedge clk)
    begin
        if(rst)
            CS<=waitr1;
        else
            CS<=NS;
    end



always@(CS,r[0],r[1])
    begin
        case(CS)
          waitr1: if(r[0]==1'b0&r[1]==1'b0)
                     NS<=waitr1;
                  else if(r[0]==1'b1&r[1]==1'b0)
                     NS<=grant0;
                  else if(r[1]==1'b1)
                    NS<=grant1;
                  else 
                    NS<=CS;
          waitr0: if(r[0]==1'b0&r[1]==1'b0)
                     NS<=waitr0;
                  else if(r[0]==1'b0&r[1]==1'b1)
                     NS<=grant1;
                  else if(r[0]==1'b1)
                    NS<=grant0;
                  else 
                    NS<=CS;    
               
          grant0: 
               if(r[0]==1'b1)
                NS<=CS;
               else 
                NS<=waitr1;
               
          grant1:
            if(r[1]==1'b1)
                NS<=CS;
               else 
                NS<=waitr0;
      
          
          endcase
    
    end
always@(CS)
    begin
         case(CS)
             waitr1:begin
              g[0]=1'b0;
              g[1]=1'b0;
              end
              waitr0:begin
              g[0]=1'b0;
              g[1]=1'b0;
              end
             grant0:begin
              g[0]=1'b1;
              g[1]=1'b0;
              end
             grant1:begin
              g[0]=1'b0;
              g[1]=1'b1;
              end
             
             default:
             begin
              g[0]=1'b0;
              g[1]=1'b0;
              end
         endcase
    end
endmodule

