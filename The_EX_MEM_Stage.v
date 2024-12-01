`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 11:04:11 PM
// Design Name: 
// Module Name: The_EX_MEM_Stage
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


module The_EX_MEM_Stage(
    input clk,
    input reset,
    input [1:0] ctlwb_in,
    input [2:0] ctlm_in,
    input [31:0] ID_EX1, ID_EX2, ID_EX3, ID_EX4,
    input [4:0] ID_EX5, ID_EX6,
    input ALUSrc, RegDst,
    input [1:0] ALUOp,
    output [1:0] ctl_wb_out, 
    output [2:0] ctl_mem_out,
    output [31:0] add_result_out,
    output zero_out,
    output [31:0] alu_result_out,  
    output [31:0] rdata2_out,  
    output [4:0] mux_5bit
    );
    
    wire [31:0] Add_out;
    
    Add Component1(
        .add_in1(ID_EX1),
        .add_in2(ID_EX4),
        .add_out(Add_out)
    );
    
    wire [31:0] mux_32bit_out;
    wire [2:0] ALU_Control_out;
    wire [31:0] ALU_out;
    wire zero;
    
    ALU Component2(
        .A(ID_EX2),
        .B(mux_32bit_out),
        .control(ALU_Control_out),
        .result(ALU_out),
        .zero(zero)
    );
        
    Mux_32bit Component3(
        .a(ID_EX3),
        .b(ID_EX4),
        .select(ALUSrc),
        .y(mux_32bit_out)
    );
    
    ALU_Control Component4(
        .funct(ID_EX4 [5:0]),
        .alu_op(ALUOp),
        .select(ALU_Control_out)
    );
    
    wire [4:0] mux_5bit_out;
    
    Mux_5bit Component5(
        .a(ID_EX5),
        .b(ID_EX6),
        .select(RegDst),
        .y(mux_5bit_out)
    );
    
    EX_MEM_pipeline_register Component6(
        .clk(clk),
        .reset(reset),
        .ctl_wb_in(ctlwb_in),
        .ctl_mem_in(ctlm_in),
        .add_result_in(Add_out),
        .alu_result_in(ALU_out),
        .zero_in(zero),
        .rdata2_in(ID_EX3),
        .mux_out_in(mux_5bit_out),
        .ctl_wb_out(ctl_wb_out),
        .ctl_mem_out(ctl_mem_out),
        .add_result_out(add_result_out),
        .alu_result_out(alu_result_out),
        .zero_out(zero_out),
        .rdata2_out(rdata2_out), 
        .mux_5bit_result(mux_5bit)
    );
    
endmodule

