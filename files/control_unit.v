module control_unit(RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti, opcode);
	input [3:0]opcode;
	output RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti;
	wire RTYPE,ADDI, ANDI, ORI, NORI, BEQ, BNE, LW, SW, SLTI;
	wire op_not_4, op_not_3, op_not_2, op_not_1, op_not_0;
	
	not	not0(op_not_0, opcode[0]),
			not1(op_not_1, opcode[1]),
			not2(op_not_2, opcode[2]),
			not3(op_not_3, opcode[3]);
			
	and and_regdest	(RTYPE, op_not_3, op_not_2, op_not_1, op_not_0);

	and and_addi		(ADDI, op_not_3, op_not_2, op_not_1, opcode[0]);
	and andi				(ANDI, op_not_3, op_not_2, opcode[1], op_not_0);
	and and_ori			(ORI, op_not_3, op_not_2, opcode[1], opcode[0]);
	and and_nori		(NORI, op_not_3, opcode[2], op_not_1, op_not_0);
	and and_beq			(BEQ, op_not_3, opcode[2], op_not_1, opcode[0]);
	and and_bne			(BNE, op_not_3, opcode[2], opcode[1], op_not_0);
	and and_slti1		(SLTI, op_not_3, opcode[2], opcode[1], opcode[0]);
	and and_slti		(Slti, op_not_3, opcode[2], opcode[1], opcode[0]);
	and and_lw			(LW, opcode[3], op_not_2, op_not_1, op_not_0);
	and and_sw			(SW, opcode[3], op_not_2, op_not_1, opcode[0]);
	
	
	and and_RegDst		(RegDst, op_not_3, op_not_2, op_not_1, op_not_0);
	and and_Branch		(Branch, op_not_3, opcode[2], op_not_1, opcode[0]);
	and and_MemRead	(MemRead, opcode[3], op_not_2, op_not_1, op_not_0);
	and and_MemtoReg	(MemtoReg, opcode[3], op_not_2, op_not_1, op_not_0);
	and and_Bneq		(Bneq, op_not_3, opcode[2], opcode[1], op_not_0);
	and and_MemWrite	(MemWrite, opcode[3], op_not_2, op_not_1, opcode[0]);
	or or_AluSrc		(AluSrc, ADDI, ANDI, ORI, NORI, LW, SW, SLTI);
	or or_RegWrite		(RegWrite,RTYPE, ADDI, ANDI, ORI, NORI, LW, SLTI);
	or or_AluOp2		(AluOp2, ORI, NORI);
	or or_AluOp1		(AluOp1, BEQ, BNE, SLTI);
	or or_AluOp0		(AluOp0, ADDI ,ORI, LW, SW);
	

endmodule 