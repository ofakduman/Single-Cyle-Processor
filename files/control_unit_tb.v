`define DELAY 100
module control_unit_tb();

	wire RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti;
	reg [3:0] opcode;

	control_unit control_unit_test(RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti, opcode);
	 
initial begin
opcode = 4'b0000;
#`DELAY;
opcode = 4'b0001;
#`DELAY;
opcode = 4'b0010;
#`DELAY;
opcode = 4'b0011;
#`DELAY;
opcode = 4'b0100;
#`DELAY;
opcode = 4'b0101;
#`DELAY;
opcode = 4'b0110;
#`DELAY;
opcode = 4'b0111;
#`DELAY;
opcode = 4'b1000;
#`DELAY;
opcode = 4'b1001;
#`DELAY;



end
 
  initial
begin
$monitor("time = %2d, opcode = %4b ,RegDst =%1b, Branch =%1b, Bneq =%1b, MemRead =%1b, MemtoReg =%1b, AluOp2 =%1b, AluOp1 =%1b,  AluOp0 =%1b, MemWrite=%1b,  AluSrc =%1b,  RegWrite =%1b,  Slti =%1b, ",$time,opcode, RegDst, Branch, Bneq, MemRead, MemtoReg, AluOp2, AluOp1, AluOp0, MemWrite, AluSrc, RegWrite, Slti);
end

endmodule 