`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SOUMYADIP MANNA
// 
// Create Date: 25.03.2025 23:23:37
// Design Name: RISCV
// Module Name: instruction_memory_top
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


module instruction_memory_top #(
    parameter INIT_MEM = 0
)(
    input wire clk,
    input wire rst,
    input wire we_re,
    input wire request,
    input wire [3:0]  mask,
    input wire [7:0]  address,
    input wire [31:0] data_in,

    output reg valid,
    output wire [31:0] data_out
    );

    always @(posedge clk or negedge rst ) begin
        if(!rst)begin
            valid <= 0;
        end
        else begin
            valid <= request;
        end
    end

    memory #(
      .INIT_MEM(INIT_MEM)
    )u_memory(
        .clk(clk),
        .we_re(we_re),
        .request(request),
        .mask(mask),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );
endmodule