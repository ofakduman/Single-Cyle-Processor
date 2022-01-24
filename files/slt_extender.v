module slt_extender(in, Ext);

	input [31:0] in;
	output [31:0] Ext;

	buf B0(Ext[0],in[31]);
	buf B1(Ext[1],1'b0);
	buf B2(Ext[2],1'b0);
	buf B3(Ext[3],1'b0);
	buf B4(Ext[4],1'b0);
	buf B5(Ext[5],1'b0);
	buf B6(Ext[6],1'b0);
	buf B7(Ext[7],1'b0);
	buf B8(Ext[8],1'b0);
	buf B9(Ext[9],1'b0);
	buf B10(Ext[10],1'b0);
	buf B11(Ext[11],1'b0);
	buf B12(Ext[12],1'b0);
	buf B13(Ext[13],1'b0);
	buf B14(Ext[14],1'b0);
	buf B15(Ext[15],1'b0);
	buf B16(Ext[16],1'b0);
	buf B17(Ext[17],1'b0);
	buf B18(Ext[18],1'b0);
	buf B19(Ext[19],1'b0);
	buf B20(Ext[20],1'b0);
	buf B21(Ext[21],1'b0);
	buf B22(Ext[22],1'b0);
	buf B23(Ext[23],1'b0);
	buf B24(Ext[24],1'b0);
	buf B25(Ext[25],1'b0);
	buf B26(Ext[26],1'b0);
	buf B27(Ext[27],1'b0);
	buf B28(Ext[28],1'b0);
	buf B29(Ext[29],1'b0);
	buf B30(Ext[30],1'b0);
	buf B31(Ext[31],1'b0);

endmodule 