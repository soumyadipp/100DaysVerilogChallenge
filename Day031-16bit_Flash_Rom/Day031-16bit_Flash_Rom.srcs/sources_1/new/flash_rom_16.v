`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2025 20:14:12
// Design Name: 
// Module Name: flash_rom_16
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


module flash_rom_16 #(
                       parameter Aw=16
                     )
                     (
                       input rst_n,clk,
                       input[Aw-3:0]addr,
                       output reg[15:0] rdata

    );
    
    reg [8191:0] mem [15:0];
    
    always @ (posedge clk)
    if(rst_n)
     rdata<=mem[addr];
     else
     rdata<='bz;
endmodule
