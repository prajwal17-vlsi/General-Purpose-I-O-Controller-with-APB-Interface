class env_config extends uvm_object;
	`uvm_object_utils(env_config)
apb_agent_config apb_cfg;
aux_agent_config aux_cfg;
io_agent_config io_cfg;
gpio_reg_block reg_block_h;
function new(string name ="env_config");
super.new(name);
endfunction
endclass

