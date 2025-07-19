class io_agent extends uvm_agent;
`uvm_component_utils(io_agent)
io_agent_config io_cfg;
io_monitor io_monh;
io_driver io_drvh;
io_seqr io_seqrh;
function new(string name="io_agent",uvm_component parent);
	super.new(name,parent);
endfunction
virtual function void build_phase(uvm_phase phase);
if(!uvm_config_db#(io_agent_config)::get(this,"","io_agent_config",io_cfg))
	`uvm_fatal("error","config not getting")
	io_monh=io_monitor::type_id::create("io_monh",this);
if(io_cfg.is_active==UVM_ACTIVE)
	io_drvh=io_driver::type_id::create("io_drvh",this);
	io_seqrh=io_seqr::type_id::create("io_seqr",this);
super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
begin
io_drvh.seq_item_port.connect(io_seqrh.seq_item_export);
end
endfunction

endclass
