`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2025 21:19:40
// Design Name: 
// Module Name: PWM
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


module PWM (
    input clk,
    input rst,
    input [3:0] duty,  
    output reg PWM
);

    reg [3:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            PWM <= 0;
        end else begin
            counter <= (counter == 9) ? 0 : counter + 1;
            PWM <= (counter < duty) ? 1 : 0;
        end
    end
endmodule
