class gpio_scoreboard extends uvm_scoreboard;
`uvm_component_utils(gpio_scoreboard)

// xtn handles	//
apb_xtn apb_xtn_h;
aux_xtn aux_xtn_h;
io_xtn io_xtn_h;

// tlm ports //
uvm_tlm_analysis_fifo #(apb_xtn) apb_fifo;
uvm_tlm_analysis_fifo#(aux_xtn) aux_fifo;
uvm_tlm_analysis_fifo#(io_xtn) io_fifo;

int out_seqs,out_err_seqs,bad_seqs,bad_err_seqs,aux_seqs,aux_err_seqs;
reg[31:0] rgpio_in;
reg[31:0] rgpio_out;
reg[31:0] rgpio_nec;
reg[31:0] rgpio_inte;
reg[31:0] rgpio_ints;
reg[31:0] rgpio_aux;
reg[31:0] rgpio_ptrig ;
reg[31:0] rgpio_eclk;
reg[31:0] rgpio_oe;
reg[31:0] rgpio_ctrl;
reg[31:0] in_mux,extc_in,in_pad_i,rgpio_ints_e;

gpio_reg_block reg_block_h;
uvm_reg_data_t data1,data2,data3,data4,data5,data6,data7,data8,data9,data10;
uvm_status_e status;
env_config m_cfg;
covergroup apb;
PRESET:coverpoint apb_xtn_h.presetn{
	bins reset0={0};
	  	}
PADDR:coverpoint apb_xtn_h.paddr{
	bins add1={[32'h0000_0000:32'hffff_ffff]};
		}
PWDATA:coverpoint apb_xtn_h.pwdata{
	bins data1={[32'h0000_0000:32'hffff_ffff]};
		}
PWRITE:coverpoint apb_xtn_h.pwrite{
	bins write2={1};
	  	}
PSEL: coverpoint apb_xtn_h.psel{
	bins psel1[] = {1};
		}
PENABLE: coverpoint apb_xtn_h.penable{
	bins enab[] = {1};
		}

//APB:cross PRESET,PADDR,PWDATA,PWRITE,PSEL,PENABLE;
endgroup
covergroup aux;
AUX_IN:coverpoint aux_xtn_h.aux_in{
	bins data2={[32'h0000_0000:32'hffff_ffff]};
		}
endgroup
covergroup io;
IO_PAD:coverpoint io_xtn_h.io_pad{
	bins data3={[32'h0000_0000:32'hffff_ffff]};
		}
endgroup

// all register handles //
function new(string name="gpio_scoreboard",uvm_component parent);
super.new(name,parent);
apb=new();
aux=new();
io=new();
endfunction

virtual function void build_phase(uvm_phase phase);
if(!uvm_config_db#(env_config)::get(this,"","env_config",m_cfg))
`uvm_fatal(get_type_name(),"getting is failed")
apb_fifo=new("apb_fifo",this);
aux_fifo=new("aux_fifo",this);
io_fifo=new("io_fifo",this); 

reg_block_h=m_cfg.reg_block_h;
endfunction

/************************  Referrence Model Logic for Interrupt Status  ************************/

task ref_model();

	extc_in = (~rgpio_nec & in_pad_i) | (rgpio_nec & in_pad_i);
	in_mux = (rgpio_eclk & extc_in) | (~rgpio_eclk & in_pad_i) ;
	rgpio_ints_e = (rgpio_ints_e | ((in_mux ^ rgpio_in) & ~(in_mux ^ rgpio_ptrig)) & rgpio_inte);
endtask


//////////////////////////////////////////////////////////
virtual task run_phase(uvm_phase phase);
forever
begin
	fork
		begin
			apb_fifo.get(apb_xtn_h);
			$display("----------------from apb scorboard--------------");
			//apb_cov_h=apb_xtn_h;
			apb_xtn_h.print();
			apb.sample();
		end

		begin
			aux_fifo.get(aux_xtn_h);
			$display("--------------from  aux scorboard----------------------");
		//	aux_cov_h=aux_xtn_h;
			aux_xtn_h.print();
			aux.sample();
		end
		begin
			io_fifo.get(io_xtn_h);
			$display("--------------from io scorboard-----------------------");
		//	io_cov_h=io_xtn_h;
			io_xtn_h.print();
			io.sample();
		end

	join
