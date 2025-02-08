`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2025 20:30:57
// Design Name: 
// Module Name: S_R
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


module S_R(
           input en,
                 rst,
                 s,
                 r,
           output reg Q
           );
           always@(*)begin
           if(rst)Q<=1'b0;
           else if (en) begin
           case({s,r})
                    2'b00 : Q<= Q;
                    2'b01 : Q<= 1'b0;
                    2'b10 : Q<= 1'b1;
                    default : Q<=2'bxx;
           endcase
           end
           end
endmodule
