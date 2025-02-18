`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2025 21:01:45
// Design Name: 
// Module Name: TrafficLightController
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


`define G2Ydelay 3
`define Y2Rdelay 2

module TrafficLightControl(input clk,clr,Sensor,
                           output reg[1:0]Small_Road,Highway);
                           
             parameter reg[1:0] red=2'b10,
                              green=2'b00,
                             yellow=2'b01;
                             
             parameter reg[2:0] S0=3'b000,
                                S1=3'b001,
                                S2=3'b010,
                                S3=3'b011,
                                S4=3'b100;
                                
                                
        reg[2:0] CS,NS;  
        
        always @(posedge clk)
         if(clr)
           CS<=S0;
         else 
           CS<=NS;                      
       
      always@(CS or Sensor) begin
		case(CS)
		S0: if(Sensor)
				NS= S1;
			 else
				NS= S0;
		S1: begin
				repeat (`G2Ydelay) NS= S1;
				NS= S2;
			 end
		S2: begin
				repeat (`Y2Rdelay) NS= S2;
				NS= S3;
			 end
		S3: begin
				if(Sensor)
					NS= S3;
				else
					NS= S4;
			 end
		S4: begin
				repeat (`G2Ydelay) NS= S4;
				NS= S0;
			 end
		default: NS= S0;
		endcase
	end
                        
   always@(CS) begin
		Highway= green;
		Small_Road= red;
            
            case(CS)
                S0:;
                S1: Highway= yellow;
                S2: Highway= red;
                S3: begin
                        Highway= red;
                        Small_Road= green;
                     end
                S4: begin
                        Highway= red;
                        Small_Road= yellow;
                     end
            endcase
          end                   

endmodule
