`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SOUMYADIP MANNA.
// 
// Create Date: 20.03.2025 20:48:18
// Design Name: RICSV
// Module Name: pc
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


module pc(
         
         input wire clk,
         input wire rst,
         input wire load,
         input wire next_sel,
         input wire dmem_valid,
         input wire branch_result,
         input wire [31:0] next_address,
        
         
         output reg [31:0] address_out,
         output wire [31:0] pre_address_pc
         

    );
    
    reg [31:0] pre_address;
    
    always @(posedge clk) begin
       if(!rst) 
         begin
          address_out<= 0;
         end
       else if (next_sel | branch_result)  
        begin
          address_out<= next_address;
        end
       else if ((load && dmem_valid))
        begin
         address_out <= address_out;
        end
       else
        begin
         address_out <= address_out + 32'd4;
        end            
    pre_address<= address_out;
    end
    
    assign pre_address_pc = pre_address;
    
endmodule
