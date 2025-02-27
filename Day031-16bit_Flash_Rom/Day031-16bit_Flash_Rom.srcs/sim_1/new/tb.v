`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2025 20:22:17
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


`timescale 1ns / 1ps

module tb_flash_rom_16;
    parameter Aw = 16;
    
    reg rst_n, clk;
    reg [Aw-3:0] addr;
    wire [15:0] rdata;
    
    
    flash_rom_16 DUT (
        .rst_n(rst_n),
        .clk(clk),
        .addr(addr),
        .rdata(rdata)
    );

   
    always #10 clk = ~clk;

    initial begin
        
        clk = 0;
        rst_n = 0;
        addr = 0;

        #20 rst_n = 1;
        
       
        DUT.mem[0] = 16'hAAAA;
        DUT.mem[1] = 16'h5555;
        DUT.mem[2] = 16'hF0F0;
        DUT.mem[3] = 16'h0F0F;
        
        
        #20 addr = 0;
        #20 addr = 1;
        #20 addr = 2;
        #20 addr = 3;
        
       
        
        #20 rst_n = 0;
        addr = 0;
        
        #50;
        $finish;
    end
endmodule
