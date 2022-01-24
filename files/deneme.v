module deneme(y, op7, op6, op5, op4, op3, op2, op1, op0, s2, s1, s0);
input [31:0] op7, op6, op5, op4, op3, op2, op1, op0;
input s2,s1,s0;
output [31:0]y;

mux_8x1_32 	m8_32(y, op7, op6, op5, op4, op3, op2, op1, op0, s2,s1,s0);
				


endmodule
