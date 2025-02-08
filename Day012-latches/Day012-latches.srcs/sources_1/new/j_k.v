`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2025 20:39:37
// Design Name: 
// Module Name: j_k
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


module j_k(
           input en,
                 rst,
                 j,
                 k,
           output reg Q
           );
           always@(*)begin
           if(rst)Q<=1'b0;
           else if (en) begin
           case({j,k})
                    2'b00 : Q<= Q;
                    2'b01 : Q<= 1'b0;
                    2'b10 : Q<= 1'b1;
                    default : Q<=~Q;
           endcase
           end
           end
endmodule