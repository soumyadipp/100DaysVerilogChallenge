`timescale 1ns / 1ps

module dFF(
    input d,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if({reset})
            Q <= 1'b0;
            else
                begin
                case({d})
                2'b0:Q<=1'b0;
                2'b1:Q<=1'b1;
                endcase
                end          
         end
endmodule
