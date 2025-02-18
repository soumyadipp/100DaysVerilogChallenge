`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2025 22:07:40
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench;

reg sensor, clk, clr;
wire [1:0] highway, small_road;

TrafficLightControl dut(.clk(clk), .clr(clr),.Sensor(sensor),.Small_Road(small_road),.Highway(highway));

initial begin
clk= 1'b0;
forever #10 clk= ~clk;
end

initial begin
clr= 1'b1;
sensor= 1'b0;
#20 clr= 1'b0;
#10 sensor= 1'b1;
#50 sensor= 1'b0;
#70 sensor= 1'b1;
#60 $stop;
end

endmodule

