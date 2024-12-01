`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 09:38:04 PM
// Design Name: 
// Module Name: Mux_32bit
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


module Mux_32bit(
    input [31:0] a,
    input [31:0] b,
    input select,
    output [31:0] y
    );

    assign y = (select) ? b : a ;
    
endmodule

