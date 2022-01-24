module mux_2x1_1(y, op1, op0, s);
input op1, op0, s;
output y;
wire w0, w1, w2;

and and1(w0, op1, s);
not not1(w1,s);
and and2(w2,w1,op0);
or or1(y,w0,w2);

endmodule
