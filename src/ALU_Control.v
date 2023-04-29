/******************************************************************
* Description
*	This is the control unit for the ALU. It receves a signal called 
*	ALUOp from the control unit and signals called funct7 and funct3  from
*	the instruction bus.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
*
* Modified by:
*	IS727550 - Diaz Aguayo; IS727272 - Cordero Hernandez
******************************************************************/

module ALU_Control
(
	input funct7_i, 
	input [2:0] ALU_Op_i,
	input [2:0] funct3_i,
	

	output [3:0] ALU_Operation_o
);


localparam R_Type_ADD 		= 7'b0_000_000; // Funct7: 0, Control: R_Type[2:0], Funct3: 0 
localparam I_Type_ADDI 		= 7'bx_001_000; // Funct7: -, Control: I_Type[2:0], Funct3: 0
localparam U_Type_LUI		= 7'bx_010_xxx; // Funct7: -, Control: U_Type[2:0], Funct3: -
localparam I_Type_ORI		= 7'bx_001_110; // Funct7: -, Control: I_Type[2:0], Funct3: 6
localparam I_Type_SLLI		= 7'b0_001_001; // Funct7: 0, Control: I_Type[2:0], Funct3: 1
localparam I_Type_SRLI		= 7'b0_001_101; // Funct7: 0, Control: I_Type[2:0], Funct3: 5
localparam R_Type_SUB		= 7'b1_000_000; // Funct7: 2, Control: R_Type[2:0], Funct3: 0

reg [3:0] alu_control_values;
wire [6:0] selector;

assign selector = {funct7_i, ALU_Op_i, funct3_i};

/* Instrucciones a implementar
		add, addi		0 - 4'b0000
		sub				5 - 4'b0101
		and				?
		andi				?
		or					?
		ori				2 - 4'b0010
		xor				?
		xori				?
		lui				1 - 4'b0001
		srl				?
		srli				4 - 4'b1000
		sll				?
		slli				3 - 4'b0011
		lw					?
		sw					?
		beq				?
		bne				?
		blt				?
		bge				?
		jal				?
		jalr				?
*/

always@(selector)begin
	casex(selector)
		R_Type_ADD:			alu_control_values	=	4'b0000;
		I_Type_ADDI:		alu_control_values	=	4'b0000;
		U_Type_LUI:			alu_control_values	=	4'b0001;
		I_Type_ORI:			alu_control_values	=	4'b0010;
		I_Type_SLLI:		alu_control_values	=	4'b0011;
		I_Type_SRLI:		alu_control_values	=	4'b0100;
		R_Type_SUB:			alu_control_values	=	4'b0101;

		default: alu_control_values = 4'b00_00;
	endcase
end


assign ALU_Operation_o = alu_control_values;



endmodule
