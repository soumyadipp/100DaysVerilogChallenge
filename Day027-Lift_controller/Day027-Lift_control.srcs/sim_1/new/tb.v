`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 22:35:03
// Design Name: 
// Module Name: tb
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


module tb();
  reg clk, reset;
  reg [2:0] req_floor;
  wire [1:0] idle, door, Up, Down;
  wire [2:0] current_floor;
  wire [2:0] max_request, min_request;
  wire [7:0] requests;
  reg emergency_stop;

  lift DUT( .clk(clk),
            .reset(reset), 
             .emergency_stop(emergency_stop),
              .req_floor(req_floor),
              .door(door),
              .up(Up),
              .down(Down),
              .idle(idle),
              .max_r(max_request),
              .min_r(min_request),
              .c_floor(current_floor),
              .request(requests) 

    );


always #5 clk = ~clk;


  initial begin
      
    clk = 1'b0;
    emergency_stop = 0;
    reset = 1;
    #10;
    reset = 0;
    req_floor = 1;
    #30;
    req_floor = 4;

    #10

    
    req_floor = 3; 
    #20;
    req_floor = 7; 
    #20;
    emergency_stop = 1; 
    #20;
    emergency_stop = 0; 
    #10;
    req_floor = 2; 
    #40;
    req_floor = 6; 
    #20;

    #20;
    req_floor = 1;
  end

  initial begin
  $display("Starting simulation...");
    $monitor("Time=%t,clk=%b,reset=%b,req_floor=%h,idle=%h,door=%h,Up=%h,Down=%h,current_floor=%h,max_request=%h,min_request=%h,requests=%h",
    $time, clk, reset, req_floor, idle, door, Up, Down, current_floor, max_request, min_request, requests);
  
  #305; 
  $display("Simulation finished.");
  $finish;
end
  
endmodule