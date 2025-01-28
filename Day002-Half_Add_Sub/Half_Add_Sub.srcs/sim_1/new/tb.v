`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2025 21:51:48
// Design Name: 
// Module Name: tb
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


module tb(

    );
    
    reg a,
        b;
    wire sum,
         carry,
         difference,
         borrow;
         
    Half_Add_Sub Test (
                    .a(a),
                    .b(b),
                    .sum(sum),
                    .carry(carry),
                    .difference(difference),
                    .borrow(borrow)
                    );
                    
initial begin
a=0;
b=0;
#100
a=0;b=1;
#100
a=1;b=0;
#100
a=1;b=1;
end 

endmodule
