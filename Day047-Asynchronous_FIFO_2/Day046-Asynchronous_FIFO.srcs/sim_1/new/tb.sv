`timescale 1ns / 1ps

class transaction;
    rand bit [7:0] data;
    rand bit w_en;

    constraint c1 { w_en dist {1:=70, 0:=30}; } // 70% chance of write enable being high

    function void print();
        $display("Time=%0t | Data=%h | Write Enable=%b", $time, data, w_en);
    endfunction
endclass

class scoreboard;
    mailbox #(bit [7:0]) scb;

    function new();
        scb = new();
    endfunction

    task put(bit [7:0] data);
        scb.put(data);
    endtask

    task check(bit [7:0] out_data);
        bit [7:0] expected;
        scb.get(expected);
        if (expected !== out_data) 
            $error("Mismatch! Expected: %h, Got: %h", expected, out_data);
        else 
            $display("Match! Expected: %h, Got: %h", expected, out_data);
    endtask
endclass

module FIFO_Top_tb;
    parameter DEPTH = 16;
    parameter DATA_WIDTH = 8;
    parameter PTR_WIDTH = 4;

    reg w_clk, r_clk, wrst_n, rrst_n, w_en, r_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full, empty;

    // Instantiate the FIFO module
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

    transaction t;
    scoreboard scb;

    // Generate clocks
    always #5 w_clk = ~w_clk; // 10ns (100 MHz)
    always #7 r_clk = ~r_clk; // 14ns (71.4 MHz)

    initial begin
        w_clk = 0; r_clk = 0;
        wrst_n = 0; rrst_n = 0;
        w_en = 0; r_en = 0;
        data_in = 0;
        scb = new();

        // Reset the FIFO
        #20;
        wrst_n = 1;
        rrst_n = 1;
        #20;

        // Start transaction
        gen_data();

        #50;
        $finish;
    end

    // Generate transactions with random data
    task gen_data();
        int i;
        t = new();

        for (i = 0; i < 30; i++) begin
            if (!t.randomize()) 
                $error("Randomization failed!");

            if (t.w_en && !full) begin
                data_in = t.data;
                w_en = 1;
                scb.put(data_in);
            end else if (!empty) begin
                r_en = 1;
            end

            t.print();
            #10;
            w_en = 0;
            r_en = 0;
        end
    endtask

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | Data In=%h | Data Out=%h | W_EN=%b | R_EN=%b | Full=%b | Empty=%b", 
                  $time, data_in, data_out, w_en, r_en, full, empty);
    end

    // Check outputs
    always @(posedge r_clk) begin
        if (!empty) scb.check(data_out);
    end

endmodule
