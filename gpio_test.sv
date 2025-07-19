class gpio_base_test extends uvm_test;
`uvm_component_utils(gpio_base_test)
env_config m_cfg;
apb_agent_config apb_cfg;
aux_agent_config aux_cfg;
io_agent_config io_cfg;
env env_h;
gpio_reg_block reg_block_h;
function new(string name="gpio_base_test",uvm_component parent);
	super.new(name,parent);
endfunction
virtual function void build_phase(uvm_phase phase);
reg_block_h=gpio_reg_block::type_id::create("reg_block_h");
reg_block_h.build;
$display("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
m_cfg=env_config::type_id::create("m_cfg");
	m_cfg.reg_block_h=reg_block_h;

	begin
		apb_cfg=apb_agent_config::type_id::create("apb_cfg");
		if(!uvm_config_db#(virtual apb_gpio_if)::get(this,"","vif0",apb_cfg.vif))
		`uvm_fatal("jjjjj","aaapppbbb")
 		apb_cfg.is_active=UVM_ACTIVE;
		m_cfg.apb_cfg=apb_cfg;
	end

	begin
		aux_cfg=aux_agent_config::type_id::create("aux_cfg");
		if(!uvm_config_db#(virtual apb_gpio_if)::get(this,"","vif1",aux_cfg.vif))
		`uvm_fatal("jjjjj","aaauuuxxx")
 		aux_cfg.is_active=UVM_ACTIVE;
		m_cfg.aux_cfg=aux_cfg;
	end

	begin
		io_cfg=io_agent_config::type_id::create("io_cfg");
		if(!uvm_config_db#(virtual apb_gpio_if)::get(this,"","vif2",io_cfg.vif))
		`uvm_fatal("jjjjj","iiiooo")
 		io_cfg.is_active=UVM_ACTIVE;
		m_cfg.io_cfg=io_cfg;
	end
		uvm_config_db#(env_config)::set(this,"*","env_config",m_cfg);
			env_h=env::type_id::create("env_h",this);
super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
uvm_top.print_topology();
endtask
endclass
/////////////////////////////////////////////////////////
class apb_seqs_test extends gpio_base_test;

 `uvm_component_utils(apb_seqs_test)

apb_seqs apb_seqs_h;
io_seqs io_seqs_h;



function new(string name="apb_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);

apb_seqs_h=apb_seqs::type_id::create("apb_seqs_h");
	io_seqs_h=io_seqs::type_id::create("io_seqs_h");
repeat(10)
fork
	apb_seqs_h.start(env_h.apb_h.apb_seqrh);
	io_seqs_h.start(env_h.io_h.io_seqrh);
join
#100;
phase.drop_objection(this);
endtask
endclass
///////////////////////////////////////////////////
class apb_aux_seqs_test extends gpio_base_test;

 `uvm_component_utils(apb_aux_seqs_test)
apb_aux_seqs apb_aux_seqs_h;
aux_seqs aux_seqs_h;
io_seqs io_seqs_h;


function new(string name="apb_aux_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
	aux_seqs_h=aux_seqs::type_id::create("aux_seqs_h");
	apb_aux_seqs_h=apb_aux_seqs::type_id::create("apb_aux_seqs_h");
	io_seqs_h=io_seqs::type_id::create("io_seqs_h");
repeat(5)
fork
	aux_seqs_h.start(env_h.aux_h.aux_seqrh);
	apb_aux_seqs_h.start(env_h.apb_h.apb_seqrh);
	io_seqs_h.start(env_h.io_h.io_seqrh);

join
#100;
phase.drop_objection(this);
endtask
endclass
///////////////////////////////////////////////////////
class io_seqs_test extends gpio_base_test;

 `uvm_component_utils(io_seqs_test)
apb_io_seqs apb_io_seqs_h;
//aux_seqs aux_seqs_h;
ioseqs ioseqs_h;


function new(string name="io_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
	apb_io_seqs_h=apb_io_seqs::type_id::create("apb_io_seqs_h");
	ioseqs_h=ioseqs::type_id::create("ioseqs_h");
repeat(5)
fork
		ioseqs_h.start(env_h.io_h.io_seqrh);
		apb_io_seqs_h.start(env_h.apb_h.apb_seqrh);
join
#500;
phase.drop_objection(this);
endtask
endclass
/////////////////////////////////////////////////////////
class apb_inte_seqs_test extends gpio_base_test;

 `uvm_component_utils(apb_inte_seqs_test)

apb_inte_seqs apb_inte_seqs_h;
apb_inte_read_seqs apb_inte_read_seqs_h;
ioseqs ioseqs_h;

function new(string name="apb_inte_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);

	apb_inte_seqs_h=apb_inte_seqs::type_id::create("apb_inte_seqs_h");
	apb_inte_read_seqs_h=apb_inte_read_seqs::type_id::create("apb_inte_read_seqs_h");
	ioseqs_h=ioseqs::type_id::create("ioseqs_h");

//	io_seqs_h.start(env_h.io_h.io_seqrh);
//#10;
repeat(5)
fork
	apb_inte_seqs_h.start(env_h.apb_h.apb_seqrh);
	ioseqs_h.start(env_h.io_h.io_seqrh);
join
#20;
ioseqs_h.start(env_h.io_h.io_seqrh);
#10;
apb_inte_read_seqs_h.start(env_h.apb_h.apb_seqrh);	
#100;
phase.drop_objection(this);
endtask
endclass
/////////////////////////////////////////////////////
class apb_inte_p0_seqs_test extends gpio_base_test;

 `uvm_component_utils(apb_inte_p0_seqs_test)

apb_inte_p0_seqs apb_inte_p0_seqs_h;
apb_inte_read_seqs apb_inte_read_seqs_h;
ioseqs ioseqs_h;

function new(string name="apb_inte_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);

	apb_inte_p0_seqs_h=apb_inte_p0_seqs::type_id::create("apb_inte_p0_seqs_h");
	apb_inte_read_seqs_h=apb_inte_read_seqs::type_id::create("apb_inte_read_seqs_h");
	ioseqs_h=ioseqs::type_id::create("ioseqs_h");

//	io_seqs_h.start(env_h.io_h.io_seqrh);
//#10;
repeat(5)
fork
	apb_inte_p0_seqs_h.start(env_h.apb_h.apb_seqrh);
	ioseqs_h.start(env_h.io_h.io_seqrh);
join
#20;
ioseqs_h.start(env_h.io_h.io_seqrh);
#10;
apb_inte_read_seqs_h.start(env_h.apb_h.apb_seqrh);	
#100;
phase.drop_objection(this);
endtask
endclass
///////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////
class bi_seqs_test extends gpio_base_test;

 `uvm_component_utils(bi_seqs_test)

bi_seqs bi_seqs_h;
io_bi_seqs io_bi_seqs_h;
function new(string name="bi_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);

	bi_seqs_h=bi_seqs::type_id::create("bi_seqs_h");
	io_bi_seqs_h=io_bi_seqs::type_id::create("io_bi_seqs_h");
repeat(5)
fork
	bi_seqs_h.start(env_h.apb_h.apb_seqrh);
	io_bi_seqs_h.start(env_h.io_h.io_seqrh);
join
#150;
phase.drop_objection(this);
endtask
endclass
/////////////////////////////////////////////////////////
class eclk_seqs_test extends gpio_base_test;

 `uvm_component_utils(eclk_seqs_test)
eclk_seqs eclk_seqs_h;
ioseqs ioseqs_h;


function new(string name="eclk_seqs_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
	eclk_seqs_h=eclk_seqs::type_id::create("eclk_seqs_h");
	ioseqs_h=ioseqs::type_id::create("ioseqs_h");
repeat(5)

fork
		ioseqs_h.start(env_h.io_h.io_seqrh);
		eclk_seqs_h.start(env_h.apb_h.apb_seqrh);
join
#500;
phase.drop_objection(this);
endtask
endclass


