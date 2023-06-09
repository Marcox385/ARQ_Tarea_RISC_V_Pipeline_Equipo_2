/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
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

module RISC_V_Pipeline
#(
	parameter PROGRAM_MEMORY_DEPTH = 64,
	parameter DATA_MEMORY_DEPTH = 128
)

(
	// Inputs
	input clk,
	input reset

);
//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/

/**Control**/
wire alu_src_w;
wire reg_write_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire [2:0] alu_op_w;

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] inmmediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;

/* Pipeline wires/helpers */
wire [31:0] ifid_instruction;
wire [21:0] ifid_pc_plus_4;

wire [31:0] idie_imm;
wire [31:0] idie_read_data_1;
wire [31:0] idie_read_data_2;
wire [31:0] idie_mux_helper;
wire [4:0] idie_write_register;
wire [3:0] idie_alu_operation;
wire idie_write;

wire [31:0] iema_alu_result;
wire [4:0] iema_write_register;
wire iema_write;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
CONTROL_UNIT
(
	/****/
	.OP_i(ifid_instruction[6:0]),
	/** outputus**/
	.ALU_Op_o(alu_op_w),
	.ALU_Src_o(alu_src_w),
	.Reg_Write_o(reg_write_w),
	.Mem_to_Reg_o(mem_to_reg_w),
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w)
);

PC_Register
PROGRAM_COUNTER
(
	.clk(clk),
	.reset(reset),
	.Next_PC(ifid_pc_plus_4),
	
	.PC_Value(pc_w)
);

Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);


Adder_32_Bits
PC_PLUS_4
(
	.Data0(pc_w),
	.Data1(4),
	
	.Result(pc_plus_4_w)
);


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/



Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(iema_write),
	.Write_Register_i(iema_write_register),
	.Read_Register_1_i(ifid_instruction[19:15]),
	.Read_Register_2_i(ifid_instruction[24:20]),
	.Write_Data_i(alu_result_w),
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)

);



Immediate_Unit
IMM_UNIT
(  .op_i(ifid_instruction[6:0]),
   .Instruction_bus_i(ifid_instruction),
   .Immediate_o(inmmediate_data_w)
);



Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(alu_src_w),
	.Mux_Data_0_i(idie_read_data_2),
	.Mux_Data_1_i(idie_imm),
	
	.Mux_Output_o(idie_mux_helper)

);


ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(ifid_instruction[30]),
	.ALU_Op_i(alu_op_w),
	.funct3_i(ifid_instruction[14:12]),
	.ALU_Operation_o(alu_operation_w)

);



ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(read_data_1_w),
	.B_i(read_data_2_or_imm_w),
	.ALU_Result_o(alu_result_w)
);


/* Pipeline units */
Fetch_Decode_Unit
IFID
(
	.clk(clk),
	.reset(reset),
	.instruction_in(instruction_bus_w),
	.pc_plus_4_in(pc_plus_4_w),
	
	.instruction_out(ifid_instruction),
	.pc_plus_4_out(ifid_pc_plus_4)
);

Decode_Execute_Unit
IDIE
(
	.clk(clk),
	.reset(reset),
	.immediate_in(inmmediate_data_w),
	.read_data_1(read_data_1_w),
	.read_data_2(read_data_2_w),
	.write_register_in(ifid_instruction[11:7]),
	.alu_operation_in(alu_operation_w),
	.write_in(reg_write_w),
	
	.immediate_out(idie_imm),
	.read_data_1_out(idie_read_data_1),
	.read_data_2_out(idie_read_data_2),
	.write_register_out(idie_write_register),
	.alu_operation_out(idie_alu_operation),
	.write_out(idie_write)
);

Execute_MemAccess_Unit
IEMA
(
	.clk(clk),
	.reset(reset),
	.alu_result_in(alu_result_w),
	.write_register_in(iema_write_register),
	.write_in(idie_write),
	
	.alu_result_out(iema_alu_result),
	.write_register_out(idie_write_register),
	.write_out(iema_write)
);


endmodule

