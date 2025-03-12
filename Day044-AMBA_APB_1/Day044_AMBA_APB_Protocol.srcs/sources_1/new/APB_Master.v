`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SOUMYADIP MANNA
// 
// Create Date: 12.03.2025 22:32:44
// Design Name: AMBA_APB_PROTOCOL
// Module Name: APB_Master
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


module APB_Master#(parameter DATA_WIDTH = 32,ADDR_WIDTH=8)(
 input PCLK, // (Source:- Clk) Clock,PCLK is a clock signal. All APB signals are timed against the rising edge of PCLK. 
 input PRESETn, // (Source:- System Bus Reset) Reset.PRESETn is the reset signal and is active-LOW.PRESETn is normally connected directly to the system bus reset signal.
 input PREADY,//(Source:- Completer)Ready. PREADY is used to extend an APB transfer by the Completer.
 input [DATA_WIDTH-1:0] PRDATA, // (Source:- Commpleter) Read data.The PRDATA read data bus is driven by the selected Completer during read cycles when PWRITE is LOW. PRDATA can be 8, 16, or 32 bits wide
 input transfer,// Dummy Signal for transfer request[IN Reality From Requester/AHB BUS]
 input Read_Write, //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 input [ADDR_WIDTH:0] Apb_READ_PADDR, //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 input [ADDR_WIDTH:0] Apb_WRITE_PADDR,//Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 input [DATA_WIDTH-1:0] Apb_WRITE_DATA, //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 output reg PENABLE, // (Source:- Requester) Enable.PENABLE indicates the second and subsequent cycles of an APB transfer.
 output  PWRITE, // (Source:- Requester) Direction.PWRITE indicates an APB write access when HIGH and an APB read access when LOW.
 output reg PSEL1,PSEL2,  // (Source:- Requester) Select.The Requester generates a PSELx signal for each Completer. PSELx indicates that the Completer is selected and that a data transfer is required.
 output reg [DATA_WIDTH-1:0] PWDATA, // (Source:- Requester) Write data. The PWDATA write data bus is driven by the APB bridge Requester during write cycles when PWRITE is HIGH. PWDATA can be 8, 16, or 32 bits wide.
 output reg [DATA_WIDTH-1:0] Apb_READ_DATA, //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 output reg [ADDR_WIDTH:0] PADDR // (Source:- Requester) Address.PADDR is the APB address bus. PADDR can be up to 32 bits wide. 
    );
    
    
 reg[2:0]  CS,NS;
 localparam IDLE=3'b001,SETUP=3'b010, ACCESS=3'b100;
 
 always@(posedge PCLK)
     begin
           if(!PRESETn)
            CS<=IDLE;
           else CS<=NS;
      end
  always@(CS,PREADY)begin
  if(!PRESETn)
    NS<=IDLE;
  else 
     begin
   
            case(CS) 
             IDLE: begin
                      PENABLE=0;
                      PSEL1<=0;
                      PSEL2<=0;
                      if(!transfer)
                       NS<=IDLE;
                      else 
                      NS<= SETUP;
                      
                   end    
                      
             SETUP:    begin
                           PENABLE=0;  
                        if(Read_Write)
                           PADDR=  Apb_READ_PADDR; // READ
                           else 
                              begin
                                PADDR= Apb_WRITE_PADDR; // WRITE
                                PWDATA=Apb_WRITE_DATA;
                              end
                   if(transfer)
                    NS<=ACCESS;
                   else
                    NS<= IDLE;
                    PSEL1<=PADDR[ADDR_WIDTH];
                    PSEL2<=~PSEL1;
                    end
             ACCESS:      begin if(PSEL1 || PSEL2)
		           PENABLE =1;
			   if(transfer)
			   begin
				   if(PREADY)
				   begin
					if(!Read_Write)
				        
				      NS = SETUP;
				      
					else 
					   begin
					   NS = SETUP; 
				       Apb_READ_DATA = PRDATA; 
					   end
			            end
				    else
				     NS<=ACCESS;
		              end
		             else 
		             NS <= IDLE;
			 end       
                    
                    
            endcase
            
     
     end
 end
  assign     PWRITE = ~ Read_Write;
 
endmodule
