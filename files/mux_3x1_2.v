module mux_3x1_2(y, op1_2, op1_1, op1_0, op0_2,op0_1,op0_0, s);
input op1_2, op1_1, op1_0, op0_2,op0_1,op0_0;
input s;
output [2:0]y;

mux_2x1_1 	m0(y[0],op1_0, op0_0,s),
				m1(y[1],op1_1, op0_1,s),
				m2(y[2],op1_2, op0_2,s);

endmodule
