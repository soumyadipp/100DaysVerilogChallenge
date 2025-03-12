
`timescale 1ns/1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SOUMYADIP MANNA
// 
// Create Date: 12.03.2025 23:42:04
// Design Name: AMBA_APB_PROTOCOL
// Module Name: Slave1
// Project Name: 
// Target Devices: 
// Tool Versions: s
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module Slave1#(parameter DATA_WIDTH = 32,ADDR_WIDTH=8)(
         input PCLK,PRESETn,
         input PSEL,PENABLE,PWRITE,
         input [ADDR_WIDTH-1:0] PADDR,
         input [DATA_WIDTH-1:0]PWDATA,
         output [DATA_WIDTH-1:0]PRDATA,
         output reg PREADY );
    
     reg [ADDR_WIDTH-1:0]reg_addr;
     reg [DATA_WIDTH-1:0] mem [0:63];

    assign PRDATA1 =  mem[reg_addr];

    always @(*)
       begin
         if(!PRESETn)
              PREADY = 0;
          else
	  if(PSEL && !PENABLE && !PWRITE)
	     begin PREADY = 0; end
	         
	  else if(PSEL && PENABLE && !PWRITE)
	     begin  PREADY = 1;
                    reg_addr =  PADDR; 
	       end
          else if(PSEL && !PENABLE && PWRITE)
	     begin  PREADY = 0; end

	  else if(PSEL && PENABLE && PWRITE)
	     begin  PREADY = 1;
	            mem[PADDR] = PWDATA; end

           else PREADY = 0;
        end
    endmodule