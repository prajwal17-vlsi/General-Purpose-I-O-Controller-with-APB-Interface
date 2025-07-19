/*///////////////////   RGPIO_IN   //////
class rgpio_in extends uvm_reg;
	`uvm_object_utils(rgpio_in)
rand uvm_reg_field rgpio_in_h;
function new(string name ="rgpio_in");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_in_h=uvm_reg_field::type_id::create("rgpio_in_h");
	rgpio_in_h.configure(this,32,0,"RO",1,32'h0,1,1,0);
endfunction
endclass

//////////////////  RGPIO_OUT  /////
class rgpio_out extends uvm_reg;
	`uvm_object_utils(rgpio_out)
rand uvm_reg_field rgpio_out_h;
function new(string name ="rgpio_out");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_out_h=uvm_reg_field::type_id::create("rgpio_out_h");
	rgpio_out_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////   RGPIO_NCE   /////
class rgpio_nec extends uvm_reg;
	`uvm_object_utils(rgpio_nec)
rand uvm_reg_field rgpio_nec_h;
function new(string name ="rgpio_nec");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_nec_h=uvm_reg_field::type_id::create("rgpio_nec_h");
	rgpio_nec_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
///////////////   RGPIO_INTE  /////
class rgpio_inte extends uvm_reg;
	`uvm_object_utils(rgpio_inte)
rand uvm_reg_field rgpio_inte_h;
function new(string name ="rgpio_inte");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_inte_h=uvm_reg_field::type_id::create("rgpio_inte_h");
	rgpio_inte_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////////////////RGPIO_INTS/////
class rgpio_ints extends uvm_reg;
	`uvm_object_utils(rgpio_ints)
rand uvm_reg_field rgpio_ints_h;
function new(string name ="rgpio_ints");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_ints_h=uvm_reg_field::type_id::create("rgpio_ints_h");
	rgpio_ints_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////////////////RGPIO_AUX/////
class rgpio_aux extends uvm_reg;
	`uvm_object_utils(rgpio_aux)
rand uvm_reg_field rgpio_aux_h;
function new(string name ="rgpio_aux");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_aux_h=uvm_reg_field::type_id::create("rgpio_aux_h");
	rgpio_aux_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////////////////RGPIO_PTRIG/////
class rgpio_ptrig extends uvm_reg;
	`uvm_object_utils(rgpio_ptrig)
rand uvm_reg_field rgpio_ptrig_h;
function new(string name ="rgpio_ptrig");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void::build();
	rgpio_ptrig_h=uvm_reg_field::type_id::create("rgpio_ptrig_h");
	rgpio_ptrig_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////////////////RGPIO_ECLK/////
class rgpio_eclk extends uvm_reg;
	`uvm_object_utils(rgpio_eclk)
rand uvm_reg_field rgpio_eclk_h;
function new(string name ="rgpio_eclk");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void:: build();
	rgpio_eclk_h=uvm_reg_field::type_id::create("rgpio_eclk_h");
	rgpio_eclk_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////////////////RGPIO_OE/////
class rgpio_oe extends uvm_reg;
	`uvm_object_utils(rgpio_oe)
rand uvm_reg_field rgpio_oe_h;
function new(string name ="rgpio_oe");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void build();
	rgpio_oe_h=uvm_reg_field::type_id::create("rgpio_oe_h");
	rgpio_oe_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
////////////////////////////RGPIO_CTRL/////
class rgpio_ctrl extends uvm_reg;
	`uvm_object_utils(rgpio_ctrl)
rand uvm_reg_field rgpio_ctrl_h;
function new(string name ="rgpio_ctrl");
	super.new(name,32,UVM_NO_COVERAGE);
endfunction
virtual function void ::build();
	rgpio_ctrl_h=uvm_reg_field::type_id::create("rgpio_ctrl_h");
	rgpio_ctrl_h.configure(this,32,0,"RW",1,32'h0,1,1,0);
endfunction
endclass
*/
class reg_RGPIO_IN extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_IN)

  rand uvm_reg_field RGPIO_IN;
  extern function new(string name = "reg_RGPIO_IN");
  extern function void build();
endclass

