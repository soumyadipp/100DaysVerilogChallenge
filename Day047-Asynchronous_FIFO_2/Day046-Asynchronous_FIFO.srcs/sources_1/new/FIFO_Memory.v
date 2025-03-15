`timescale 1ns / 1ps

module FIFO_Memory #(
    parameter DEPTH = 16,
    parameter DATA_WIDTH = 8,
    parameter PTR_WIDTH = 4
)(
    input w_clk, r_clk, w_en, r_en,
    input full, empty,
    input [DATA_WIDTH-1:0] data_in,
    input [PTR_WIDTH:0] r_ptr, w_ptr, // Extra bit for full/empty check
    output reg [DATA_WIDTH-1:0] data_out
);

    reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];

    always @(posedge w_clk) begin
        if (w_en & !full)
            fifo[w_ptr[PTR_WIDTH-1:0]] <= data_in;
    end

    always @(posedge r_clk) begin
        if (r_en & !empty)
            data_out <= fifo[r_ptr[PTR_WIDTH-1:0]];
    end

endmodule
