/******************************************************************
* Description
*	Pipeline Instruction Fetch -> Instruction Decode Unit
*	1.0
* Author(s):
*	IS727550 - Diaz Aguayo; IS727272 - Cordero Hernandez
******************************************************************/

module Execute_MemAccess_Unit
(
	input clk,
	input reset,
	input [31:0] alu_result_in,
	input [4:0] write_register_in,
	input write_in,

	output reg [31:0] alu_result_out,
	output reg [4:0] write_register_out,
	output reg write_out
);

always @(negedge reset or posedge clk)
begin
	alu_result_out <= (reset != 0) ? alu_result_in : 0;
	write_register_out <= (reset != 0) ? write_register_in : 0;
	write_out <= (reset != 0) ? write_in : 0;
end

endmodule
