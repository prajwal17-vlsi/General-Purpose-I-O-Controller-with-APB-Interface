  package gpio_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

	`include "apb_agent_config.sv"
	`include "aux_agent_config.sv"
	`include "io_agent_config.sv"
	`include "register.sv"
	`include "register_block.sv"
	`include "env_config.sv"
	`include "apb_xtn.sv"
	`include "apb_seqs.sv"
	`include "apb_seqr.sv"
	`include "apb_drv.sv"
	`include "apb_mon.sv"
	`include "apb_agent.sv"

	`include "aux_xtn.sv"
	`include "aux_seqs.sv"
	`include "aux_seqr.sv"
	`include "aux_drv.sv"
	`include "aux_mon.sv"
	`include "aux_agent.sv"

	`include "io_xtn.sv"
	`include "io_seqs.sv"
	`include "io_seqr.sv"
	`include "io_drv.sv"
	`include "io_mon.sv"
	`include "io_agent.sv"
	`include "scoreboard.sv"
	`include "virtual_seqs.sv"
	`include "virtual_seqsr.sv"
	`include "env.sv"
	`include "gpio_test.sv"



	
endpackage

