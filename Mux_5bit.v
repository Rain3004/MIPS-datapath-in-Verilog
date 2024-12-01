`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 11:37:13 AM
// Design Name: 
// Module Name: Mux_5bit
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


module Mux_5bit(
    input [4:0] a,
    input [4:0] b,
    input select,
    output [4:0] y
    );
    
    assign y = (select == 1) ? b : a ;
    
endmodule