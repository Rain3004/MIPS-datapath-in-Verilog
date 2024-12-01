`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2024 12:07:50 AM
// Design Name: 
// Module Name: The_ID_Stage
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


module The_ID_Stage(
    input clk,
    input reset,
    input RegWrite,
    input [31:0] IR,
    input [31:0] npc,
    input [31:0] WriteData,
    input [4:0] WriteReg,
    output [1:0] wb_ctlout,    // Write-back control signals (output)
    output [2:0] m_ctlout,     // Memory control signals (output)
    output [3:0] ex_ctlout,    // Execute control signals (output)
    output [31:0] npcout,      // Next program counter (output)
    output [31:0] rdata1out,   // Data read from register 1 (output)
    output [31:0] rdata2out,   // Data read from register 2 (output)
    output [31:0] s_extendout, // Sign-extended immediate value (output)
    output [4:0] instrout_2016,// Instruction bits [20:16] (output)
    output [4:0] instrout_1511 // Instruction bits [15:11] (output)
    );
        
    wire [1:0] WB;
    wire [2:0] M;  
    wire [3:0] EX;
    
    
    Control Component1(
        .opcode(IR[31:26]),
        .WB(WB),
        .M(M),
        .EX(EX)
    );
    
    wire [31:0] A;
    wire [31:0] B;
    
    Registers Component2(
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite),
        .rs(IR[25:21]),
        .rt(IR[20:16]),
        .rd(WriteReg),
        .writedata(WriteData),
        .A(A),
        .B(B)
    );
    
    wire [31:0] signext_out;
    
    Sign_Extend Component3(
        .IR(IR[15:0]),
        .IR_output(signext_out)
    );
    
    ID_EX_pipeline_register Component4(
        .clk(clk),
        .reset(reset),
        .ctlwb_out(WB),
        .ctlm_out(M),
        .ctlex_out(EX),
        .npc(npc),
        .readdat1(A),
        .readdat2(B),
        .signext_out(signext_out),
        .instr_2016(IR[20:16]),
        .instr_1511(IR[15:11]),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .s_extendout(s_extendout),
        .instrout_2016(instrout_2016),
        .instrout_1511(instrout_1511)
    );
    
    
endmodule
