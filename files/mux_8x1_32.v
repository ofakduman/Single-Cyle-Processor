module mux_8x1_32(y, op7, op6, op5, op4, op3, op2, op1, op0, s2, s1, s0);
input [31:0] op7, op6, op5, op4, op3, op2, op1, op0;
input s2,s1,s0;
output [31:0]y;

mux_8x1_1 	m8_0(y[0], op7[0], op6[0], op5[0], op4[0], op3[0], op2[0], op1[0], op0[0], s2,s1,s0),
				m8_1(y[1], op7[1], op6[1], op5[1], op4[1], op3[1], op2[1], op1[1], op0[1], s2,s1,s0),
				m8_2(y[2], op7[2], op6[2], op5[2], op4[2], op3[2], op2[2], op1[2], op0[2], s2,s1,s0),
				m8_3(y[3], op7[3], op6[3], op5[3], op4[3], op3[3], op2[3], op1[3], op0[3], s2,s1,s0),
				m8_4(y[4], op7[4], op6[4], op5[4], op4[4], op3[4], op2[4], op1[4], op0[4], s2,s1,s0),
				m8_5(y[5], op7[5], op6[5], op5[5], op4[5], op3[5], op2[5], op1[5], op0[5], s2,s1,s0),
				m8_6(y[6], op7[6], op6[6], op5[6], op4[6], op3[6], op2[6], op1[6], op0[6], s2,s1,s0),
				m8_7(y[7], op7[7], op6[7], op5[7], op4[7], op3[7], op2[7], op1[7], op0[7], s2,s1,s0),
				m8_8(y[8], op7[8], op6[8], op5[8], op4[8], op3[8], op2[8], op1[8], op0[8], s2,s1,s0),
				m8_9(y[9], op7[9], op6[9], op5[9], op4[9], op3[9], op2[9], op1[9], op0[9], s2,s1,s0),
				m8_10(y[10], op7[10], op6[10], op5[10], op4[10], op3[10], op2[10], op1[10], op0[10], s2,s1,s0),
				m8_11(y[11], op7[11], op6[11], op5[11], op4[11], op3[11], op2[11], op1[11], op0[11], s2,s1,s0),
				m8_12(y[12], op7[12], op6[12], op5[12], op4[12], op3[12], op2[12], op1[12], op0[12], s2,s1,s0),
				m8_13(y[13], op7[13], op6[13], op5[13], op4[13], op3[13], op2[13], op1[13], op0[13], s2,s1,s0),
				m8_14(y[14], op7[14], op6[14], op5[14], op4[14], op3[14], op2[14], op1[14], op0[14], s2,s1,s0),
				m8_15(y[15], op7[15], op6[15], op5[15], op4[15], op3[15], op2[15], op1[15], op0[15], s2,s1,s0),
				m8_16(y[16], op7[16], op6[16], op5[16], op4[16], op3[16], op2[16], op1[16], op0[16], s2,s1,s0),
				m8_17(y[17], op7[17], op6[17], op5[17], op4[17], op3[17], op2[17], op1[17], op0[17], s2,s1,s0),
				m8_18(y[18], op7[18], op6[18], op5[18], op4[18], op3[18], op2[18], op1[18], op0[18], s2,s1,s0),
				m8_19(y[19], op7[19], op6[19], op5[19], op4[19], op3[19], op2[19], op1[19], op0[19], s2,s1,s0),
				m8_20(y[20], op7[20], op6[20], op5[20], op4[20], op3[20], op2[20], op1[20], op0[20], s2,s1,s0),
				m8_21(y[21], op7[21], op6[21], op5[21], op4[21], op3[21], op2[21], op1[21], op0[21], s2,s1,s0),
				m8_22(y[22], op7[22], op6[22], op5[22], op4[22], op3[22], op2[22], op1[22], op0[22], s2,s1,s0),
				m8_23(y[23], op7[23], op6[23], op5[23], op4[23], op3[23], op2[23], op1[23], op0[23], s2,s1,s0),
				m8_24(y[24], op7[24], op6[24], op5[24], op4[24], op3[24], op2[24], op1[24], op0[24], s2,s1,s0),
				m8_25(y[25], op7[25], op6[25], op5[25], op4[25], op3[25], op2[25], op1[25], op0[25], s2,s1,s0),
				m8_26(y[26], op7[26], op6[26], op5[26], op4[26], op3[26], op2[26], op1[26], op0[26], s2,s1,s0),
				m8_27(y[27], op7[27], op6[27], op5[27], op4[27], op3[27], op2[27], op1[27], op0[27], s2,s1,s0),
				m8_28(y[28], op7[28], op6[28], op5[28], op4[28], op3[28], op2[28], op1[28], op0[28], s2,s1,s0),
				m8_29(y[29], op7[29], op6[29], op5[29], op4[29], op3[29], op2[29], op1[29], op0[29], s2,s1,s0),
				m8_30(y[30], op7[30], op6[30], op5[30], op4[30], op3[30], op2[30], op1[30], op0[30], s2,s1,s0),
				m8_31(y[31], op7[31], op6[31], op5[31], op4[31], op3[31], op2[31], op1[31], op0[31], s2,s1,s0);


endmodule