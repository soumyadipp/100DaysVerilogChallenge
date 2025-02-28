`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2025 21:34:15
// Design Name: 
// Module Name: EvenOrOdd
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


module EvenOrOdd(input [3:0] number,
                 output reg even_odd

                 );
                 
 
    always@(number) begin
    
   even_odd = Check_Even_Odd(number);
    end
    
 function Check_Even_Odd;
 
    input [3:0] num;
    begin
    Check_Even_Odd=(num%2)?0:1;
    end
    endfunction
     
endmodule