gpio_compare(apb_xtn_h,aux_xtn_h,io_xtn_h);
end
endtask
task gpio_compare(apb_xtn apb_xtn_h,aux_xtn aux_xtn_h,io_xtn io_xtn_h);
	this.reg_block_h.RGPIO_IN.read(status,data1,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_in = data1[31:0];
	this.reg_block_h.RGPIO_OUT.read(status,data2,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_out = data2[31:0];
	this.reg_block_h.RGPIO_OE.read(status,data3,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_oe = data3[31:0];
	this.reg_block_h.RGPIO_INTE.read(status,data4,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_inte = data4[31:0];
	this.reg_block_h.RGPIO_PTRIG.read(status,data5,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_ptrig = data5[31:0];
	this.reg_block_h.RGPIO_AUX.read(status,data6,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_aux = data6[31:0];
	this.reg_block_h.RGPIO_CTRL.read(status,data7,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_ctrl = data7[1:0];
	this.reg_block_h.RGPIO_INTS.read(status,data8,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_ints = data8[31:0];
	this.reg_block_h.RGPIO_ECLK.read(status,data9,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_eclk = data9[31:0];
	this.reg_block_h.RGPIO_NEC.read(status,data10,.path(UVM_BACKDOOR),.map(reg_block_h.GPIO_REG_MAP));
	rgpio_nec = data10[31:0];

$display(rgpio_in,data1);
$display(rgpio_out,data2);
$display(rgpio_oe,data3);
$display(rgpio_inte,data4);
$display(rgpio_ptrig,data5);
$display(rgpio_aux,data6);
$display(rgpio_ctrl,data7);
$display(rgpio_ints,data8);
$display(rgpio_eclk,data9);
$display(rgpio_nec,data10);
///////////////////////////////General-Purpose I/O as Polled Input //////////////////////////////////
if(rgpio_oe=='hffff_ffff && rgpio_ints=='h0)
begin
			if(io_xtn_h.io_pad==rgpio_in) 
				begin
				 `uvm_info("SB","General-Purpose I/O as Polled Input Working",UVM_LOW)
				end
			else
				begin
				`uvm_error("scoreboard","General-Purpose I/O as Polled Input Not Working")
				end
end
		
//////////////////////////////////////General-Purpose I/O as Input in Interrupt Mode//////////////////////////////
ref_model();

rgpio_ints=rgpio_ints;
in_pad_i=io_xtn_h.io_pad;

if( rgpio_oe=='h0 )
begin
			if(io_xtn_h.io_pad==rgpio_in) 
				begin
					if(rgpio_ints==rgpio_ints)	 
					`uvm_info("SB","General-Purpose I/O as Polled Input in Interrupt Working",UVM_LOW)
				end
			else
				begin
				 	 `uvm_error("scoreboard","General-Purpose I/O as Polled Input in Interrupt Not Working")
				end
end
		  `uvm_error("scoreboard","General-Purpose I/O as Polled Input Not Working")
			
		
////////////////////////////////////////General-Purpose I/O as Polled output////////////////////////////////////////////////////////
if(rgpio_oe!==32'h0000_0000 && rgpio_aux==32'h0000_0000)
	begin
		for(int i=0;i<=32;i++)
			begin
			if(rgpio_oe[i]==1'b1)
				begin
					if(io_xtn_h.io_pad[i]==rgpio_out[i])
						begin
						out_seqs++;
						end
					else
						begin
						out_err_seqs++;
						end
				end
			else if(rgpio_oe[i]==1'b0)
				begin
					if(io_xtn_h.io_pad[i]==rgpio_in[i])
						begin
						bad_seqs++;
						end
					else
						begin
						bad_err_seqs++;
						end
				end
end
end
//////////////////////////// General-Purpose I/O input with Auxiliary input /////////////////////////////////
if(rgpio_oe!=32'h00000000 && rgpio_aux!=32'h00000000)
	begin
	for(int i=0;i<32;i++)	
	 begin
	   if(rgpio_oe[i]==1'b1 && rgpio_aux[i]==1'b1)
	    begin	
		if(aux_xtn_h.aux_in[i]==io_xtn_h.io_pad[i])
		begin
			aux_seqs++;
		end
		else
		begin
			aux_err_seqs++;
		end
  	    end

	end
end
endtask
function void report_phase(uvm_phase phase);
	`uvm_info("APB_based_GPIO__________SCOREBOARD","REPORT_PHASE ",UVM_HIGH)
	$display("%0d %0d",bad_seqs,bad_err_seqs);
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	if(out_seqs>0)
            `uvm_info("SB_input","General-Purpose I/O as Polled output Working",UVM_LOW)
	else if(out_err_seqs>0)
	    `uvm_error("scoreboard","General-Purpose I/O as Polled output Not Working")
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/

	if(bad_seqs>0)
            `uvm_info("SB_input","General-Purpose I/O as Bidirectional Working",UVM_LOW)
	else if(bad_err_seqs>0)
	    `uvm_error("scoreboard","General-Purpose I/O as Bidirectional Not Working")
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
	if(aux_seqs>0)
		 `uvm_info("SB_AUX","General-Purpose I/O as Auxiliary input is Working",UVM_LOW)
	else if(aux_err_seqs>0)
		 `uvm_error("scoreboard","General-Purpose I/O as Auxiliary input is Not Working")



endfunction

endclass
