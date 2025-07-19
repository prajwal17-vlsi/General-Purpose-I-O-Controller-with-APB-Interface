class env extends uvm_env;
`uvm_component_utils(env)
env_config m_cfg;
apb_agent apb_h;
aux_agent aux_h;
io_agent io_h;
apb_agent_config apb_cfg;
aux_agent_config aux_cfg;
io_agent_config io_cfg;
gpio_scoreboard sb_h;
gpio_virtual_seqsr v_sequencer;
function new(string name ="env",uvm_component parent);
super.new(name,parent);
endfunction
virtual function void build_phase(uvm_phase phase);
if(!uvm_config_db#(env_config)::get(this,"","env_config",m_cfg))
`uvm_fatal(get_type_name(),"getting is failed")
sb_h=gpio_scoreboard::type_id::create("sb_h",this);
super.build_phase(phase);
begin
	apb_h=apb_agent::type_id::create("apb_h",this);
	uvm_config_db#(apb_agent_config)::set(this,"*","apb_agent_config",m_cfg.apb_cfg);
end
begin
	aux_h=aux_agent::type_id::create("aux_h",this);
	uvm_config_db#(aux_agent_config)::set(this,"*","aux_agent_config",m_cfg.aux_cfg);
end
begin
	io_h=io_agent::type_id::create("io_h",this);
	uvm_config_db#(io_agent_config)::set(this,"*","io_agent_config",m_cfg.io_cfg);
end
v_sequencer=gpio_virtual_seqsr::type_id::create("v_sequencer",this);
endfunction

function void connect_phase(uvm_phase phase);
	v_sequencer.apb_seqrvh=apb_h.apb_seqrh;
	v_sequencer.aux_seqrvh=aux_h.aux_seqrh;
	v_sequencer.io_seqrvh=io_h.io_seqrh;

		apb_h.apb_monh.monitor_port.connect(sb_h.apb_fifo.analysis_export);
		aux_h.aux_monh.monitor_port.connect(sb_h.aux_fifo.analysis_export);
		io_h.io_monh.monitor_port.connect(sb_h.io_fifo.analysis_export);

endfunction
endclass
