/******************************************************************
* Description
*	Pipeline Instruction Decode -> Instruction Execute
*	1.0
* Author(s):
*	IS727550 - Diaz Aguayo; IS727272 - Cordero Hernandez
******************************************************************/

module Decode_Execute_Unit
(
	input clk,
	input reset,
	input [31:0] immediate_in,
	input [31:0] read_data_1,
	input [31:0] read_data_2,
	input [4:0] write_register_in,
	input [3:0] alu_operation_in,
	input write_in,

	output reg [31:0] immediate_out,
	output reg [31:0] read_data_1_out,
	output reg [31:0] read_data_2_out,
	output reg [4:0] write_register_out,
	output reg [3:0] alu_operation_out,
	output reg write_out
);

always @(negedge reset or posedge clk)
begin
	immediate_out <= (reset != 0) ? immediate_in : 0;
	read_data_1_out <= (reset != 0) ? read_data_1 : 0;
	read_data_2_out <= (reset != 0) ? read_data_2 : 0;
	write_register_out <= (reset != 0) ? write_out : 0;
	alu_operation_out <= (reset != 0) ? alu_operation_in : 0;
	write_out <= (reset != 0) ? write_in : 0;
end

endmodule
