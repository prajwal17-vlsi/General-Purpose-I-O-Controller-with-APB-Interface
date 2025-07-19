	
module gpio_registers(sys_clk,sys_rst,gpio_we,gpio_adr,gpio_dat_i,gpio_dat_o,gpio_inta_o,aux_i,out_pad_o,oen_padoe_o,in_pad_i,gpio_eclk);
  input sys_clk,sys_rst,gpio_we;
  input [31:0]gpio_adr;
  input [31:0]gpio_dat_i;
  output reg [31:0]gpio_dat_o;
  output reg gpio_inta_o;
  input [31:0]aux_i;
  output [31:0]out_pad_o;
  output  [31:0]oen_padoe_o;
  input [31:0]in_pad_i;
  input gpio_eclk;
 
  reg [31:0]rgpio_in; 
  reg [31:0]rgpio_out;
  reg [31:0]rgpio_oe;
  reg [31:0]rgpio_inte;    
  reg [31:0]rgpio_ptrig;
  reg [31:0]rgpio_aux;
  
  reg [1:0]rgpio_ctrl;
  reg [31:0]rgpio_ints;
  reg [31:0]rgpio_eclk;
  reg [31:0] rgpio_nec;
  reg [31:0] data_reg;
  reg [31:0]pextc_sampled,nextc_sampled,in_mux;
	
 `define GPIO_RGPIO_IN 32'h0
`define GPIO_RGPIO_OUT 32'h4
`define GPIO_RGPIO_OE 32'h8
`define GPIO_RGPIO_INTE 32'hc
`define GPIO_RGPIO_PTRIG 32'h10
`define GPIO_RGPIO_AUX 32'h14
`define GPIO_RGPIO_CTRL 32'h18
`define GPIO_RGPIO_INTS 32'h1c
`define GPIO_RGPIO_ECLK 32'h20
`define GPIO_RGPIO_NEC 32'h24
`define GPIO_RGPIO_CTRL_INTE 1'b0
`define GPIO_RGPIO_CTRL_INTS 1'b1

	wire [31:0]w1,w2,w3,w4,w5,w6;


// RGPIO_OUT REGISTER


		always@(posedge sys_clk)
			begin 
			if(sys_rst)
			
				rgpio_out<=32'h0;

			else
			        begin
				
					if((gpio_adr == `GPIO_RGPIO_OUT)&&(gpio_we))
				rgpio_out <= gpio_dat_i;
				
			else
				rgpio_out<=rgpio_out;
			end
		end


// RGPIO_OE REGISTER

			always@(posedge sys_clk)
			begin 
			if(sys_rst)
				rgpio_oe <=32'h0;

			else 
				begin

			       	if((gpio_adr==`GPIO_RGPIO_OE)&&(gpio_we))


				rgpio_oe <= gpio_dat_i;
			else
				rgpio_oe <= rgpio_oe;
			end 
		end

// RGPIO_INTE    


			always@(posedge sys_clk)
			begin 
			if(sys_rst)

				rgpio_inte  <=32'h0;

			else
				
			begin
				if((gpio_adr==`GPIO_RGPIO_INTE)&&(gpio_we))

				rgpio_inte <= gpio_dat_i;
			else
				rgpio_inte <= rgpio_inte;
			end
		end	
//  RGPIO_ PTRIG

			always@(posedge sys_clk)
			begin 
			if(sys_rst)

				rgpio_ptrig <=32'h0;

			else

			begin       
				if((gpio_adr== `GPIO_RGPIO_PTRIG)&&(gpio_we))

				rgpio_ptrig <= gpio_dat_i;
			else
				rgpio_ptrig <= rgpio_ptrig;
			end 
		end

// RGPIO_AUX REGISTER

			always@(posedge sys_clk)

			begin 

			if(sys_rst)

				rgpio_aux <=32'h0;

			else 
				begin
					if((gpio_adr== `GPIO_RGPIO_AUX)&&(gpio_we))

				rgpio_aux <= gpio_dat_i;
			else
				rgpio_aux <= rgpio_aux;
			end 
		end


// RGPIO_ECLK REGISTER 


			always@(posedge sys_clk)

			begin 

			if(sys_rst)

				rgpio_eclk <=32'h0;

			else
				begin

				if((gpio_adr == `GPIO_RGPIO_ECLK)&&(gpio_we))

				rgpio_eclk <= gpio_dat_i;
			else
				rgpio_eclk <= rgpio_eclk;
			end
		end


