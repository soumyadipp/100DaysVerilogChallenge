`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 00:08:55
// Design Name: 
// Module Name: APB_PROTOCOL
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


module APB_PROTOCOL#(parameter DATA_WIDTH = 32,ADDR_WIDTH=8)(
         input PCLK,PRESETn,transfer,Read_Write,
         input [ADDR_WIDTH-1:0]  Apb_WRITE_PADDR,
		 input [DATA_WIDTH-1:0]  Apb_WRITE_DATA,
		 input [ADDR_WIDTH-1:0]  Apb_READ_PADDR,
		 output [DATA_WIDTH-1:0] Apb_READ_DATA
          );

       wire [31:0]PWDATA,PRDATA;
       wire [7:0]PADDR;

       wire PREADY,PENABLE,PSEL1,PWRITE;
    
  

   APB_Master DUT (
 .PCLK(PCLK), // (Source:- Clk) Clock,PCLK is a clock signal. All APB signals are timed against the rising edge of PCLK. 
 .PRESETn(PRESETn), // (Source:- System Bus Reset) Reset.PRESETn is the reset signal and is active-LOW.PRESETn is normally connected directly to the system bus reset signal.
 .PREADY(PREADY),//(Source:- Completer)Ready. PREADY is used to extend an APB transfer by the Completer.
 .PRDATA(PRADTA), // (Source:- Commpleter) Read data.The PRDATA read data bus is driven by the selected Completer during read cycles when PWRITE is LOW. PRDATA can be 8, 16, or 32 bits wide
 .transfer(transfer),// Dummy Signal for transfer request[IN Reality From Requester/AHB BUS]
 .Read_Write(Read_Write), //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 .Apb_READ_PADDR(Apb_READ_PADDR), //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 .Apb_WRITE_PADDR(Apb_WRITE_PADDR),//Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 .Apb_WRITE_DATA(Apb_WRITE_DATA), //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 .PENABLE(PENABLE), // (Source:- Requester) Enable.PENABLE indicates the second and subsequent cycles of an APB transfer.
 .PWRITE(PWRITE), // (Source:- Requester) Direction.PWRITE indicates an APB write access when HIGH and an APB read access when LOW.
 .PSELx(PSEL1),  // (Source:- Requester) Select.The Requester generates a PSELx signal for each Completer. PSELx indicates that the Completer is selected and that a data transfer is required.
 .PWDATA(PWDATA), // (Source:- Requester) Write data. The PWDATA write data bus is driven by the APB bridge Requester during write cycles when PWRITE is HIGH. PWDATA can be 8, 16, or 32 bits wide.
 .Apb_READ_DATA(Apb_READ_DATA), //Dummy Signal for Check [IN Reality From Requester/AHB BUS]
 .PADDR(PADDR) // (Source:- Requester) Address.PADDR is the APB address bus. PADDR can be up to 32 bits wide. 
    );


        Slave1 UUT1(
         .PCLK(PCLK),
         .PRESETn(PRESETn),
         .PSELx(PSEL1),
         .PENABLE(PENABLE),
         .PWRITE(PWRITE),
         .PADDR(PADDR),
         .PWDATA(PWDATA),
         .PRDATA(PRDATA),
         .PREADY(PREADY) 
         );


endmodule