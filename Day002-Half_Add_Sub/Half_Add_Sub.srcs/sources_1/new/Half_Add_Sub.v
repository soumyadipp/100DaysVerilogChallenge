`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2025 21:29:16
// Design Name: 
// Module Name: Half_Add_Sub
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


module Half_Add_Sub(input a,
                    input b,
                    output sum,
                    output carry,
                    output difference,
                    output borrow

    );
    assign sum = a ^ b;
    assign difference = a ^ b;
    assign carry = a & b;
    assign borrow = ~a & b;
    
endmodule
