`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 10:33:17 PM
// Design Name: 
// Module Name: The_MEM_WB_pipeline_register
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


module The_MEM_WB_pipeline_register(
    input clk,
    input reset,
    input [1:0] control_wb_in,
    input [31:0] Read_data_in,
    input [31:0] ALU_result_in,
    input [4:0] Write_reg_in,
    output reg [1:0] mem_control_wb,
    output reg [31:0] Read_data,
    output reg [31:0] mem_ALU_result,
    output reg [4:0] mem_Write_reg
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            mem_control_wb <= 2'b0;
            Read_data <= 32'b0;
            mem_ALU_result <= 32'b0;
            mem_Write_reg <= 5'b0;
        end else begin
            mem_control_wb <= control_wb_in;
            Read_data <= Read_data_in;
            mem_ALU_result <= ALU_result_in;
            mem_Write_reg <= Write_reg_in;
        end
    end

endmodule
