`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2025 23:10:56
// Design Name: 
// Module Name: BoothAlgo
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


module BoothAlgo(
                 input signed[3:0]Q,M,
                 output reg signed[7:0]Acc
    );
    
    reg[1:0]operation;
    integer i;
    reg q0;
    reg[3:0]M_comp;
    always@(Q,M)
    begin
    Acc=8'd0;
    q0=1'b0;
    M_comp=-M;
    for(i=0;i<=4;i=i+1)
    begin
    operation= {Q[i],q0};
    case(operation)
     2'b10 : Acc[7:4] = Acc[7:4] + M_comp;
     2'b01 : Acc[7:4] = Acc[7:4] + M;
     endcase
    Acc=Acc>>1;
    Acc[7]=Acc[6];
    q0=Q[i];
    end
   end
endmodule