function reg_RGPIO_IN::new(string name = "reg_RGPIO_IN");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_IN::build();
  RGPIO_IN = uvm_reg_field::type_id::create("RGPIO_IN");
  RGPIO_IN.configure(this, 32, 0, "RO", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_OUT extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_OUT)

  rand uvm_reg_field RGPIO_OUT;
  extern function new(string name = "reg_RGPIO_OUT");
  extern function void build();
endclass

function reg_RGPIO_OUT::new(string name = "reg_RGPIO_OUT");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_OUT::build();
  RGPIO_OUT = uvm_reg_field::type_id::create("RGPIO_OUT");
  RGPIO_OUT.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_OE extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_OE)

  rand uvm_reg_field RGPIO_OE;
  extern function new(string name = "reg_RGPIO_OE");
  extern function void build();
endclass

function reg_RGPIO_OE::new(string name = "reg_RGPIO_OE");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_OE::build();
  RGPIO_OE = uvm_reg_field::type_id::create("RGPIO_OE");
  RGPIO_OE.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_INTE extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_INTE)

  rand uvm_reg_field RGPIO_INTE;
  extern function new(string name = "reg_RGPIO_INTE");
  extern function void build();
endclass

function reg_RGPIO_INTE::new(string name = "reg_RGPIO_INTE");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_INTE::build();
  RGPIO_INTE = uvm_reg_field::type_id::create("RGPIO_INTE");
  RGPIO_INTE.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_PTRIG extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_PTRIG)

  rand uvm_reg_field RGPIO_PTRIG;
  extern function new(string name = "reg_RGPIO_PTRIG");
  extern function void build();
endclass

function reg_RGPIO_PTRIG::new(string name = "reg_RGPIO_PTRIG");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_PTRIG::build();
  RGPIO_PTRIG = uvm_reg_field::type_id::create("RGPIO_PTRIG");
  RGPIO_PTRIG.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_AUX extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_AUX)

  rand uvm_reg_field RGPIO_AUX;
  extern function new(string name = "reg_RGPIO_AUX");
  extern function void build();
endclass

function reg_RGPIO_AUX::new(string name = "reg_RGPIO_AUX");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_AUX::build();
  RGPIO_AUX = uvm_reg_field::type_id::create("RGPIO_AUX");
  RGPIO_AUX.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_CTRL extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_CTRL)

  rand uvm_reg_field RGPIO_CTRL;
  extern function new(string name = "reg_RGPIO_CTRL");
  extern function void build();
endclass

function reg_RGPIO_CTRL::new(string name = "reg_RGPIO_CTRL");
  super.new(name, 2, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_CTRL::build();
  RGPIO_CTRL = uvm_reg_field::type_id::create("RGPIO_CTRL");
  RGPIO_CTRL.configure(this, 2, 0, "RW", 1, 2'b0, 1, 1, 0);
endfunction

class reg_RGPIO_INTS extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_INTS)

  rand uvm_reg_field RGPIO_INTS;
  extern function new(string name = "reg_RGPIO_INTS");
  extern function void build();
endclass

function reg_RGPIO_INTS::new(string name = "reg_RGPIO_INTS");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_INTS::build();
  RGPIO_INTS = uvm_reg_field::type_id::create("RGPIO_INTS");
  RGPIO_INTS.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_ECLK extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_ECLK)

  rand uvm_reg_field RGPIO_ECLK;
  extern function new(string name = "reg_RGPIO_ECLK");
  extern function void build();
endclass

function reg_RGPIO_ECLK::new(string name = "reg_RGPIO_ECLK");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_ECLK::build();
  RGPIO_ECLK = uvm_reg_field::type_id::create("RGPIO_ECLK");
  RGPIO_ECLK.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction

class reg_RGPIO_NEC extends uvm_reg;
  `uvm_object_utils(reg_RGPIO_NEC)

  rand uvm_reg_field RGPIO_NEC;
  extern function new(string name = "reg_RGPIO_NEC");
  extern function void build();
endclass

function reg_RGPIO_NEC::new(string name = "reg_RGPIO_NEC");
  super.new(name, 32, UVM_NO_COVERAGE);
endfunction

function void reg_RGPIO_NEC::build();
  RGPIO_NEC = uvm_reg_field::type_id::create("RGPIO_NEC");
  RGPIO_NEC.configure(this, 32, 0, "RW", 1, 32'h0, 1, 1, 0);
endfunction


