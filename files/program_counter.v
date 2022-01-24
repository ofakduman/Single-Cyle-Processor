module program_counter (
	output reg [31:0] out,
	input clk,
	input [31:0] in
);

initial begin
	out = 32'b0;
end

always @(posedge clk) begin
		out <= in;
end

endmodule
