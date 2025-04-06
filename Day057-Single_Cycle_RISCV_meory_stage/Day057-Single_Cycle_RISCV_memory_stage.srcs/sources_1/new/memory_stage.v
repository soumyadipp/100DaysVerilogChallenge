`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2025 01:09:28
// Design Name: 
// Module Name: memory_stage
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


module memory_stage (
    input rst,
    input wire load,
    input wire store,
    input wire valid,
    input wire [31:0] op_b,
    input wire [31:0] alu_out_address,
    input wire [31:0] instruction,
    input wire [31:0] wrap_load_in,

    output reg we_re,
    output reg request,
    output wire [3:0]  mask,
    output wire [31:0] store_data_out,
    output wire [31:0] wrap_load_out
    );

   
    wrapper_memory u_wrap_mem0 (
        .data_i(op_b),
        .byteadd(alu_out_address [1:0]),
        .fun3(instruction [14:12]),
        .mem_en(store),
        .Load(load),
        .wrap_load_in(wrap_load_in),
        .masking(mask),
        .data_o(store_data_out),
        .wrap_load_out(wrap_load_out)
    );

    always @ (*) begin
        if (!valid) begin
            request = 0;
            we_re = 0;
        end
        else begin
            request = load | store ;
            we_re = store ;
        end
    end
endmodule