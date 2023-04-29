onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_Pipeline_TB/clk_tb
add wave -noupdate /RISC_V_Pipeline_TB/reset_tb
add wave -noupdate -group ALU /RISC_V_Pipeline_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate -group ALU /RISC_V_Pipeline_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -group ALU /RISC_V_Pipeline_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -group ALU /RISC_V_Pipeline_TB/DUV/ALU_UNIT/Zero_o
add wave -noupdate -group ALU -radix decimal /RISC_V_Pipeline_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/OP_i
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/Branch_o
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/Mem_Read_o
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/Mem_to_Reg_o
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/Mem_Write_o
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/ALU_Src_o
add wave -noupdate -group {CONTROL UNIT} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/Reg_Write_o
add wave -noupdate -group {ALU CONTROL} /RISC_V_Pipeline_TB/DUV/CONTROL_UNIT/ALU_Op_o
add wave -noupdate -group {ALU CONTROL} /RISC_V_Pipeline_TB/DUV/ALU_CONTROL_UNIT/funct7_i
add wave -noupdate -group {ALU CONTROL} /RISC_V_Pipeline_TB/DUV/ALU_CONTROL_UNIT/ALU_Op_i
add wave -noupdate -group {ALU CONTROL} /RISC_V_Pipeline_TB/DUV/ALU_CONTROL_UNIT/funct3_i
add wave -noupdate -group {ALU CONTROL} /RISC_V_Pipeline_TB/DUV/ALU_CONTROL_UNIT/ALU_Operation_o
add wave -noupdate -group {PROGRAM MEMORY} -radix unsigned /RISC_V_Pipeline_TB/DUV/PROGRAM_MEMORY/Address_i
add wave -noupdate -group {PROGRAM MEMORY} -radix hexadecimal /RISC_V_Pipeline_TB/DUV/PROGRAM_MEMORY/Instruction_o
add wave -noupdate -group {REGISTER FILE} /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/clk
add wave -noupdate -group {REGISTER FILE} /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/reset
add wave -noupdate -group {REGISTER FILE} /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Reg_Write_i
add wave -noupdate -group {REGISTER FILE} /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Write_Register_i
add wave -noupdate -group {REGISTER FILE} /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Read_Register_1_i
add wave -noupdate -group {REGISTER FILE} /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Read_Register_2_i
add wave -noupdate -group {REGISTER FILE} -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Write_Data_i
add wave -noupdate -group {REGISTER FILE} -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Read_Data_1_o
add wave -noupdate -group {REGISTER FILE} -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Read_Data_2_o
add wave -noupdate -group s0 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s0_fp/DataInput
add wave -noupdate -group s0 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s0_fp/DataOutput
add wave -noupdate -group s1 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s1/DataInput
add wave -noupdate -group s1 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s1/DataOutput
add wave -noupdate -group s2 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s2/DataInput
add wave -noupdate -group s2 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s2/DataOutput
add wave -noupdate -group s3 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s3/DataInput
add wave -noupdate -group s3 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_s3/DataOutput
add wave -noupdate -group zero /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_zero/DataInput
add wave -noupdate -group zero /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_zero/DataOutput
add wave -noupdate -group t0 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_t0/DataInput
add wave -noupdate -group t0 /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_t0/DataOutput
add wave -noupdate -group t1 -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataInput
add wave -noupdate -group t1 -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataOutput
add wave -noupdate -group t2 -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput
add wave -noupdate -group t2 -radix unsigned /RISC_V_Pipeline_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataOutput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {75 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 160
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {66 ps} {102 ps}
