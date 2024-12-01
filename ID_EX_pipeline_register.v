`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 11:54:50 PM
// Design Name: 
// Module Name: ID_EX_pipeline_register
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


module ID_EX_pipeline_register(
    input clk,
    input reset,
    input [1:0] ctlwb_out,     // Write-back control signals
    input [2:0] ctlm_out,      // Memory control signals
    input [3:0] ctlex_out,     // Execute control signals
    // Data signals
    input [31:0] npc,          // Next program counter
    input [31:0] readdat1,     // Data read from register 1
    input [31:0] readdat2,     // Data read from register 2
    input [31:0] signext_out,  // Sign-extended immediate value
    input [4:0] instr_2016,    // Instruction bits [20:16]
    input [4:0] instr_1511,    // Instruction bits [15:11]
    // Outputs
    output reg [1:0] wb_ctlout,    // Write-back control signals (output)
    output reg [2:0] m_ctlout,     // Memory control signals (output)
    output reg [3:0] ex_ctlout,    // Execute control signals (output)
    output reg [31:0] npcout,      // Next program counter (output)
    output reg [31:0] rdata1out,   // Data read from register 1 (output)
    output reg [31:0] rdata2out,   // Data read from register 2 (output)
    output reg [31:0] s_extendout, // Sign-extended immediate value (output)
    output reg [4:0] instrout_2016,// Instruction bits [20:16] (output)
    output reg [4:0] instrout_1511 // Instruction bits [15:11] (output)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all outputs to 0
            wb_ctlout     <= 2'b0;
            m_ctlout      <= 3'b0;
            ex_ctlout     <= 4'b0;
            npcout        <= 32'h00000000;
            rdata1out     <= 32'h00000000;
            rdata2out     <= 32'h00000000;
            s_extendout   <= 32'h00000000;
            instrout_2016 <= 5'b0;
            instrout_1511 <= 5'b0;
        end else begin 
            // Latch the inputs on the rising edge of the clock
            wb_ctlout     <= ctlwb_out;
            m_ctlout      <= ctlm_out;
            ex_ctlout     <= ctlex_out;
            npcout        <= npc;
            rdata1out     <= readdat1;
            rdata2out     <= readdat2;
            s_extendout   <= signext_out;
            instrout_2016 <= instr_2016;
            instrout_1511 <= instr_1511;
        end
    end
        
endmodule

