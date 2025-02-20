`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 20:13:30
// Design Name: 
// Module Name: arbiter2
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


module arbiter2(
input clk,rst,[1:0]r,
output reg[1:0]g
);

parameter waitr=3'b001,
          grant0=3'b010,
          grant1=3'b100;
         
          
 reg [2:0]CS,NS;
always@(posedge rst, posedge clk)
    begin
        if(rst)
            CS<=waitr;
        else
            CS<=NS;
    end



always@(CS,r[0],r[1])
    begin
        case(CS)
          waitr: if(r[0]==1'b0&r[1]==1'b0)
                     NS<=waitr;
                  else if(r[0]==1'b1&r[1]==1'b0)
                     NS<=grant0;
                  else if(r[1]==1'b1)
                    NS<=grant1;
                  else 
                    NS<=CS;
              
               
          grant0: 
               if(r[0]==1'b1)
                NS<=CS;
               else 
                NS<=waitr;
               
          grant1:
            if(r[1]==1'b1)
                NS<=CS;
               else 
                NS<=waitr;
      
          
          endcase
    
    end
always@(CS)
    begin
         case(CS)
             waitr:begin
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

