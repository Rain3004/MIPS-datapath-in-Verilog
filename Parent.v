`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 11:35:10 PM
// Design Name: 
// Module Name: Parent
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


module Parent(
    input clk,
    input reset,
    output [31:0] MUXOUT
    );
    
    wire [31:0] npc;
    wire [31:0] IR;
    
    The_IF_Stage stage1(
        .clk(clk),
        .reset(reset),
        .PCSrc(PCSrc),
        .MEM_Latch(add_result_out),
        .npcout(npc),
        .instrout(IR)
    );
    
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [3:0] ex_ctlout;
    wire [31:0] npcout;
    wire [31:0] rdata1out;
    wire [31:0] rdata2out;
    wire [31:0] s_extendout;
    wire [4:0] instrout_2016;
    wire [4:0] instrout_1511;
    
    The_ID_Stage stage2(
        .clk(clk),
        .reset(reset),
        .RegWrite(mem_control_wb[1]),
        .IR(IR),
        .npc(npc),
        .WriteData(MUXOUT),
        .WriteReg(mem_Write_reg),
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
    
    wire [1:0] ctl_wb_out;
    wire [2:0] ctl_mem_out;
    wire [31:0] add_result_out;
    wire zero_out;
    wire [31:0] alu_result_out;  
    wire [31:0] rdata2_out;
    wire [4:0] mux_5bit;
    
    The_EX_MEM_Stage stage3(
        .clk(clk),
        .reset(reset),
        .ctlwb_in(wb_ctlout),
        .ctlm_in(m_ctlout),
        .ID_EX1(npcout),
        .ID_EX2(rdata1out),
        .ID_EX3(rdata2out),
        .ID_EX4(s_extendout),
        .ID_EX5(instrout_2016),
        .ID_EX6(instrout_1511),
        .ALUSrc(ex_ctlout[0]),
        .RegDst(ex_ctlout[3]),
        .ALUOp(ex_ctlout[2:1]),
        .ctl_wb_out(ctl_wb_out),
        .ctl_mem_out(ctl_mem_out),
        .add_result_out(add_result_out),
        .zero_out(zero_out),
        .alu_result_out(alu_result_out),
        .rdata2_out(rdata2_out),
        .mux_5bit(mux_5bit)
    );
    
    wire PCSrc;
    wire [1:0] mem_control_wb;
    wire [31:0] mem_Read_data;
    wire [31:0] mem_ALU_result;
    wire [4:0] mem_Write_reg;
    
    The_MEM_Stage stage4(
        .clk(clk),
        .reset(reset),
        .mem_wb(ctl_wb_out),
        .mem_branch(ctl_mem_out[2]),
        .mem_zero(zero_out),
        .mem_Address(alu_result_out),
        .mem_Write_data(rdata2_out),
        .MemWrite(ctl_mem_out[0]),
        .MemRead(ctl_mem_out[1]),
        .write_reg(mux_5bit),
        .MEM_PCSrc(PCSrc),
        .mem_control_wb(mem_control_wb),
        .mem_Read_data(mem_Read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_Write_reg(mem_Write_reg)
    );
    
    Mux_32bit stage5(
        .a(mem_ALU_result),
        .b(mem_Read_data),
        .select(mem_control_wb[0]),
        .y(MUXOUT)
    );
    
endmodule
