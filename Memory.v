`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 08:32:53 PM
// Design Name: 
// Module Name: Memory
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


module Memory(
    input clk,
    input reset,
    input [31:0] addr,   // 32-bit address input
    output reg [31:0] data // 32-bit data output
    );

    reg [31:0] memory [0:127]; // 128 words of 32 bits

    initial begin
        memory[0] = 32'h002300AA;
        memory[1] = 32'h10654321;
        memory[2] = 32'h00100022;
        memory[3] = 32'h8C123456;
        memory[4] = 32'h8F123456;
        memory[5] = 32'hAD654321;
        memory[6] = 32'h13012345;
        memory[7] = 32'hAC654321;
        memory[8] = 32'h12012345;
        memory[9] = 32'h12012345;       
    end
    
    integer i;
    initial begin
        for (i = 10; i < 128; i = i + 1) begin
            memory[i] = 32'h00000000;
        end
    end
  
    always @(posedge clk or posedge reset)
        if (reset)   
                data <= 32'h00000000;
        else 
                data <= memory[addr[31:2]];
endmodule

