module sub32(S,A,B);
	input [31:0] A,B;
	output [31:0] S;
	sub_32 SUB(S,A,B,1'b1);
endmodule 