class apb_xtn extends uvm_sequence_item;
	`uvm_object_utils(apb_xtn)
bit presetn;
rand bit psel;
rand bit penable;
rand bit pwrite;
rand bit[31:0] paddr;
rand bit[31:0] pwdata;
bit pready;
bit irq;
bit [31:0]prdata;

function new(string name ="apb_xtn");
	super.new(name);
endfunction

function void do_print(uvm_printer printer);

	printer.print_field("presetn",this.presetn,1,UVM_BIN);
	printer.print_field("psel",this.psel,1,UVM_BIN);
	printer.print_field("penable",this.penable,1,UVM_BIN);
	printer.print_field("pwrite",this.pwrite,1,UVM_BIN);
	printer.print_field("paddr",this.paddr,32,UVM_HEX);
	printer.print_field("pwdata",this.pwdata,32,UVM_HEX);
	printer.print_field("pready",this.pready,1,UVM_BIN);
	printer.print_field("irq",this.irq,1,UVM_BIN);
	printer.print_field("prdata",this.prdata,32,UVM_HEX);


endfunction

endclass
