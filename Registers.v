`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 11:46:31 PM
// Design Name: 
// Module Name: Registers
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


module Registers(
    input clk,
    input reset,
    input RegWrite,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] writedata,
    output reg [31:0] A,
    output reg [31:0] B
    );
    
    reg [31:0] registers [31:0];
    
    always @(*) begin
        if (reset) begin
            A = 32'b0;
            B = 32'b0;
        end else begin
            A = registers[rs];
            B = registers[rt];
        end
    end
    
    always @ (posedge clk) begin
        if(RegWrite && rd != 5'b0)
            registers[rd] <= writedata;
    end
    
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
        registers[i] = 32'b0;
        end
    end
   
endmodule
