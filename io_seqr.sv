class io_seqr extends uvm_sequencer#(io_xtn);
`uvm_component_utils(io_seqr)
function new(string name="io_seqr",uvm_component parent);
	super.new(name,parent);
endfunction
endclass
