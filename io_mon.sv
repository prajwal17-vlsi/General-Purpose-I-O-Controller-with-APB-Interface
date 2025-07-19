class io_monitor extends uvm_monitor;
`uvm_component_utils(io_monitor);
io_agent_config io_cfg;
virtual apb_gpio_if.IO_MON_MP vif;
uvm_analysis_port #(io_xtn) monitor_port;
function new(string name="io_monitor",uvm_component parent);
	super.new(name,parent);
monitor_port=new("monitor_port",this);
endfunction
function void build_phase(uvm_phase phase);
if(!uvm_config_db#(io_agent_config)::get(this,"","io_agent_config",io_cfg))
`uvm_fatal("error","config not getting")
super.build_phase(phase);
endfunction
function void connect_phase(uvm_phase phase);
vif=io_cfg.vif;
endfunction
virtual task run_phase(uvm_phase phase);
forever
	collect_data();
endtask
task collect_data();
io_xtn data_h;
		data_h=io_xtn::type_id::create("data_h");
		@(vif.io_mon_cb);
		data_h.io_pad=vif.io_mon_cb.io_pad;
monitor_port.write(data_h);
data_h.print;
endtask
endclass
