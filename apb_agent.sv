class apb_agent extends uvm_agent;
`uvm_component_utils(apb_agent)
apb_agent_config apb_cfg;
apb_seqr apb_seqrh;
apb_driver apb_drvh;
apb_monitor apb_monh;

function new(string name="apb_agent",uvm_component parent);
	super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
if(!uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_config",apb_cfg))
	`uvm_fatal("error","config not getting")
apb_monh=apb_monitor::type_id::create("apb_monh",this);
	if(apb_cfg.is_active==UVM_ACTIVE)
apb_drvh=apb_driver::type_id::create("apb_driver",this);
apb_seqrh=apb_seqr::type_id::create("apb_seqr",this);
	super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
begin
apb_drvh.seq_item_port.connect(apb_seqrh.seq_item_export);
end
endfunction
endclass
