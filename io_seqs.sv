class io_base_seqs extends uvm_sequence#(io_xtn);
`uvm_object_utils(io_base_seqs)
function new(string name="io_base_seqs");
	super.new(name);
endfunction
endclass
////////////////////////////////////
class io_seqs extends io_base_seqs;
	`uvm_object_utils(io_seqs)
function new(string name="io_seqs");
	super.new(name);
endfunction

task body();
req=io_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {ctrl==3'b011;})
finish_item(req);
endtask
endclass
////////////////////////////////////////////
class ioseqs extends io_base_seqs;
	`uvm_object_utils(ioseqs)
function new(string name="ioseqs");
	super.new(name);
endfunction

task body();
req=io_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {ctrl==3'b000;})
finish_item(req);
endtask
endclass
//////////////////////////////////////////
class io_bi_seqs extends io_base_seqs;
	`uvm_object_utils(io_bi_seqs)
function new(string name="ioseqs");
	super.new(name);
endfunction

task body();
req=io_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {ctrl==3'b111;})
finish_item(req);
endtask
endclass


