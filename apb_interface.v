
module apb_slave_interface (PCLK,PRESETn,PSEL,PENABLE,PWRITE,PREADY,PWDATA,PADDR,PRDATA,IRQ,sys_clk,sys_rst,gpio_we,gpio_addr,gpio_dat_i,gpio_dat_o,gpio_inta_o);

    input PCLK,PRESETn,PSEL,PENABLE,PWRITE;
    output PREADY;
    input [31:0]PWDATA;
    input [31:0]PADDR;
    input [31:0]gpio_dat_o;
    input gpio_inta_o;
    output [31:0]PRDATA;
    output IRQ;
    output sys_clk,sys_rst,gpio_we;
    output [31:0]gpio_addr;
    output [31:0]gpio_dat_i;

    assign  sys_clk = PCLK;
    assign  sys_rst = ~PRESETn;
    assign gpio_addr= PADDR;
    
    assign IRQ      = gpio_inta_o;
    parameter IDLE =2'b00,SETUP = 2'b01,ENABLE = 2'b10;
     reg [1:0] pr_st,nt;
      always@(posedge PCLK)
      begin
	      if(!PRESETn)
		      pr_st<=IDLE;
	      else 
		      pr_st<=nt;
      end

      always @(*)
      begin
	      nt = IDLE;

	      case(pr_st)
                 
		IDLE : if(!PSEL && !PENABLE)
				nt = IDLE;
			
			else if(PSEL&&!PENABLE)
				nt = SETUP;
			else
				nt = IDLE;

		SETUP : if(PSEL && !PENABLE)        
				nt = SETUP;
			else if(PSEL && PENABLE)
				nt = ENABLE;
			else
				nt = IDLE;

		ENABLE : if(PSEL)
				nt = SETUP;
			else if (!PSEL)
				nt = IDLE;
			else
				nt = IDLE;

			//default :nt =IDLE;

		endcase
	end
	
	assign PREADY = (pr_st==ENABLE);
	
    assign gpio_dat_i = ( PWRITE && PENABLE ) ? PWDATA : 32'b0 ;
    assign PRDATA = (PENABLE ) ? gpio_dat_o : 32'h0 ;

    assign gpio_we = PENABLE ? PWRITE : 1'b0;
endmodule    


    


