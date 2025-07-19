/*class gpio_reg_block extends uvm_reg_block;
`uvm_object_utils(gpio_reg_block)
rand rgpio_in rgpio_in_h;
rand rgpio_out rgpio_out_h;
rand rgpio_nec rgpio_nec_h;
rand rgpio_inte rgpio_inte_h;
rand rgpio_ints rgpio_ints_h;
rand rgpio_aux rgpio_aux_h;
rand rgpio_ptrig rgpio_ptrig_h;
rand rgpio_eclk rgpio_eclk_h;
rand rgpio_oe rgpio_oe_h;
rand rgpio_ctrl rgpio_ctrl_h;

uvm_reg_map GPIO_REG_MAP;

function new(string name ="gpio_reg_block");
super.new(name);
endfunction
virtual function void::build();
GPIO_REG_MAP=create_map("GPIO_REG_MAP",32'h0,4,UVM_LITTLE_ENDIAN,1);
default map=GPIO_REG_MAP;

// rgpio_in
rgpio_in_h=rgpio_in::type_id::create("rgpio_in_h");
rgpio_in_h.configure(this,null,"");
rgpio_in_h.build();
rgpio_in_h.add_hdl_path_slice("rgpio_in",0,32);

// rgpio_out
rgpio_out_h=rgpio_out::type_id::create("rgpio_out_h");
rgpio_out_h.configure(this,null,"");
rgpio_out_h.build();
rgpio_out_h.add_hdl_path_slice("rgpio_out",0,32);

// rgpio_nce
rgpio_nec_h=rgpio_nec::type_id::create("rgpio_nec_h");
rgpio_nec_h.configure(this,null,"");
rgpio_nec_h.build();
rgpio_nec_h.add_hdl_path_slice("rgpio_nec",0,32);

// rgpio_inte
rgpio_inte_h=rgpio_inte::type_id::create("rgpio_inte_h");
rgpio_inte_h.configure(this,null,"");
rgpio_inte_h.build();
rgpio_inte_h.add_hdl_path_slice("rgpio_inte",0,32);

// rgpio_ints
rgpio_ints_h=rgpio_ints::type_id::create("rgpio_ints_h");
rgpio_ints_h.configure(this,null,"");
rgpio_ints_h.build();
rgpio_ints_h.add_hdl_path_slice("rgpio_ints",0,32);

// rgpio_ints
rgpio_aux_h=rgpio_aux::type_id::create("rgpio_aux_h");
rgpio_aux_h.configure(this,null,"");
rgpio_aux_h.build();
rgpio_aux_h.add_hdl_path_slice("rgpio_aux",0,32);

// rgpio_ptrig
rgpio_ptrig_h=rgpio_ptrig::type_id::create("rgpio_ptrig_h");
rgpio_ptrig_h.configure(this,null,"");
rgpio_ptrig_h.build();
rgpio_ptrig_h.add_hdl_path_slice("rgpio_ptrig",0,32);

// rgpio_eclk
rgpio_eclk_h=rgpio_eclk::type_id::create("rgpio_eclk_h");
rgpio_eclk_h.configure(this,null,"");
rgpio_eclk_h.build();
rgpio_eclk_h.add_hdl_path_slice("rgpio_eclk",0,32);

// rgpio_oe
rgpio_oe_h=rgpio_oe::type_id::create("rgpio_oe_h");
rgpio_oe_h.configure(this,null,"");
rgpio_oe_h.build();
rgpio_oe_h.add_hdl_path_slice("rgpio_oe",0,32);

// rgpio_ctrl
rgpio_ctrl_h=rgpio_ctrl::type_id::create("rgpio_ctrl_h");
rgpio_ctrl_h.configure(this,null,"");
rgpio_ctrl_h.build();
rgpio_ctrl_h.add_hdl_path_slice("rgpio_ctrl",0,32);


GPIO_REG_MAP.add_reg(rgpio_in_h,32'h0,"RO");
GPIO_REG_MAP.add_reg(rgpio_out_h,32'h4,"RW");
GPIO_REG_MAP.add_reg(rgpio_nec_h,32'h24,"RW");
GPIO_REG_MAP.add_reg(rgpio_inte_h,32'hc,"RW");
GPIO_REG_MAP.add_reg(rgpio_ints_h,32'h1c,"RW");
GPIO_REG_MAP.add_reg(rgpio_aux_h,32'h14,"RW");
GPIO_REG_MAP.add_reg(rgpio_ptrig_h,32'h10,"RW");
GPIO_REG_MAP.add_reg(rgpio_eclk_h,32'h20,"RW");
GPIO_REG_MAP.add_reg(rgpio_oe_h,32'h8,"RW");
GPIO_REG_MAP.add_reg(rgpio_ctrl_h,32'h18,"RW");

add_hdl_path("top.DUT.R1","RTL");
lock_model();
endfunction
endclass
*/
//`include "gpio_defines.sv"
class gpio_reg_block extends uvm_reg_block;
  `uvm_object_utils(gpio_reg_block)

  rand reg_RGPIO_IN    RGPIO_IN;
  rand reg_RGPIO_OUT   RGPIO_OUT;
  rand reg_RGPIO_OE    RGPIO_OE;
  rand reg_RGPIO_INTE  RGPIO_INTE;
  rand reg_RGPIO_PTRIG RGPIO_PTRIG;
  rand reg_RGPIO_AUX   RGPIO_AUX;
  rand reg_RGPIO_CTRL  RGPIO_CTRL;
  rand reg_RGPIO_INTS  RGPIO_INTS;
  rand reg_RGPIO_ECLK  RGPIO_ECLK;
  rand reg_RGPIO_NEC   RGPIO_NEC;

  uvm_reg_map GPIO_REG_MAP;
  extern function new(string name = "gpio_reg_block");
  extern function void build();
endclass

function gpio_reg_block::new(string name = "gpio_reg_block");
  super.new(name, UVM_NO_COVERAGE);
endfunction

function void gpio_reg_block::build();

  GPIO_REG_MAP = create_map("GPIO_REG_MAP", 'h0, 4, UVM_LITTLE_ENDIAN, 1);
  default_map = GPIO_REG_MAP;

  RGPIO_IN = reg_RGPIO_IN::type_id::create("RGPIO_IN");
  RGPIO_IN.configure(this, null, "");
  RGPIO_IN.build();
  RGPIO_IN.add_hdl_path_slice("rgpio_in", 0, 32);

  RGPIO_OUT = reg_RGPIO_OUT::type_id::create("RGPIO_OUT");
  RGPIO_OUT.configure(this, null, "");
  RGPIO_OUT.build();
  RGPIO_OUT.add_hdl_path_slice("rgpio_out", 0, 32);

  RGPIO_OE = reg_RGPIO_OE::type_id::create("RGPIO_OE");
  RGPIO_OE.configure(this, null, "");
  RGPIO_OE.build();
  RGPIO_OE.add_hdl_path_slice("rgpio_oe", 0, 32);

  RGPIO_INTE = reg_RGPIO_INTE::type_id::create("RGPIO_INTE");
  RGPIO_INTE.configure(this, null, "");
  RGPIO_INTE.build();
  RGPIO_INTE.add_hdl_path_slice("rgpio_inte", 0, 32);

  RGPIO_PTRIG = reg_RGPIO_PTRIG::type_id::create("RGPIO_PTRIG");
  RGPIO_PTRIG.configure(this, null, "");
  RGPIO_PTRIG.build();
  RGPIO_PTRIG.add_hdl_path_slice("rgpio_ptrig", 0, 32);

  RGPIO_AUX = reg_RGPIO_AUX::type_id::create("RGPIO_AUX");
  RGPIO_AUX.configure(this, null, "");
  RGPIO_AUX.build();
  RGPIO_AUX.add_hdl_path_slice("rgpio_aux", 0, 32);

  RGPIO_CTRL = reg_RGPIO_CTRL::type_id::create("RGPIO_CTRL");
  RGPIO_CTRL.configure(this, null, "");
  RGPIO_CTRL.build();
  RGPIO_CTRL.add_hdl_path_slice("rgpio_ctrl", 0, 2);

  RGPIO_INTS = reg_RGPIO_INTS::type_id::create("RGPIO_INTS");
  RGPIO_INTS.configure(this, null, "");
  RGPIO_INTS.build();
  RGPIO_INTS.add_hdl_path_slice("rgpio_ints", 0, 32);

  RGPIO_ECLK = reg_RGPIO_ECLK::type_id::create("RGPIO_ECLK");
  RGPIO_ECLK.configure(this, null, "");
  RGPIO_ECLK.build();
  RGPIO_ECLK.add_hdl_path_slice("rgpio_eclk", 0, 32);

  RGPIO_NEC = reg_RGPIO_NEC::type_id::create("RGPIO_NEC");
  RGPIO_NEC.configure(this, null, "");
  RGPIO_NEC.build();
  RGPIO_NEC.add_hdl_path_slice("rgpio_nec", 0, 32);

  GPIO_REG_MAP.add_reg(RGPIO_IN, `GPIO_RGPIO_IN, "RO");
  GPIO_REG_MAP.add_reg(RGPIO_INTE, `GPIO_RGPIO_INTE, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_OUT, `GPIO_RGPIO_OUT, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_OE, `GPIO_RGPIO_OE, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_NEC, `GPIO_RGPIO_NEC, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_ECLK, `GPIO_RGPIO_ECLK, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_INTS, `GPIO_RGPIO_INTS, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_CTRL, `GPIO_RGPIO_CTRL, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_AUX, `GPIO_RGPIO_AUX, "RW");
  GPIO_REG_MAP.add_reg(RGPIO_PTRIG, `GPIO_RGPIO_PTRIG, "RW");

  add_hdl_path("top.DUT.R1", "RTL");
  //NOTE: add_hdl_path(path, kind="RTL"): Maps a register's HDL path (string) in the DUT for backdoor access.
  // 'path' specifies the hierarchical HDL signal (e.g., "top.dut.reg_block.reg_name").
  // 'kind' (optional) defines the abstraction level (e.g., "RTL", "GATE"). Default is "RTL".
  lock_model();
endfunction
