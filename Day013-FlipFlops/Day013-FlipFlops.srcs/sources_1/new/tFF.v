`timescale 1ns / 1ps

module tFF(
    input t,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if({reset})
            Q <= 1'b0;
            else
                begin
                case({t})
                2'b0:Q<=Q;
                2'b1:Q<=~Q;
                endcase
                end          
         end
endmodule
