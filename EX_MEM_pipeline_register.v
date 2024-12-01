`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 12:09:47 PM
// Design Name: 
// Module Name: EX_MEM_pipeline_register
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


module EX_MEM_pipeline_register(
    input clk,
    input reset,
    input [31:0] add_result_in, 
    input [31:0] alu_result_in, 
    input [31:0] rdata2_in,
    input zero_in,
    input [4:0] mux_out_in,
    input [1:0] ctl_wb_in, 
    input [2:0] ctl_mem_in,
    output reg [1:0] ctl_wb_out, 
    output reg [2:0] ctl_mem_out,
    output reg [31:0] add_result_out,
    output reg zero_out,
    output reg [31:0] alu_result_out,  
    output reg [31:0] rdata2_out,  
    output reg [4:0] mux_5bit_result
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ctl_wb_out <= 2'b0;
            ctl_mem_out <= 3'b0;
            add_result_out <= 32'b0;
            alu_result_out <= 32'b0;
            zero_out <= 1'b0;
            rdata2_out <= 32'b0;
            mux_5bit_result <= 5'b0;
        end else begin
            add_result_out <= add_result_in;
            alu_result_out <= alu_result_in;
            rdata2_out <= rdata2_in;
            zero_out <= zero_in;
            mux_5bit_result <= mux_out_in;
            ctl_wb_out <= ctl_wb_in;
            ctl_mem_out <= ctl_mem_in;
        end
    end
    
endmodule
