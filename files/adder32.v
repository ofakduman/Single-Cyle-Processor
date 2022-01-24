module adder32 (S,A,B);
	input [31:0] A,B;
	output [31:0] S;
	adder_32 add32(S,A,B,1'b0);
endmodule 