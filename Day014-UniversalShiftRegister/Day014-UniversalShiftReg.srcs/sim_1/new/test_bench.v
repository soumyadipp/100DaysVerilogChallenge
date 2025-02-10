`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2025 21:39:52
// Design Name: 
// Module Name: test_bench
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


module test_bench();
reg clk, reset, sft_lft, sft_rgt;
reg [7:0] pdata_in;
wire [7:0] pdata_out;
univesalShiftRegister uut(
.clk(clk),.reset(reset),.shift_left(sft_lft),.shift_right(sft_rgt),
.parallel_in(pdata_in),
.parallel_out(pdata_out)
                 );
initial begin
clk = 1'b0;
forever #5 clk =~clk;
end
 initial begin
    reset = 1'b1;
    sft_lft = 1'b0;
    sft_rgt = 1'b0;
    pdata_in = 8'he5;
    #10;
    
    reset = 1'b0;
    #10;

    sft_lft = 1'b1;
    sft_rgt = 1'b0;
    #10;

    sft_lft = 1'b0;
    sft_rgt = 1'b1;
    #10;
        
    sft_lft = 1'b1;
    sft_rgt = 1'b0;
    #10;
    
    sft_lft = 1'b1;
    sft_rgt = 1'b0;
    #10;

    sft_lft = 1'b0;
    sft_rgt = 1'b1;
  end

endmodule
