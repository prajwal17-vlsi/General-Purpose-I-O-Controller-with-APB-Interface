interface apb_gpio_if(input bit pclk,ext_clk_pad_i);
	bit presetn;
	bit psel;
	bit penable;
	bit pwrite;
	logic[31:0] paddr;
	logic[31:0] pwdata;
	logic[31:0] aux_in;
	bit pready;
	logic[31:0] prdata;
	bit irq;
	wire[31:0] io_pad;

//driver logic of apb_interface//
clocking apb_drv_cb@(posedge pclk or posedge ext_clk_pad_i);
		default input #1 output #1;
		output presetn;
		output psel;
		output penable;
		output pwrite;
		output paddr;
		output pwdata;
		input prdata;
		input pready;
		input irq;
endclocking

//monitor logic of apb_interface//
clocking apb_mon_cb@(posedge pclk or posedge ext_clk_pad_i);
		default input #1 output #1;
		input presetn;
		input psel;
		input penable;
		input pwrite;
		input paddr;
		input pwdata;
		input prdata;
		input pready;
		input irq;
endclocking

//driver logic of aux_interface//
clocking aux_drv_cb@(posedge pclk or posedge ext_clk_pad_i);
		default input #1 output #1;
		output aux_in;
endclocking

//monitor logic of aux_interface//
clocking aux_mon_cb@(posedge pclk or posedge ext_clk_pad_i);
		default input #1 output #1;
		input aux_in;
endclocking

//driver logic of io_interface//
clocking io_drv_cb@(posedge pclk or posedge ext_clk_pad_i);
		default input #1 output #1;
		inout io_pad;
endclocking

//monitor logic of io_interface//
clocking io_mon_cb@(posedge pclk or posedge ext_clk_pad_i);
		default input #1 output #1;
		input io_pad;
endclocking
//modport for all drv & mon//
modport APB_DRV_MP(clocking apb_drv_cb);
modport APB_MON_MP(clocking apb_mon_cb);
modport AUX_DRV_MP(clocking aux_drv_cb);
modport AUX_MON_MP(clocking aux_mon_cb);
modport IO_DRV_MP(clocking io_drv_cb);
modport IO_MON_MP(clocking io_mon_cb);
endinterface



