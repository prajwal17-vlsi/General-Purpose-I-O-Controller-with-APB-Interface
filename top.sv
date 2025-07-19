module top;
	import uvm_pkg::*;
	import gpio_pkg::*;
bit pclk;
always
	begin	
		#10 pclk=!pclk; 
	end
bit ext_clk_pad_i;
always
	begin
		#10 ext_clk_pad_i=!ext_clk_pad_i;
	end
apb_gpio_if in0(pclk,ext_clk_pad_i);
apb_gpio_if in1(pclk,ext_clk_pad_i);
apb_gpio_if in2(pclk,ext_clk_pad_i);

top_module  DUT(.pclk(pclk),.presetn(in0.presetn),.psel(in0.psel),.penable(in0.penable),.pwrite(in0.pwrite),.paddr(in0.paddr),.pwdata(in0.pwdata),.prdata(in0.prdata),.pready(in0.pready),.irq(in0.irq),
		.aux_in(in1.aux_in),
		.ext_clk_pad_i(in2.ext_clk_pad_i),.io_pad(in2.io_pad));/* gpio_assertion  d1(.pclk(pclk),.presetn(in0.presetn),.psel(in0.psel),.penable(in0.penable),.pwrite(in0.pwrite),.paddr(in0.paddr),.pwdata(in0.pwdata),.prdata(in0.prdata),.pready(in0.pready),.irq(in0.irq),
		.aux_in(in1.aux_in),
		.ext_clk_pad_i(in2.ext_clk_pad_i),.io_pad(in2.io_pad));*/



initial 
begin	
	`ifdef VCS
         		$fsdbDumpvars(0, top);
        		`endif

	uvm_config_db#(virtual apb_gpio_if)::set(null,"*","vif0",in0);
	uvm_config_db#(virtual apb_gpio_if)::set(null,"*","vif1",in1);	
	uvm_config_db#(virtual apb_gpio_if)::set(null,"*","vif2",in2);	
	run_test();
end
property penable_check;
@(posedge pclk) $rose(in0.psel) |=> (in0.penable==1'b1);
endproperty

property psel_check;
@(posedge pclk) $rose(in0.penable) |=> $stable(in0.psel);
endproperty

property paddr_check;
@(posedge pclk) $rose(in0.penable)  |=> $stable(in0.paddr);
endproperty

property pwrite_check;
@(posedge pclk) $rose(in0.penable)  |=> $stable(in0.pwrite);
endproperty

property pready_check;
@(posedge pclk) $rose(in0.penable) |=> (in0.pready==1'b1);
endproperty

property penable_signal;
@(posedge pclk) $rose(in0.penable) |=> ##1 (in0.penable==1'b0);
endproperty

property psel_signal;
@(posedge pclk) $rose(in0.pready) |=> (in0.psel==1'b1);
endproperty

/* property idell;
@(posedge pclk) $rose(in0.idel)|=>(in0.pready==1'b0);
endproperty*/

c1:assert property(penable_check)
$display("assertions is done for penable check");
else
$display("assertions is not done for penable check");

c2:assert property(psel_check)
$display("assertions is done for psel check");
else
$display("assertions is not done for psel check");

c3:assert property(paddr_check)
$display("assertions is done for paddr check");
else
$display("assertions is not done for paddr check");

c4:assert property(pwrite_check)
$display("assertions is done for pwrite check");
else
$display("assertions is not done for pwrite check");

c5:assert property(pready_check)
$display("assertions is done for pready check");
else
$display("assertions is not done for pready check");

c6:assert property(penable_signal)
$display("assertions is done for penable signal");
else
$display("assertions is not done for penable signal");

c7:assert property(psel_signal)
$display("assertions is done for psel signal");
else
$display("assertions is not done for penable signal");



A1: assert property (penable_check);
A11: cover property (penable_check);

A2: assert property (psel_check);
A22: cover property (psel_check);

A3 : assert property (paddr_check);
A33 : cover property (paddr_check);

A4 : assert property (pwrite_check);
A44 : cover property (pwrite_check);


A5: assert property (pready_check);
A55: cover property (pready_check);


A6 : assert property (penable_signal);
A66 : cover property (penable_signal);


A7 : assert property (psel_signal);
A77 : cover property (psel_signal);


endmodule

