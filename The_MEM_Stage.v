`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 10:33:47 PM
// Design Name: 
// Module Name: The_MEM_Stage
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


module The_MEM_Stage(
    input clk,
    input reset,
    input [1:0] mem_wb,
    input mem_branch,
    input mem_zero,
    input [31:0] mem_Address,
    input [31:0] mem_Write_data,
    input MemWrite,
    input MemRead,
    input [4:0] write_reg,
    output MEM_PCSrc,
    output [1:0] mem_control_wb,
    output [31:0] mem_Read_data,
    output [31:0] mem_ALU_result,
    output [4:0] mem_Write_reg
    );
    
    AND_Gate Component1(
        .zero(mem_zero),
        .branch(mem_branch),
        .PCSrc(MEM_PCSrc)
    );
    
    wire [31:0] data_memory_out;
    
    Data_Memory Component2(
        .clk(clk),
        .Address(mem_Address),
        .Write_data(mem_Write_data),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Read_data(data_memory_out)
    );
    
    The_MEM_WB_pipeline_register Component3(
        .clk(clk),
        .reset(reset),
        .control_wb_in(mem_wb),
        .Read_data_in(data_memory_out),
        .ALU_result_in(mem_Address),
        .Write_reg_in(write_reg),
        .mem_control_wb(mem_control_wb),
        .Read_data(mem_Read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_Write_reg(mem_Write_reg)
    );
    
endmodule