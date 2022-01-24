module MiniMIPS_testbench ();

//reg [29:0] instruction_set [15:0];
//reg [15:0] instruction_set;
//wire result;

reg clk, clk2;
localparam period = 80;  //actually for posedge period*2
wire [31:0] res;

MiniMIPS mips(res, clk,clk2);//initialize register
	
	initial
	begin
		clk = 0;
		clk2 = 0;
		mips.pc.out <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		$readmemb("instructions.txt",mips.instr_memory.Mem);//read registers data 
		$readmemb("memory_data.txt",mips.memory.memory);//read registers data 
		$readmemb("registers.txt",mips.Registers.registers);//read registers data 
	end
	
	always 
	begin//arrange clock 
    clk = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	 
	  clk2 = 1'b0; 
    #20; // high for 20 * timescale = 20 ns

    clk2 = 1'b1;
    #20; // low for 20 * timescale = 20 ns
	end


	
	always @(posedge clk)//when posedge clock comes time to process on the register
	begin

   //first instruction is r1 = r1 & r3

   #period; 
	$display("first instruction is r1 = r1 & r3");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.Registers.registers[011] = 	%32b ",mips.Registers.registers[3'b011]);
	#period; 	
	$display("mips.Register.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" ");

	$display("second instruction is r6 = r3 & r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.Registers.registers[111] = 	%32b ",mips.Registers.registers[3'b111]);
	#period; 	
	$display("mips.Register.registers[110] = 	%32b", mips.Registers.registers[3'b110]);
	$display(" ");
	
	$display("3. instruction is r1 = r1 add r3");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.Registers.registers[011] = 	%32b ",mips.Registers.registers[3'b011]);
	#period; 	
	$display("mips.Register.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" ");

	$display("4. instruction is r6 = r3 add r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.Registers.registers[111] = 	%32b ",mips.Registers.registers[3'b111]);
	#period; 	
	$display("mips.Register.registers[110] = 	%32b", mips.Registers.registers[3'b110]);
	$display(" ");
	
	$display("5. instruction is r1 = r1 sub r3");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.Registers.registers[011] = 	%32b ",mips.Registers.registers[3'b011]);
	#period; 	
	$display("mips.Register.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" ");

	$display("6. instruction is r6 = r3 sub r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.Registers.registers[111] = 	%32b ",mips.Registers.registers[3'b111]);
	#period; 	
	$display("mips.Register.registers[110] = 	%32b", mips.Registers.registers[3'b110]);
	$display(" ");
	
	$display("7. instruction is r1 = r1 xor r3");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.Registers.registers[011] = 	%32b ",mips.Registers.registers[3'b011]);
	#period; 	
	$display("mips.Register.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" ");

	$display("8. instruction is r6 = r3 xor r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.Registers.registers[111] = 	%32b ",mips.Registers.registers[3'b111]);
	#period; 	
	$display("mips.Register.registers[110] = 	%32b", mips.Registers.registers[3'b110]);
	$display(" ");
	
	$display("9. instruction is r1 = r1 nor r3");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.Registers.registers[011] = 	%32b ",mips.Registers.registers[3'b011]);
	#period; 	
	$display("mips.Register.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" ");

	$display("10. instruction is r6 = r3 nor r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.Registers.registers[111] = 	%32b ",mips.Registers.registers[3'b111]);
	#period; 	
	$display("mips.Register.registers[110] = 	%32b", mips.Registers.registers[3'b110]);
	$display(" ");
	
	$display("11. instruction is r1 = r1 or r3");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.Registers.registers[011] = 	%32b ",mips.Registers.registers[3'b011]);
	#period; 	
	$display("mips.Register.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" ");

	$display("12. instruction is r6 = r3 or r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.Registers.registers[111] = 	%32b ",mips.Registers.registers[3'b111]);
	#period; 	
	$display("mips.Register.registers[110] = 	%32b", mips.Registers.registers[3'b110]);
	$display(" ");
	
	$display("13. instruction is r3 = r1 addi 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" ");

	$display("14. instruction is r7 = r3 addi 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display(" ");
	
	$display("15. instruction is r3 = r1 andi 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" ");

	$display("16. instruction is r7 = r3 andi 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display(" ");
	
	$display("17. instruction is r3 = r1 ori 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" ");

	$display("18. instruction is r7 = r3 ori 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display(" ");
	
	$display("19. instruction is r3 = r1 nori 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" ");

	$display("20. instruction is r7 = r3 nori 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display(" ");
	
	$display("21. instruction is r3 = r1 < 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" ");

	$display("22. instruction is r7 = r3 < 010101");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	#period; 	
	$display("mips.Register.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display(" ");
	
		#period; 	
	$display("23. instruction is $r3 = M[$r1 + 010101]");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
		$display(" $r1 + 010101 = 			%32b",mips.res);

	#period; //for nope 	
	#period; 	

	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" ");

	$display("24. instruction is $r7 =  M[$r3 + 010101]");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display(" mips.imm_extended = 			%32b ",mips.imm_extended);
	$display(" $r3 + 010101 = 			%32b ",mips.res);

	#period;
	$display("mips.Register.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display(" ");
	$display("27. instruction is  M[$r1 + 010101] = $r3");
	$display("instruction = %16b", mips.instruction);	
	$display("mips.Register.registers[011] = 	%32b", mips.Registers.registers[3'b011]);

	#period; 	
	$display(" M[$r3 + 010101] = 			%32b ",mips.memory.memory[mips.res]);
	#period//period for nope

	$display(" ");	
	$display("28. instruction is M[$r3 + 010101] = $r7");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	#period;
	$display(" M[$r3 + 010101] = 			%32b ",mips.memory.memory[mips.res]);
	$display(" ");
	
	$display("31. instruction is if(r1 == r3) -> pc = pc + 1 + signextend");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display("mips.imm_extended = 			%32b ",mips.imm_extended);
	$display("Before instruction mips.pc.out = 	%32b", mips.pc.out);
	#period; 
	
	$display("After instruction mips.pc.out = 	%32b", mips.pc.out);
	$display(" ");

	
	$display("32. instruction is if(r7 == r3) -> pc = pc + 1 + signextend");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display("mips.Registers.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display("mips.imm_extended = 			%32b ",mips.imm_extended);
	$display("Before instruction mips.pc.out = 	%32b", mips.pc.out);
	#period; 	
	$display("After instruction mips.pc.out = 	%32b", mips.pc.out);
	$display(" ");
	
	$display("33. instruction is if(r1 != r3) -> pc = pc + 1 + signextend");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[001] = 	%32b", mips.Registers.registers[3'b001]);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display("mips.imm_extended = 			%32b ",mips.imm_extended);
	$display("Before instruction mips.pc.out = 	%32b", mips.pc.out);
	#period; 
	
	$display("After instruction mips.pc.out = 	%32b", mips.pc.out);
	$display(" ");

	
	$display("34. instruction is if(r7 != r3) -> pc = pc + 1 + signextend");
	$display("instruction = %16b", mips.instruction);
	$display("mips.Registers.registers[011] = 	%32b", mips.Registers.registers[3'b011]);
	$display("mips.Registers.registers[111] = 	%32b", mips.Registers.registers[3'b111]);
	$display("mips.imm_extended = 			%32b ",mips.imm_extended);
	$display("Before instruction mips.pc.out = 	%32b", mips.pc.out);
	#period; 	
	$display("After instruction mips.pc.out = 	%32b", mips.pc.out);
	$display(" ");
	


	
	$display(" out = %32b, regwrite = %1b, res = %32b ", mips.out, mips.RegWrite, mips.result);

   
	$stop;   // end of simulation
end


 
endmodule



	

//you can give here, like below this
//instruction_set = 32'b00000010000100011001000000100000; #10; // rs=$16 rt=$17 rd=$18 s2=s0+s1 		add  s2 s0 s1
//or you can take instructions from file
//readmemb("filename", instruction_set);

//for memory file read & write using followings
//$readmemb("registers.mem", mipsMOdulename.registerModuleName.registers);
//$writememb("registers_outp.mem", mipsMOdulename.registerModuleName.registers);

//Continue for all instruction types 
//Must be least 15*2=30 control lines (There must be at least 2 tests for each instruction)
//You can change the inside of the register.mem file as desired.

//end of the running, output files must be created/updated (register file & data file)
