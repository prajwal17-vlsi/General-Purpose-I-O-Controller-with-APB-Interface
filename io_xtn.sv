class io_xtn extends uvm_sequence_item;
`uvm_object_utils(io_xtn)
rand logic[31:0]  io_pad;
rand bit [2:0] ctrl;
function void post_randomize();
case(ctrl)
	3'b000:io_pad=io_pad;
	3'b001:io_pad[15:0]=16'hz;
	3'b010:io_pad[31:16]=16'hz;
	3'b011:io_pad=32'hz;
	3'b100:io_pad=32'h0;
	3'b101:io_pad=32'hffff_ffff;
	3'b110:io_pad=32'h1z2z3z4z;
	3'b111:io_pad=32'hz5z4z3z2;
endcase
endfunction	
function new(string name ="io_xtn");
	super.new(name);
endfunction
function void do_print(uvm_printer printer);
	printer.print_field("io_pad",this.io_pad,32,UVM_HEX);
endfunction

endclass
