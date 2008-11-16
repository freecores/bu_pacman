`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU PACMAN TEAM
// Engineer: Huaxin Dai
// 
// Create Date:    21:07:03 11/14/2008 
// Design Name: 	 PS/2 Interface
// Module Name:    ps2_top 
// Project Name:   BU PACMAN
// Target Devices: XC3S1000
// Tool versions:  ISE 10.1
// Description:    PS/2 interface, top module.
//
// Dependencies:   ps2_receive.v, ps2_decode.v
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ps2_top(
	 input in_reset,
    input in_clk_main,
    input in_clk_ps2,
    input in_data_ps2,
    output [6:0]out_key
    );
	 wire [7:0]wire_data;
ps2_receive	ps2_rcv	(	.in_clk(in_clk_main),
								.in_reset(in_reset),
								.in_ps2_clk(in_clk_ps2),
								.in_ps2_data(in_data_ps2),
								.out_data(wire_data)
							);
							
ps2_decode 	ps2_dec	(	.in_clk(in_clk_main),
								.in_reset(in_reset),
								.in_data(wire_data),
								.out_data(out_key)
							);
endmodule
