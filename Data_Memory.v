`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 10:32:16 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory(
    input clk,
    input [31:0] Address,
    input [31:0] Write_data,
    input MemWrite,
    input MemRead,
    output reg [31:0] Read_data
    );

    // Memory array (size can be adjusted as needed)
    reg [31:0] memory [255:0]; // 256 32-bit words

    // Read Operation
    always @(*) begin
        if (MemRead) begin
            Read_data <= memory[Address[7:0]]; // Address indexing (8 bits for 256 locations)
        end else begin
            Read_data <= 32'b0; // Default value when MemRead is disabled
        end
    end

    // Write Operation
    always @(posedge clk) begin
        if (MemWrite) begin
            memory[Address[7:0]] <= Write_data;
        end
    end

endmodule
