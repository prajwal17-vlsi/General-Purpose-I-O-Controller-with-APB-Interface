class aux_driver extends uvm_driver#(aux_xtn);
`uvm_component_utils(aux_driver)
aux_agent_config aux_cfg;
virtual apb_gpio_if.AUX_DRV_MP vif;
function new(string name="aux_driver",uvm_component parent);
	super.new(name,parent);
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
	begin
seq_item_port.get_next_item(req);
@(vif.aux_drv_cb)
	vif.aux_drv_cb.aux_in<=req.aux_in;
	req.print();
seq_item_port.item_done;
	end
endtask

endclass
