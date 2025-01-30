`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2025 21:52:38
// Design Name: 
// Module Name: dec2_4
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


module dec2_4(output reg[3:0]Y,input e,[1:0]a);
always@(*)begin
case({e,Y})
 3'b100:Y=4'b0001;
 3'b101:Y=4'b0010;
 3'b110:Y=4'b0100;
 3'b111:Y=4'b1000;
 default: Y=4'b0000;
 endcase
 end
endmodule