// RGPIO_NEC EDGE REGISTER



			always@(posedge sys_clk)

			begin 

			if(sys_rst)

				rgpio_nec <=32'h0;

			else
				begin

				if((gpio_adr== `GPIO_RGPIO_NEC)&&(gpio_we))

				rgpio_nec <= gpio_dat_i;
			else
				rgpio_nec <= rgpio_nec;
			end
		end

// RGPIO_CTRL register


		
			always@(posedge sys_clk)

			begin 

			if(sys_rst)

				rgpio_ctrl <=2'b0; 
			else 
				begin

			 if((gpio_adr == `GPIO_RGPIO_CTRL)&&gpio_we) 
				 
				rgpio_ctrl <= gpio_dat_i[1:0];

			else 
				begin
					if(rgpio_ctrl[`GPIO_RGPIO_CTRL_INTE])

					rgpio_ctrl <= {(rgpio_ctrl[`GPIO_RGPIO_CTRL_INTS])|| gpio_inta_o,(rgpio_ctrl[`GPIO_RGPIO_CTRL_INTE])};

					else
					rgpio_ctrl <= rgpio_ctrl;
					end
				end

			end

//      RGPIO INTS REGISTER 	
		
			assign w1=rgpio_in^in_mux;
			assign w2=rgpio_ptrig~^in_mux;
			assign w3=w1&w2&rgpio_inte;
			assign w4=w3 | rgpio_ints;

			always @(posedge sys_clk) begin

				if(sys_rst)
					rgpio_ints <= 32'h0;

				else 
					begin
						if((gpio_adr == `GPIO_RGPIO_INTS) &&(gpio_we))

					rgpio_ints <= gpio_dat_i;
							
						
				else 
					begin
						if (rgpio_ctrl[`GPIO_RGPIO_CTRL_INTE])

							rgpio_ints <= w4;
						else 
							rgpio_ints <= rgpio_ints;
					end
				end
			end





// RGPIO_IN REGISTER 				
			always@(posedge gpio_eclk)
			begin 
			if(sys_rst)
				pextc_sampled<=32'b0;
			else 
				pextc_sampled<=in_pad_i;
		end 
		always@(negedge gpio_eclk)
			begin 
			if(sys_rst)
				nextc_sampled<=32'b0;
			else
				nextc_sampled<=in_pad_i;
		end 
		
		always @(*) begin

				if(&rgpio_eclk)
				begin
					if(rgpio_nec==0)
					in_mux = pextc_sampled;	
				
				else
					in_mux = nextc_sampled;
				end

				else
					in_mux = in_pad_i;
				
				end
				
	
	always@(posedge sys_clk)
			begin 
			if(sys_rst)
				rgpio_in<=32'h0;
			else
				rgpio_in<=in_mux;
		end 
			
///GPIO OUT ////

		 always@(posedge sys_clk)
     begin 
        if(sys_rst==1)
             gpio_dat_o <= 32'h0;
	else 
	     gpio_dat_o <= data_reg;
     end


/// multiplexer  DATA_REG LOGIC/// 

			always @(*)  begin

				case (gpio_adr)
					
	    `GPIO_RGPIO_IN : data_reg = rgpio_in;
            `GPIO_RGPIO_OUT : data_reg = rgpio_out;
            `GPIO_RGPIO_OE : data_reg = rgpio_oe;
            `GPIO_RGPIO_INTE : data_reg = rgpio_inte;
            `GPIO_RGPIO_PTRIG : data_reg = rgpio_ptrig;
            `GPIO_RGPIO_NEC : data_reg = rgpio_nec;
            `GPIO_RGPIO_ECLK : data_reg = rgpio_eclk;
            `GPIO_RGPIO_AUX : data_reg = rgpio_aux;
            `GPIO_RGPIO_CTRL : data_reg = rgpio_ctrl;
            `GPIO_RGPIO_INTS : data_reg = rgpio_ints;
	     default : data_reg=rgpio_in;


	
	endcase

			end

//CPU INTERRUPT REQUEST LOGIC 

				always@(*)
      					begin
         					if(rgpio_ints)
							gpio_inta_o <= rgpio_ctrl[`GPIO_RGPIO_CTRL_INTE]; 

						 else
							 gpio_inta_o <= 1'b0;

		 			end

//  OUT_PAD_O LOGIC	
	assign w5 = rgpio_out & (~rgpio_aux);
	assign w6 = rgpio_aux & aux_i;
	assign out_pad_o = w5 | w6;
    assign oen_padoe_o = rgpio_oe;

endmodule



