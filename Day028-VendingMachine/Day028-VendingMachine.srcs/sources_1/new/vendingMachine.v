`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: vendingMachine
//////////////////////////////////////////////////////////////////////////////////

module vendingMachine(
    input wire [1:0] coin, 
    input wire clk,
    input wire reset,
    output reg y
);
    
    reg [1:0] CS, NS;
    
   
    parameter S0 = 2'b00,  
              S5 = 2'b01,  
              S10 = 2'b10, 
              S15 = 2'b11; 

 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            CS <= S0;
            y  <= 1'b0;
        end else begin
            CS <= NS;
        end
    end


    always @(*) begin
        case (CS)
            S0: begin
                if (coin == 2'b01) NS = S5;
                else if (coin == 2'b10) NS = S10;
                else NS = S0;
            end
            S5: begin
                if (coin == 2'b01) NS = S10;
                else if (coin == 2'b10) NS = S15;
                else NS = S5;
            end
            S10: begin
                if (coin == 2'b01) NS = S15;
                else if (coin == 2'b10) NS = S15;
                else NS = S10;
            end
            S15: begin
                NS = S0;
            end
            default: NS = S0;
        endcase
    end

  
    always @(posedge clk) begin
        if (reset) 
            y <= 1'b0;
        else if (CS == S15) 
            y <= 1'b1;
        else 
            y <= 1'b0;
    end

endmodule
