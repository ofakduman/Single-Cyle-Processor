`define DELAY 100
module mips_registers_tb(); 

reg signal_reg_write;
wire [31:0] read_data_1,read_data_2;
reg [31:0] write_data;
reg [2:0] read_reg_1, read_reg_2, write_reg;
reg clk, clk2;
    localparam period = 40;  //actually for posedge period*2


mips_registers Regi(read_data_1,read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);//initialize register
		initial 
	begin
		$readmemb("registers.txt",Regi.registers);//read registers data 
	end
	
	always 
	begin//arrange clock 
    clk = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	end

	always @(posedge clk)//when posedge clock comes time to process on the register
begin
   //read 0 and 6. register with try to writing reg0 for something but if try to write reg0 then register write 00000...0000 to r0
   signal_reg_write = 1'b1;
	read_reg_1 = 3'b000; 
	read_reg_2 = 3'b110;
	write_reg=3'b010;
	write_data = 32'b0011_0011_0011_0011_0011_0011_0011_0000;
   #period; 
	$display("time = %2d,read 0 and 6. register with try to writing reg0 for something but if try to write reg0 then register write 00000...0000 to r0",$time);	
	$display(" read_data_1 = %32b, read_data_2 = %32b, write_data = %32b, signal_reg_write = %1d", read_data_1, read_data_2,
	write_data, signal_reg_write);
	
	// read 1 and 4. register and writing 32'b0000..0000 to 4. register so read_reg_2 == 0000....000
   signal_reg_write = 1'b1;
	read_reg_1 = 3'b001; 
	read_reg_2 = 3'b100;
	write_reg=3'b100;
	write_data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #period; 
	 $display("read 1 and 4. register and writing 32'b0000..0000 to 4. register so read_reg_2 == 0000....000");	
	$display("read_data_1 = %32b, read_data_2 = %32b, write_data = %32b, signal_reg_write = %1d", read_data_1, read_data_2,
	write_data, signal_reg_write);

	
	// read 1 and 4. register and writing 32'b0000..0000 to 4. register so read_reg_2 == 0000....000
   signal_reg_write = 1'b1;
	read_reg_1 = 3'b001; 
	read_reg_2 = 3'b100;
	write_reg=3'b100;
	write_data = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #period; 
	 $display("read 1 and 4. register and writing 32'b0000..0000 to 4. register so read_reg_2 == 0000....000");	
	$display("read_data_1 = %32b, read_data_2 = %32b, write_data = %32b, signal_reg_write = %1d", read_data_1, read_data_2,
	write_data, signal_reg_write);
	
    $stop;   // end of simulation
end

 
endmodule