class aux_base_seqs extends uvm_sequence#(aux_xtn);
`uvm_object_utils(aux_base_seqs)
function new(string name ="aux_base_seqs");
super.new(name);
endfunction
endclass
////////////////////////////////
class aux_seqs extends aux_base_seqs;
	`uvm_object_utils(aux_seqs)
function new(string name="aux_seqs");
	super.new(name);
endfunction

task body();
req=aux_xtn::type_id::create("req");
start_item(req);
assert(req.randomize())
finish_item(req);
endtask
endclass
