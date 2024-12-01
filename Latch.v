`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 08:32:11 PM
// Design Name: 
// Module Name: Latch
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


module Latch(
    input clk,        
    input reset,      
    input [31:0] npc,        
    input [31:0] instr,     
    output reg [31:0] npcout,
    output reg [31:0] instrout   
    );
    
    initial begin
        instrout <= 0;
        npcout <= 0;
    end
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            npcout  <= 32'b0;     // Reset npcout to zero
            instrout <= 32'b0;    // Reset instrout to zero
        end else begin
            npcout  <= npc;       // Latch the next program counter
            instrout <= instr;    // Latch the instruction
        end
    end

endmodule

