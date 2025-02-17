`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 22:50:29
// Design Name: 
// Module Name: FSM_0010_0001
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


module FSM_0010_0001(
input din,rst,clk,
output reg out

    );
    reg[2:0]cst,nst;
    parameter s0=3'b000,
              s1=3'b001,
              s2=3'b010,
              s3=3'b011,
              s4=3'b100;
    always @(posedge clk) begin
    if(rst)
    cst<=s0;
    else
    cst<=nst;
    end
    
    always@(cst,din)begin
    case(cst)
      s0:if(din==1'b0)
      begin
           nst<=s1;
           out<=1'b0;
      end     
 else
      begin
         nst<=s0;
         out<=1'b0;
       end
       s1:if(din==1'b0)
      begin
           nst<=s2;
           out<=1'b0;
      end     
 else
      begin
         nst<=s0;
         out<=1'b0;
       end
   s2:if(din==1'b0)
      begin
           nst<=s3;
           out<=1'b0;
      end     
 else
      begin
         nst<=s4;
         out<=1'b0;
       end    
       
       
 s3:if(din==1'b0)
      begin
           nst<=s3;
           out<=1'b0;
      end     
 else
      begin
         nst<=s4;
         out<=1'b1;
       end      
   s4:if(din==1'b1)
      begin
           nst<=s0;
           out<=1'b0;
      end     
 else
      begin
         nst<=s1;
         out<=1'b1;
       end
default:
begin
 nst<=s0; 
 out<=1'b0;
 end   
      endcase    
    end
endmodule
