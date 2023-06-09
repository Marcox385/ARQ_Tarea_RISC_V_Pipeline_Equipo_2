/******************************************************************
* Description
*	Pipeline Instruction Fetch -> Instruction Decode Unit
*	1.0
* Author(s):
*	IS727550 - Diaz Aguayo; IS727272 - Cordero Hernandez
******************************************************************/

module Fetch_Decode_Unit
(
	input clk,
	input reset,
	input [31:0] instruction_in,
	input [31:0] pc_plus_4_in,
	
	output reg [31:0] instruction_out,
	output reg [31:0] pc_plus_4_out
);

always @(negedge reset or posedge clk)
begin
	instruction_out <= (reset != 0) ? instruction_in : 0;
	pc_plus_4_out <= (reset != 0) ? ? pc_plus_4_inpc_plus_4_in : 0;
end

endmodule
