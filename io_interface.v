
module io_interface(out_pad_o,oen_padoen_o,in_pad_i,/*gpio_eclk,*/io_pad_i/*,ext_clk_pad_i*/);

	input [31:0] out_pad_o,oen_padoen_o;
	inout [31:0] io_pad_i;
	output [31:0] in_pad_i;
	//output gpio_eclk;
//	input ext_clk_pad_i;

	
	bufif1 B0(io_pad_i[0],out_pad_o[0],oen_padoen_o[0]);
	bufif1 B1(io_pad_i[1],out_pad_o[1],oen_padoen_o[1]);
	bufif1 B2(io_pad_i[2],out_pad_o[2],oen_padoen_o[2]);
	bufif1 B3(io_pad_i[3],out_pad_o[3],oen_padoen_o[3]);
	bufif1 B4(io_pad_i[4],out_pad_o[4],oen_padoen_o[4]);
	bufif1 B5(io_pad_i[5],out_pad_o[5],oen_padoen_o[5]);
	bufif1 B6(io_pad_i[6],out_pad_o[6],oen_padoen_o[6]);
	bufif1 B7(io_pad_i[7],out_pad_o[7],oen_padoen_o[7]);
	bufif1 B8(io_pad_i[8],out_pad_o[8],oen_padoen_o[8]);
	bufif1 B9(io_pad_i[9],out_pad_o[9],oen_padoen_o[9]);
	bufif1 B10(io_pad_i[10],out_pad_o[10],oen_padoen_o[10]);

	bufif1 B11(io_pad_i[11],out_pad_o[11],oen_padoen_o[11]);
	bufif1 B12(io_pad_i[12],out_pad_o[12],oen_padoen_o[12]);
	bufif1 B13(io_pad_i[13],out_pad_o[13],oen_padoen_o[13]);
	bufif1 B14(io_pad_i[14],out_pad_o[14],oen_padoen_o[14]);
	bufif1 B15(io_pad_i[15],out_pad_o[15],oen_padoen_o[15]);
	bufif1 B16(io_pad_i[16],out_pad_o[16],oen_padoen_o[16]);
	bufif1 B17(io_pad_i[17],out_pad_o[17],oen_padoen_o[17]);
	bufif1 B18(io_pad_i[18],out_pad_o[18],oen_padoen_o[18]);
	bufif1 B19(io_pad_i[19],out_pad_o[19],oen_padoen_o[19]);
	bufif1 B20(io_pad_i[20],out_pad_o[20],oen_padoen_o[20]);

	bufif1 B21(io_pad_i[21],out_pad_o[21],oen_padoen_o[21]);
	bufif1 B22(io_pad_i[22],out_pad_o[22],oen_padoen_o[22]);
	bufif1 B23(io_pad_i[23],out_pad_o[23],oen_padoen_o[23]);
	bufif1 B24(io_pad_i[24],out_pad_o[24],oen_padoen_o[24]);
	bufif1 B25(io_pad_i[25],out_pad_o[25],oen_padoen_o[25]);
	bufif1 B26(io_pad_i[26],out_pad_o[26],oen_padoen_o[26]);
	bufif1 B27(io_pad_i[27],out_pad_o[27],oen_padoen_o[27]);
	bufif1 B28(io_pad_i[28],out_pad_o[28],oen_padoen_o[28]);
	bufif1 B29(io_pad_i[29],out_pad_o[29],oen_padoen_o[29]);
	bufif1 B30(io_pad_i[30],out_pad_o[30],oen_padoen_o[30]);
	bufif1 B31(io_pad_i[31],out_pad_o[31],oen_padoen_o[31]);



	assign in_pad_i = io_pad_i;
	//assign in_pad_i[1] = io_pad_i[1];
	//assign in_pad_i[2] = io_pad_i[2];
	//assign in-pad-i[3] = io_pad_i[3];

	



endmodule
