module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [2:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg [31:0] registers [7:0]; //32 bitlik 7 tane register
	
	assign read_data_1 = registers[read_reg_1];	// Read into $rs content from registers[$rs address].
	assign read_data_2 = registers[read_reg_2];	// Read into $rt content from registers[$rt address].
	
	always @(posedge clk)			// While clock is posedge do below.
	begin
		if( signal_reg_write == 1'b1 )	// If signal write is 1 then do below.
		begin
			if( write_reg == 3'b000 )			// If it tries to write into $zero register then do below.  
			begin
				registers[write_reg] <= 32'd1;	// Write 0 again and keep it safe.
			end
			else
			begin
				registers[write_reg] <= write_data;	// Otherwise write $rd content to registers[$rd address].
			end
		end
	end
		
	//this module use behavioral verilog
	//for register & data memory part, use files
	//register.mem or register.txt (file extension does not important)
	
	//--- continuos assignment --- 
	//output data;
	//assign data = registers[adress];
	//--- non-blocking assignment ---
	//register data;
	//always @(posedge clk) begin
	//data <= registers[adress]; end
	
endmodule