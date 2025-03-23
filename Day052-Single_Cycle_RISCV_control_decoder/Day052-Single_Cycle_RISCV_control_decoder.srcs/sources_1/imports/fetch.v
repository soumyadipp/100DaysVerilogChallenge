`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SOUMYADIP MANNA
// 
// Create Date: 21.03.2025 16:09:51
// Design Name: RICSV
// Module Name: fetch
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
module fetch (
    input wire clk,
    input wire rst,
    input wire next_sel,
    input wire valid,
    input wire load,
    input wire branch_result,
    input wire [31:0] next_address,
    input wire [31:0] instruction_fetch,

    output reg request,
    output reg [3:0] mask,
    output wire [31:0] address_out,
    output reg  [31:0] instruction,
    output wire [31:0] pre_address_pc
    );

    // PROGRAM COUNTER INSTANCE
    pc  pc0 
    (
        .clk(clk),
        .rst(rst),
        .load(load),
        .next_sel(next_sel),
        .dmem_valid(valid),
        .next_address(next_address),
        .branch_result(branch_result),
        .address_out(address_out),
        .pre_address_pc(pre_address_pc)
    );

    always @ (*) begin
        if ((load && !valid)) begin
            mask = 4'b1111; 
            request = 1'b0;
        end
        else begin
            mask = 4'b1111; 
            request = 1'b1;
        end
    end
    always @ (*) begin
        instruction = instruction_fetch ;
    end
endmodule
