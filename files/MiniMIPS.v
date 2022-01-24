module MiniMIPS( result, clk, clk2);

wire [15:0] instruction;
output [31:0] result;
wire [31:0] read_data_1, read_data_2, write_data, imm_extended, data_2, res, read_mem, data_3, data_4, data_5,data_6,data_7,data_8;
input clk, clk2;
wire RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti;
wire [2:0] write_reg, alu_control;
wire Zero0, overflow, w1, w2, w3, not_zero;
wire [31:0] out;


program_counter pc(out, clk2, data_8);


instruction_memory instr_memory(instruction,out,clk);

add_1 add1(data_7, out);

adder32 adder_1(data_6, data_7, imm_extended);

mux_2x1_32 mux32_5(data_8, data_6, data_7, w3);

control_unit main_control_unit(RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti, instruction[15:12]);

mux_2x1_3 mux_rd(write_reg,instruction[5:3], instruction[8:6], RegDst);
mips_registers Registers(read_data_1, read_data_2, result, instruction[11:9], instruction[8:6], write_reg,RegWrite, clk);	//Registers initialized 


mux_2x1_2_ control_mux(alu_control, instruction[2], instruction[1], instruction[0], AluOp2, AluOp1,AluOp0, RegDst);

sign_extend_6to32 sign_extend_imm_32(instruction[5:0], imm_extended);

mux_2x1_32 mux_b (data_2, imm_extended, read_data_2, AluSrc);

alu32 Alu(alu_control[2], alu_control[1], alu_control[0], read_data_1, data_2, res, Zero0, overflow);

mips_memory memory(res, read_data_2, read_mem, MemWrite, MemRead, clk);

mux_2x1_32 mux32_3(data_3, read_mem, res, MemtoReg);

slt_extender slt_extenders(data_3, data_4);

mux_2x1_32 mux32_4(result, data_4, data_3, Slti);

and and1(w1, Zero0, Branch);
not not1(not_zero, Zero0);
and and2(w2, Bneq, not_zero);
or or1(w3, w1, w2);

//this module is a top-level entity
//all modules in this project that have to use just structural verilog (except register & data modules)
//MiniMIPS has to work correctly for 15 instruction.
//alu32 design has to stay same with assignment3

//Verilog coding guidelines 
//Guideline #1: When modeling sequential logic, use nonblocking assignments.
//Guideline #2: When modeling latches, use nonblocking assignments.
//Guideline #3: When modeling combinational logic with an always block, use blocking assignments.

endmodule