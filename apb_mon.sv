class apb_monitor extends uvm_monitor;
`uvm_component_utils(apb_monitor)
apb_agent_config apb_cfg;
virtual apb_gpio_if.APB_MON_MP vif;
uvm_analysis_port #(apb_xtn) monitor_port;
function new(string name="apb_monitor",uvm_component parent);
	super.new(name,parent);
monitor_port=new("monitor_port",this);
endfunction
function void build_phase(uvm_phase phase);
if(!uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_config",apb_cfg))
`uvm_fatal("error","config not getting")
super.build_phase(phase);
endfunction
function void connect_phase(uvm_phase phase);
vif=apb_cfg.vif;
endfunction
virtual task run_phase(uvm_phase phase);
forever
	collect_data();
endtask

	task collect_data();
apb_xtn data_h;
		data_h=apb_xtn::type_id::create("data_h");
	while(vif.apb_mon_cb.pready!==1)
		@(vif.apb_mon_cb);
	data_h.psel=vif.apb_mon_cb.psel;
	data_h.penable=vif.apb_mon_cb.penable;
	data_h.pwrite=vif.apb_mon_cb.pwrite;
	data_h.paddr=vif.apb_mon_cb.paddr;
	data_h.pwdata=vif.apb_mon_cb.pwdata;
	data_h.prdata=vif.apb_mon_cb.prdata;
	data_h.pready=vif.apb_mon_cb.pready;
	data_h.irq=vif.apb_mon_cb.irq;
	@(vif.apb_mon_cb);
	@(vif.apb_mon_cb);


monitor_port.write(data_h);
data_h.print;
endtask

endclass

