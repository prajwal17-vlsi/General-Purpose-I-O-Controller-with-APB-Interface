class io_driver extends uvm_driver#(io_xtn);
`uvm_component_utils(io_driver)
io_agent_config io_cfg;
virtual apb_gpio_if.IO_DRV_MP vif;
function new(string name="io_driver",uvm_component parent);
	super.new(name,parent);
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
	begin
seq_item_port.get_next_item(req);
@(vif.io_drv_cb)
	vif.io_drv_cb.io_pad<=req.io_pad;
	req.print();
seq_item_port.item_done;
	end
endtask
endclass
