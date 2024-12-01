`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 07:46:59 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input reset,
    input [31:0] npc,
    output reg [31:0] pc
    );
    
    always @(posedge clk or posedge reset)
        begin 
            if (reset) 
                begin
                    pc <= 32'b0;
                end
            else
                begin
                    pc <= npc;
                end
        end 
endmodule
