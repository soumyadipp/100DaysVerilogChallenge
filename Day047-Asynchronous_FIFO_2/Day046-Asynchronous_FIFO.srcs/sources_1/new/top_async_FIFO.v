`timescale 1ns / 1ps

module FIFO_Top #(
    parameter DEPTH = 16,
    parameter DATA_WIDTH = 8,
    parameter PTR_WIDTH = 4
)(
    input w_clk, r_clk, wrst_n, rrst_n, w_en, r_en,
    input [DATA_WIDTH-1:0] data_in,
    output [DATA_WIDTH-1:0] data_out,
    output full, empty
);

    // Internal pointer signals
    wire [PTR_WIDTH:0] b_wptr, g_wptr, b_rptr, g_rptr;
    wire [PTR_WIDTH:0] g_rptr_sync, g_wptr_sync;

    // FIFO Memory Instantiation
    FIFO_Memory #(DEPTH, DATA_WIDTH, PTR_WIDTH) fifo_inst (
        .w_clk(w_clk), .r_clk(r_clk), 
        .w_en(w_en), .r_en(r_en),
        .full(full), .empty(empty),
        .data_in(data_in),
        .r_ptr(b_rptr), .w_ptr(b_wptr),
        .data_out(data_out)
    );

    // Write Pointer Handler
    Wptr_handler #(PTR_WIDTH) wptr_inst (
        .wclk(w_clk), .wrst_n(wrst_n), .w_en(w_en),
        .g_rptr_sync(g_rptr_sync),
        .b_wptr(b_wptr), .g_wptr(g_wptr),
        .full(full)
    );

    // Read Pointer Handler
    Rptr_handler #(PTR_WIDTH) rptr_inst (
        .rclk(r_clk), .rrst_n(rrst_n), .r_en(r_en),
        .g_wptr_sync(g_wptr_sync),
        .b_rptr(b_rptr), .g_rptr(g_rptr),
        .empty(empty)
    );

    // Synchronizing Read Pointer to Write Clock
    FF_synchronizer #(PTR_WIDTH) sync_rptr (
        .clk(w_clk), .rst_n(wrst_n), 
        .d_in(g_rptr),
        .d_out(g_rptr_sync)
    );

    // Synchronizing Write Pointer to Read Clock
    FF_synchronizer #(PTR_WIDTH) sync_wptr (
        .clk(r_clk), .rst_n(rrst_n), 
        .d_in(g_wptr),
        .d_out(g_wptr_sync)
    );

endmodule
