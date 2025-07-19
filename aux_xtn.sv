class aux_xtn extends uvm_sequence_item;
`uvm_object_utils(aux_xtn)
rand bit[31:0] aux_in;
function new(string name="aux_xtn");
	super.new(name);
endfunction

function void do_print(uvm_printer printer);
	printer.print_field("aux_in",this.aux_in,32,UVM_HEX);
endfunction
endclass

