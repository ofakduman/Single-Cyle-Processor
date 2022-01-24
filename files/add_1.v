module add_1 (S,A);
	input [31:0] A;
	output [31:0] S;
	adder_32 add32(S,A,32'b0000_0000_0000_0000_0000_0000_0000_0001,1'b0);
endmodule 