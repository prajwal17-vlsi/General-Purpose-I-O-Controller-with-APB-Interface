class apb_base_seqs extends uvm_sequence#(apb_xtn);
`uvm_object_utils(apb_base_seqs)
function new(string name ="apb_base_seqs");
	super.new(name);
endfunction
endclass

///////////// GPIO_AS_INPUT_WITHOUT_INTE //////////////////////////
class apb_seqs extends apb_base_seqs;
	`uvm_object_utils(apb_seqs)
function new(string name="apb_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h8;pwdata==32'hffff_ffff;})//EN_oe
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'hc;pwdata==32'h0;})//INTE
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==0;paddr==32'h4;})//OUT
finish_item(req);
endtask
endclass
/////////////////////GPIO_AS_INPUT_WITHOUT_INTE_AUX //////////////////////
class apb_aux_seqs extends apb_base_seqs;
	`uvm_object_utils(apb_aux_seqs)
function new(string name="apb_aux_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h14;pwdata==32'hffff_ffff;})//AUX
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h4;pwdata==32'hffff_ffff;})//OUT
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h8;pwdata==32'hffff_ffff;})//OE
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'hc;pwdata==32'h0;})//INTE
finish_item(req);
endtask
endclass
//////////////////////////GPIO_AS_OUTPUT_WITHOUT_INTE////////////////////////////////////////////////////
class apb_io_seqs extends apb_base_seqs;
	`uvm_object_utils(apb_io_seqs)
function new(string name="apb_io_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h0;pwdata==32'h0;})//in
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h8;pwdata==32'h0000_0000;})//oe
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b0;paddr==32'h0;})//IN
finish_item(req);
endtask
endclass
////////////////////////////GPIO_AS_OUTPUT_WITH_INTE_FFFF_FFFF////////////////////////////////////////////
class apb_inte_seqs extends apb_base_seqs;
	`uvm_object_utils(apb_inte_seqs)
function new(string name="apb_inte_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h10;pwdata==32'hffff_ffff;})//ptrig
finish_item(req);

req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h1c;pwdata==32'h0000_0000;})//ints
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h18;pwdata[1:0]==2'h01;})//ctrl
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'hc;pwdata==32'hffff_ffff;})//inte
finish_item(req);
endtask
endclass
///////////////////////////////GPIO_AS_OUTPUT_WITH_INTE_0000_0000/////////////////////////////////////////
class apb_inte_p0_seqs extends apb_base_seqs;
	`uvm_object_utils(apb_inte_p0_seqs)
function new(string name="apb_inte_p0_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h10;pwdata==32'h0000_0000;})//ptrig
finish_item(req);

req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h1c;pwdata==32'h0000_0000;})//ints
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'h18;pwdata[1:0]==2'h01;})//ctrl
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1;paddr==32'hc;pwdata[7:0]==8'b10101010;})//inte
finish_item(req);
endtask
endclass

//////////////////////////////GPIO_AS_OUTPUT_WITH_INTE_READ/////////////////////////////////
class apb_inte_read_seqs extends apb_base_seqs;
	`uvm_object_utils(apb_inte_read_seqs)
function new(string name="apb_inte_read_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==0;paddr==32'h1c;})//ints
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b0;paddr==32'h0;})//IN
finish_item(req);
endtask
endclass

///////////////////////////GPIO_AS_BIDIRECTION_WITHOUT_INTE/////////////////////////////////////////////
class bi_seqs extends apb_base_seqs;
	`uvm_object_utils(bi_seqs)
function new(string name="bi_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'hc;pwdata==32'h0;})//inte
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h20;pwdata==32'h0000_0000;})//eclk
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h8;pwdata==32'hf0f0_f0f0;})//oe
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h4;pwdata==32'h10203040;})//out
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b0;paddr==32'h0;})//IN
finish_item(req);
endtask
endclass
////////////////////////////////////////////////////////////////
class eclk_seqs extends apb_base_seqs;
	`uvm_object_utils(eclk_seqs)
function new(string name="eclk_seqs");
	super.new(name);
endfunction
task body();
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h24;pwdata==32'hffff_ffff;})//nce
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b1;paddr==32'h20;pwdata==32'hffff_ffff;})//eclk
finish_item(req);
req=apb_xtn::type_id::create("req");
start_item(req);
assert(req.randomize() with {pwrite==1'b0;paddr==32'h0;})//IN
finish_item(req);
endtask
endclass

