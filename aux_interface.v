
module aux_interface(sys_clk,sys_rst,aux_in,aux_i);
	input sys_clk,sys_rst;
	input [31:0]aux_in;
	output reg [31:0]aux_i;

	always@(posedge sys_clk ) begin
		if(sys_rst)
			aux_i<= 32'h0;
		else 
			aux_i <= aux_in;
	end

endmodule
