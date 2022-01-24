module mux_8x1_1(y, op7, op6, op5, op4, op3, op2, op1, op0, s2, s1, s0);
input op7, op6, op5, op4, op3, op2, op1, op0, s2, s1, s0;
output y;
wire w1, w0;

mux_4x1_1	m4_0(w0,op3,op2,op1,op0,s1,s0),
				m4_1(w1,op7,op6,op5,op4,s1,s0);
mux_2x1_1 m2_0(y,w1,w0,s2);

endmodule
