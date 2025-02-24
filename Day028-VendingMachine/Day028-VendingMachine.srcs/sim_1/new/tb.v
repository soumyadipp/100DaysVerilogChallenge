`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 23:00:19
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


module tb;
reg clk;
reg [1:0] coin;
reg reset;
wire newspaper;
vendingMachine dut(.coin(coin),.clk(clk), .reset(reset), .y(newspaper));
initial begin
clk=0;
forever #10 clk = ~clk;
end
initial begin
coin = 0 ;
reset = 1 ;
#50 reset = 0 ;
 

#80 coin <= 1; #40 coin = 1;
#80 coin = 1; #40 coin = 1;
#80 coin = 1; #40 coin = 0 ;


#180 coin = 1; #40 coin = 0; 
#80 coin = 2; #40 coin = 0;

#180 coin = 2 ; #40 coin = 0 ;
#80 coin = 2; #40 coin = 0;


#180 coin = 2; #40 coin = 0;
#80 coin = 1; #40 coin = 0;

#20 
$finish;
end

endmodule