module instruction_memory (instruction, readAddress, clock);
	
	input clock;
	input [31:0] readAddress;
	
	output reg [15:0]	instruction;
	
	reg [15:0] Mem [0:63]; //128 tane 16 bitlik hafiza
	
	
	always @( posedge clock) begin
		instruction <= Mem[readAddress];
	end
	
endmodule