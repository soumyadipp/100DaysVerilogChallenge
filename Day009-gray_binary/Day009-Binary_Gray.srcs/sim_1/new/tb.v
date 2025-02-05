`timescale 1ns / 1ps

module tb;
reg [3:0]binary_in,gray_in;
wire [3:0] gray_out,binary_out;

b2g dut(.binary(binary_in), .gray(gray_out));
g2b uut (.gray(gray_in), .binary(binary_out));
initial begin
        binary_in= 4'd0;
        gray_in = 4'd0;
        #10;
        binary_in= 4'd1;
        gray_in = 4'd1;
        #10;
        binary_in= 4'd2;
          gray_in = 4'd2;
        #10;
        binary_in= 4'd3;
          gray_in = 4'd3;
        #10;
        binary_in= 4'd4;
          gray_in = 4'd4;
        #10;
        binary_in= 4'd5;
          gray_in = 4'd5;
        #10;
        binary_in= 4'd6;
          gray_in = 4'd6;
        #10;
        binary_in= 4'd7;
          gray_in = 4'd7;
        #10;
        binary_in= 4'd8;
          gray_in = 4'd8;
        #10;
        binary_in= 4'd9;
          gray_in = 4'd9;
        #10;
        binary_in= 4'd10;
          gray_in = 4'd10;
        #10;
        binary_in= 4'd11;
          gray_in = 4'd11;
        #10;
        binary_in= 4'd12;
          gray_in = 4'd12;
        #10;
        binary_in= 4'd13;
          gray_in = 4'd13;
        #10;
        binary_in= 4'd14;
          gray_in = 4'd14;
        #10;
        binary_in= 4'd15;
          gray_in = 4'd15;
    end

initial
    begin $monitor("binary_in: %b -> gray_out: %b||gray_in: %b -> binary_out: %b", binary_in, gray_out,gray_in,binary_out);
    #160 $finish;
    end
endmodule
