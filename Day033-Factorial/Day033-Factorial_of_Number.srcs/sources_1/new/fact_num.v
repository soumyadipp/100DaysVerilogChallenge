`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 18:27:37
// Design Name: 
// Module Name: fact_num
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


module fact_num(
                input[3:0]i_number,
                output reg[31:0] result
    );
  function automatic integer fact(input integer i);
    begin
        if (i > 1)    fact = i * fact(i - 1);
        else    fact = 1;
    end
  endfunction

    always@(i_number)  result = fact(i_number);
    
endmodule

