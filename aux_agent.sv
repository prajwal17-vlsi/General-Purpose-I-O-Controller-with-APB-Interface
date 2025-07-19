class aux_agent extends uvm_agent;
`uvm_component_utils(aux_agent)
aux_agent_config aux_cfg;
aux_monitor aux_monh;
aux_driver aux_drvh;
aux_seqr aux_seqrh;
function new(string name="aux_agent",uvm_component parent);
	super.new(name,parent);
endfunction
virtual function void build_phase(uvm_phase phase);
if(!uvm_config_db#(aux_agent_config)::get(this,"","aux_agent_config",aux_cfg))
	`uvm_fatal("error","config not getting")
aux_monh=aux_monitor::type_id::create("aux_monh",this);
if(aux_cfg.is_active==UVM_ACTIVE)
aux_drvh=aux_driver::type_id::create("aux_drvh",this);
aux_seqrh=aux_seqr::type_id::create("aux_seqrh",this);
super.build_phase(phase);
endfunction
function void connect_phase(uvm_phase phase);
begin
aux_drvh.seq_item_port.connect(aux_seqrh.seq_item_export);
end
endfunction
endclass
