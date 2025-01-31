`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2025 00:28:46
// Design Name: 
// Module Name: onebit_comp
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2025 00:12:58
// Design Name: 
// Module Name: nbit_comp
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


module onebit_comp(input a,b,output reg Lesser,Equal,Greater);
always@(*) begin
        if(a<b)
            begin
                Lesser=1'b1;
                Equal=1'b0;
                Greater=1'b0;
            end
        else if (a>b)
            begin
                Lesser=1'b0;
                Equal=1'b0;    
                Greater=1'b1;
            end
        else
            begin
                Lesser=1'b0;
                Equal=1'b1;
                Greater=1'b0;
            end
    end

endmodule

