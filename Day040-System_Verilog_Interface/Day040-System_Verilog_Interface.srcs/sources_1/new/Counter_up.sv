`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 23:08:50
// Design Name: 
// Module Name: Counter_up
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


module Counter_ud#(parameter Width=4)(
                                    input clk,
                                    input rstn,
                                    input wire[Width-1:0] load,
                                    input load_en,
                                    input down,
                                    output reg[Width-1:0] Count,
                                    output rollover
                                  

                                      );
                                      
  always @(posedge clk or negedge rstn) begin
         if(!rstn)
           Count<=0;
         else
         begin
           if(load_en)
            Count<=load;
         else 
           begin
            if(down)
              Count<=Count-1;
            else 
              Count<=Count+1;
              
            end
         end
  end                                   
 assign rollover = &Count;                                    
endmodule
