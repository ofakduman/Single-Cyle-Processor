module mux_2x1_3(y, op1, op0, s);
input [2:0]op1, op0;
input s;
output [2:0]y;

mux_2x1_1 	m0(y[0],op1[0], op0[0],s),
				m1(y[1],op1[1], op0[1],s),
				m2(y[2],op1[2], op0[2],s);

endmodule
