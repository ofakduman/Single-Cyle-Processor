module mux_4x1_1(y, op3, op2, op1, op0, s1, s0);
input op3, op2, op1, op0, s1, s0;
output y;
wire w0, w1;

mux_2x1_1	m0(w0,op1,op0,s0),
				m1(w1,op3,op2,s0),
				m2(y,w1,w0,s1);

endmodule
