`timescale 1ns / 1ps

module FIFO_Top_tb;

    parameter DEPTH = 16;
    parameter DATA_WIDTH = 8;
    parameter PTR_WIDTH = 4;

    reg w_clk, r_clk, wrst_n, rrst_n, w_en, r_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full, empty;

    // Instantiate the FIFO_Top module
    FIFO_Top #(DEPTH, DATA_WIDTH, PTR_WIDTH) uut (
        .w_clk(w_clk),
        .r_clk(r_clk),
        .wrst_n(wrst_n),
        .rrst_n(rrst_n),
        .w_en(w_en),
        .r_en(r_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Generate Write and Read Clocks
    always #5 w_clk = ~w_clk; // 10ns period (100 MHz)
    always #7 r_clk = ~r_clk; // 14ns period (71.4 MHz)

    initial begin
        // Initialize signals
        w_clk = 0;
        r_clk = 0;
        wrst_n = 0;
        rrst_n = 0;
        w_en = 0;
        r_en = 0;
        data_in = 0;

        // Reset the FIFO
        #20;
        wrst_n = 1;
        rrst_n = 1;
        #20;

        // Write data into FIFO
        w_en = 1;
        repeat(10) begin
            data_in = $random % 256; // Generate random 8-bit data
            #10;
        end
        w_en = 0;

        // Read data from FIFO
        #30;
        r_en = 1;
        repeat(10) begin
            #14; // Match read clock period
        end
        r_en = 0;

        #50;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | Data In=%h | Data Out=%h | Write Enable=%b | Read Enable=%b | Full=%b | Empty=%b", 
                  $time, data_in, data_out, w_en, r_en, full, empty);
    end

endmodule
