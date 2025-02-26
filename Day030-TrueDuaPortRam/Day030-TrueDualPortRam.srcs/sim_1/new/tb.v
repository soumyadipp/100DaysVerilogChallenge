`timescale 1ns / 1ps

module tb;
    parameter addr_width = 4;
    parameter data_width = 8;
    parameter data_depth = 16;

    reg clk0, clk1, wren_a, wren_b, rden_a, rden_b;
    reg [addr_width-1:0] address_a, address_b;
    reg [data_width-1:0] data_a, data_b;
    wire [data_width-1:0] Q_a, Q_b;

    // Instantiate the Dual Port RAM
    DualPortRam DUT (
        .clk0(clk0),
        .clk1(clk1),
        .wren_a(wren_a),
        .wren_b(wren_b),
        .rden_a(rden_a),
        .rden_b(rden_b),
        .address_a(address_a),
        .address_b(address_b),
        .data_a(data_a),
        .data_b(data_b),
        .Q_a(Q_a),
        .Q_b(Q_b)
    );

    // Generate clocks
    always #10 clk0 = ~clk0;
    always #10 clk1 = ~clk1;

    initial begin
        // Initialize signals
        clk0 = 0;
        clk1 = 0;
        wren_a = 0;
        wren_b = 0;
        rden_a = 0;
        rden_b = 0;
        address_a = 0;
        address_b = 0;
        data_a = 0;
        data_b = 0;

        // Write to Port A
        #20;
        wren_a = 1;
        address_a = 4'b0001;
        data_a = 8'hAA;
        #20;
        wren_a = 0; // Stop writing

        // Read from Port A
        #20;
        rden_a = 1;
        #20;
        rden_a = 0;

        // Write to Port B
        #20;
        wren_b = 1;
        address_b = 4'b0010;
        data_b = 8'hBB;
        #20;
        wren_b = 0; // Stop writing

        // Read from Port B
        #20;
        rden_b = 1;
        #20;
        rden_b = 0;

        // Simultaneous Write on A and Read on B
        #20;
        wren_a = 1;
        address_a = 4'b0011;
        data_a = 8'hCC;
        rden_b = 1;
        address_b = 4'b0001; // Read what was written to A earlier
        #20;
        wren_a = 0;
        rden_b = 0;

        // Simultaneous Write on B and Read on A
        #20;
        wren_b = 1;
        address_b = 4'b0100;
        data_b = 8'hDD;
        rden_a = 1;
        address_a = 4'b0010; // Read what was written to B earlier
        #20;
        wren_b = 0;
        rden_a = 0;

        #50;
        $finish;
    end

endmodule
