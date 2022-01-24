module zero_founder(Result, zero);
	input [31:0]Result;
	output zero;
	wire temp;
	
	or (temp, Result[31], Result[30], Result[29], Result[28], Result[27], Result[26], Result[25], Result[24], Result[23],
			Result[22], Result[21], Result[20], Result[19], Result[18], Result[17], Result[16], Result[15], Result[14], Result[13],
			Result[12], Result[11], Result[10], Result[9], Result[8], Result[7], Result[6], Result[5], Result[4], Result[3],
			Result[2], Result[1], Result[0]);
	
	not (zero, temp);
endmodule 