`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2024 11:02:07 AM
// Design Name: 
// Module Name: The_IF_Stage
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


module The_IF_Stage(
    input clk,                   // Clock signal
    input reset,                 // Reset signal
    input PCSrc,                   // MUX select signal
    input [31:0] MEM_Latch,  // Branch target address
    output [31:0] instrout,      // Fetched instruction output
    output [31:0] npcout         // Next Program Counter output
    );

    wire [31:0] PC;            
    wire [31:0] next_pc;             
    wire [31:0] selected_pc;     
    wire [31:0] instruction;    

    // Program Counter module
    Program_Counter pc_module (
        .clk(clk),
        .reset(reset),
        .npc(selected_pc),
        .pc(PC)
    );

    Incrementer inc_module (
        .in(PC),
        .out(next_pc)
    );

    // MUX module to select between incremented PC or branch target
    Mux_32bit mux_module (
        .a(next_pc),
        .b(MEM_Latch),
        .select(PCSrc),
        .y(selected_pc)
    );

    // Memory module to fetch instruction from memory
    Memory memory_module (
        .clk(clk),
        .reset(reset),
        .addr(PC),
        .data(instruction)
    );
    
    // Latch module to store fetched instruction and next PC
    Latch latch_module (
        .clk(clk),
        .reset(reset),
        .npc(next_pc),
        .instr(instruction),
        .npcout(npcout),
        .instrout(instrout)
    );

endmodule

