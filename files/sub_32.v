module sub_32 (S,A,B,CarryIn);
	input [31:0] A,B;
	input CarryIn;
	output [31:0] S;
	wire [31:0] noted;
	
	not32 nott32(noted,B);
	adder_32 add(S,A,noted,CarryIn);
endmodule 