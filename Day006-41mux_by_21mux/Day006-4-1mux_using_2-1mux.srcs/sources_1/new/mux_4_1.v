`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2025 00:30:03
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1(input [3:0]ip,input [1:0] select,output op

    );
wire [1:0]w;   
mux_2_1 m1(.sel(select[0]),.i(ip[1:0]),.y_out(w[0]));
mux_2_1 m2(.sel(select[0]),.i(ip[3:2]),.y_out(w[1]));
mux_2_1 m3(.sel(select[1]),.i(w),.y_out(op));
endmodule
