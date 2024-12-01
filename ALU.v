`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 12:08:09 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] control,
    output reg [31:0] result,
    output reg zero
    );
    
    always @(*) begin
        case (control)
            3'b010: result = A + B;
            3'b110: result = A + ((~B) + 1);
            3'b000: result = A & B;
            3'b001: result = A | B;
            3'b111: result = (A < B) ? 1 : 0;
            default: result = 32'b0;
         endcase
            zero = (result == 0) ? 1 : 0;
    end
    
endmodule
