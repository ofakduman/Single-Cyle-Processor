module instruction_memory_tb();

wire [15:0] instruction;
reg [31:0] readAdress;
reg clk;

instruction_memory inst_mem_test(instruction, readAdress, clk);

localparam period = 40;  //actually for posedge period*2
	
	initial 
	begin
		$readmemb("instructions.txt",inst_mem_test.Mem);//read registers data 
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
	
	readAdress = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
   #period; 
	readAdress = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
   #period; 
	$display("time = %2d, read_mem = %16b", $time, instruction);
	
		
	readAdress = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
   #period; 
	$display("time = %2d, read_mem = %16b", $time, instruction);
	
	readAdress = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
   #period; 
	$display("time = %2d, read_mem = %16b", $time, instruction);
	
	
	readAdress = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
   #period; 
	$display("time = %2d, read_mem = %16b", $time, instruction);
	
	
	readAdress = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
   #period; 
	$display("time = %2d, read_mem = %16b", $time, instruction);
	
    $stop;   // end of simulation
end

endmodule