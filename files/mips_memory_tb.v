module mips_memory_tb();

wire [31:0] read_mem;
reg [31:0] write_data_address, write_data;
reg signal_mem_write, signal_mem_read, clk;

mips_memory mem_test(write_data_address, write_data, read_mem, signal_mem_write, signal_mem_read, clk);

localparam period = 40;  //actually for posedge period*2
	
	initial 
	begin
		$readmemb("memory_data.txt",mem_test.memory);//read registers data 
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
   //write to 0. address but signal mem write = 0 so dont write anything but signal_mem_read = 1 so read 1. address of the memory_data
   write_data_address = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	signal_mem_write = 1'b0;
	write_data = 32'b0011_0011_0011_0011_0011_0011_0011_0000;
	signal_mem_read = 1'b1;
   #period; 
	write_data_address = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	signal_mem_write = 1'b1;
	write_data = 32'b0011_0011_0011_0011_0011_0011_0011_0000;
	signal_mem_read = 1'b1;
   #period; 
	$display("write to 0. address but signal mem write = 0 so dont write anything but signal_mem_read = 1 so read 1. address of the memory_data");	
	$display("write_data_address = %32b, signal_mem_read %1b, signal_mem_write %1b", write_data_address, signal_mem_read, signal_mem_write);
	$display("time = %2d, read_mem = %32b", $time, read_mem);
	
	//write to 0. address 32'b1111....1111 signal mem write = 1 so mem_data[0]=1111...1111
   write_data_address = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	signal_mem_write = 1'b1;
	write_data = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
	signal_mem_read = 1'b0;
   #period; 
	$display("write to 0. address 32'b1111....1111 signal mem write = 1 so mem_data[0]=1111...1111");	
	$display("write_data_address = %32b, signal_mem_read %1b, signal_mem_write %1b", write_data_address, signal_mem_read, signal_mem_write,);
	$display("time = %2d, read_mem = %32b", $time, read_mem);
	
	   //get the mem_data[0] which is before state we wrote 1111....1111
   write_data_address = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	signal_mem_write = 1'b0;
	write_data = 32'b0011_0011_0011_0011_0011_0011_0011_0000;
	signal_mem_read = 1'b1;
   #period; 
	$display("write to 0. address but signal mem write = 0 so dont write anything");	
	$display("write_data_address = %32b, signal_mem_read %1b, signal_mem_write %1b", write_data_address, signal_mem_read, signal_mem_write,);
	$display("time = %2d, read_mem = %32b", $time, read_mem);
	
    $stop;   // end of simulation
end

endmodule