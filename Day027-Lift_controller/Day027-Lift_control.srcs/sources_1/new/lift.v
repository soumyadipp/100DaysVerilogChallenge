`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 22:16:57
// Design Name: 
// Module Name: lift
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


module lift( input clk ,reset, emergency_stop,
              input wire [2:0]req_floor,
              output reg [1:0] door,up,down,idle,
              output reg [2:0] max_r,min_r,c_floor,
              output reg [7:0] request 

    );
    
    
    reg door_timer;
    reg emergency_stopped;
    reg flag = 0;
    always @(req_floor)
    begin
    
    request[req_floor] = 1;
    
    if (max_r < req_floor)
     max_r = req_floor;
    if(min_r > req_floor)
     min_r = req_floor;
    if(request[c_floor]==1)
    begin
      idle = 1;
      door = 1;
      request[c_floor] = 0;
      door_timer = 1;
     end
    end
    
    always@(posedge clk)
    begin
    if(door_timer == 1)
     door<= 0;
     if(reset)
     begin
     flag=0;
     c_floor<=0;
     idle<=0;
     door<=0;
     up<=1;
     down<=0;
     max_r<=0;
     min_r<=7;
     request<=0;
     emergency_stopped<=0;
     end
    else if (request == 0 && !reset)
    begin
     
      c_floor <= c_floor;
      emergency_stopped <= 0; 
    end
   
    else if (emergency_stop)
    begin
     
      idle <= 1;
      flag <=1;
      emergency_stopped <= 1; 
    end
    else if (emergency_stopped && emergency_stop)
    begin
      
      c_floor <= c_floor;
      door <= 0; 
    end
    
    else if (!emergency_stop && flag)
    begin
      
      emergency_stopped <= 0; 
      flag <=0;
    end
    else
    begin
    
      if (max_r <= 7)
      begin
        if (min_r < c_floor && down == 1)
        begin

          c_floor <= c_floor - 1;
          door <= 0;
          idle <= 0;
        end
        else if (max_r > c_floor && up == 1)
        begin
        
          c_floor <= c_floor + 1;
          door <= 0;
          idle <= 0;
        end
        else if (req_floor == c_floor)
        begin

            door <= 1;
            idle <= 1;
        end
        else if (max_r == c_floor)
        begin
          up <= 0;
          down <= 1;
        end
        else if (min_r == c_floor)
        begin
          up <= 1;
          down <= 0;
        end
      end
    end
  end
endmodule

