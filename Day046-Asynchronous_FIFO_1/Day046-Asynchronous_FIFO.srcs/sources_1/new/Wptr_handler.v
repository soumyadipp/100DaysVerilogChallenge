`timescale 1ns / 1ps

module Wptr_handler #(
    parameter PTR_WIDTH = 4
)(
    input wclk, wrst_n, w_en,
    input [PTR_WIDTH:0] g_rptr_sync,
    output reg [PTR_WIDTH:0] b_wptr, g_wptr,
    output reg full
);
    
    wire [PTR_WIDTH:0] g_wptr_next;
    wire [PTR_WIDTH:0] b_wptr_next;
    wire wfull;

    assign b_wptr_next = b_wptr + (w_en & !full);
    assign g_wptr_next = (b_wptr_next >> 1) ^ b_wptr_next;
    assign wfull = (g_wptr_next == {~g_rptr_sync[PTR_WIDTH:PTR_WIDTH-1], g_rptr_sync[PTR_WIDTH-2:0]});

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            b_wptr <= 0;
            g_wptr <= 0;
        end else begin
            b_wptr <= b_wptr_next;
            g_wptr <= g_wptr_next;
        end
    end

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            full <= 0;
        else
            full <= wfull;
    end

endmodule
