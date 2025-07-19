
module top_module(pclk,presetn,psel,penable,pwrite,pready,paddr,pwdata,prdata,irq,aux_in,io_pad,ext_clk_pad_i);
input pclk,presetn,psel,penable,pwrite;
input [31:0]paddr,pwdata;
input [31:0]aux_in;
input ext_clk_pad_i;
output pready;
output [31:0]prdata;
output irq;
inout [31:0]io_pad;

 wire sys_clk,sys_rst,gpio_we,gpio_inta_o/*,gpio_eclk*/;
 
 wire [31:0]gpio_addr,gpio_dat_i,gpio_dat_o,aux_i,out_pad_o,oen_padoen_o,in_pad_i;


apb_slave_interface APB (.PCLK(pclk),.PRESETn(presetn),.PSEL(psel),.PENABLE(penable),.PWRITE(pwrite),.PREADY(pready),.PADDR(paddr),.PWDATA(pwdata),.PRDATA(prdata),.IRQ(irq),.sys_clk(sys_clk),.sys_rst(sys_rst),.gpio_we(gpio_we),.gpio_addr(gpio_addr),.gpio_dat_i(gpio_dat_i),.gpio_dat_o(gpio_dat_o),.gpio_inta_o(gpio_inta_o));

aux_interface AUX(.sys_clk(sys_clk),.sys_rst(sys_rst),.aux_in(aux_in),.aux_i(aux_i));

io_interface IO (.out_pad_o(out_pad_o),.oen_padoen_o(oen_padoen_o),.in_pad_i(in_pad_i),/*.gpio_eclk(gpio_eclk),*/.io_pad_i(io_pad)/*,.ext_clk_pad_i(ext_clk_pad_i)*/);

gpio_registers  R1(.sys_clk(sys_clk),.sys_rst(sys_rst),.gpio_we(gpio_we),.gpio_adr(gpio_addr),.gpio_dat_i(gpio_dat_i),.gpio_dat_o(gpio_dat_o),.gpio_inta_o(gpio_inta_o),.aux_i(aux_i),.out_pad_o(out_pad_o),.oen_padoe_o(oen_padoen_o),.in_pad_i(in_pad_i),.gpio_eclk(ext_clk_pad_i));

endmodule 
