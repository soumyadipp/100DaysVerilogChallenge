`timescale 1ns / 1ps

module FF_synchronizer #(
    parameter WIDTH = 4
)(
    input clk,
    input rst_n,
    input [WIDTH:0] d_in,
    output [WIDTH:0] d_out
);

    reg [WIDTH:0] FF1, FF2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            FF1 <= 0;
            FF2 <= 0;
        end else begin
            FF1 <= d_in;
            FF2 <= FF1;
        end
    end

    assign d_out = FF2;

endmodule
