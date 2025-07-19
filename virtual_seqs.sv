class gpio_vbase_seqs extends uvm_sequence #(uvm_sequence_item);
`uvm_object_utils(gpio_vbase_seqs)

function new(string name="gpio_vbase_seqs");
super.new(name);
endfunction 
endclass
//////////////////////////////////
/*class apb_aux_vseqs extends gpio_vbase_seqs;

`uvm_object_utils(apb_aux_vseqs)

function new(string name="apb_aux_vseqs");
super.new(name);
endfunction

task body();
super.body();
s_seqh=small_seqs::type_id::create("s_seqh");
n_seqh=normal_seqs::type_id::create("n_seqh");

fork
	s_seqh.start(sseqrh[0]);
	n_seqh.start(dseqrh[addr]);
join

endtask */


