class gpio_virtual_seqsr extends uvm_sequencer#(uvm_sequence_item);
`uvm_component_utils(gpio_virtual_seqsr)

apb_seqr apb_seqrvh;
aux_seqr aux_seqrvh;
io_seqr io_seqrvh;
env_config m_cfg;

function new(string name="gpio_virtual_seqsr",uvm_component parent);
super.new(name,parent);
endfunction 

virtual function void build_phase(uvm_phase phase);
if(!uvm_config_db#(env_config)::get(this,"","env_config",m_cfg))
`uvm_fatal(get_type_name(),"getting is failed");
endfunction

endclass


