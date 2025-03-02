`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2025 21:39:33
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
    reg rst;
    reg [3:0] duty;
    wire PWM;

    
    PWM uut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .PWM(PWM)
    );

   
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        rst = 1;
        duty = 0;

        
        #20 rst = 0;

       
        #100 duty = 2;  // 20% duty cycle
        #100 duty = 5; // 50% duty cycle
        #100 duty = 8; // 80% duty cycle
        #100 duty = 10; // 100% duty cycle
        #100 duty = 0;  // 0% duty cycle
        
        
        #100 $finish;
    end

    initial begin
        $monitor("Time = %0t | Duty = %d | PWM = %b", $time, duty, PWM);
    end


endmodule
