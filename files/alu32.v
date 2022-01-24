module alu32(Aluop2, Aluop1, Aluop0, a, b, res, Zero0, OverFlow);
	input Aluop2, Aluop1, Aluop0;
	input [31:0] a, b;
	output [31:0] res;
	output Zero0, OverFlow;
	
	wire [31:0] orRes,andRes,xorRes,norRes,addRes,subRes,rshiftRes,lshiftRes,Mux41,Mux42;
	wire n1, n2, n3, ov1, ov2;
	
	and32 	and_32(andRes, a, b);
	adder32 	add(addRes, a, b);
	sub32 	sub(subRes, a, b);
	xor32 	xor_32(xorRes, a, b);
	nor32 	nor_32(norRes, a, b);
	or32  	or_32(orRes, a, b);
	
	mux_8x1_32 mux_8x1_32bit(res, andRes, andRes, orRes, norRes, xorRes, subRes, addRes, andRes,Aluop2,Aluop1,Aluop0);
	
	not N1(n1, res[31]);
	not N2(n2, a[31]);
	not N3(n3, b[31]);
	and OV1(ov1, n1, a[31], b[31]);
	and OV2(ov2, n2, n3, res[31]);
	or  OVERFLOWBIT(OverFlow, ov1, ov2);
	
	zero_founder Z0(res, Zero0);

endmodule 