 class aux_monitor extends uvm_monitor;
`uvm_component_utils(aux_monitor)
aux_agent_config aux_cfg;
virtual apb_gpio_if.AUX_MON_MP vif;
uvm_analysis_port #(aux_xtn) monitor_port;
function new(string name="aux_monitor",uvm_component parent);
super.new(name,parent);
monitor_port=new("monitor_port",this);
endfunction
function void build_phase(uvm_phase phase);
if(!uvm_config_db#(aux_agent_config)::get(this,"","aux_agent_config",aux_cfg))
`uvm_fatal("error","config not getting")
super.build_phase(phase);
endfunction
function void connect_phase(uvm_phase phase);
vif=aux_cfg.vif;
endfunction
virtual task run_phase(uvm_phase phase);
forever
	collect_data();
endtask

	task collect_data();
aux_xtn data_h;
		data_h=aux_xtn::type_id::create("data_h");
		@(vif.aux_mon_cb);
		@(vif.aux_mon_cb);
		data_h.aux_in=vif.aux_mon_cb.aux_in;
monitor_port.write(data_h);
data_h.print;
endtask


endclass
