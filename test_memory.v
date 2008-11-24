`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:07 11/20/2008 
// Design Name: 
// Module Name:    test_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_memory(reset,clk,dataout);

input clk,reset;
output [7:0] dataout;

wire [15:0] addr;
wire clk_5M;
wire [15:0] frame_1;
wire [15:0] doutb;

clk_divider #(.NDIV(50000000),.NBIT(22)) clk2(clk,clk_5M);
generate_add add1(reset,clk_5M,addr);
blk_mem_gen_v2_7 mem1(clk_5M,
	0,
	addr,
	1,
	0,
	frame_1,
	clk_5M,
	0,
	addr,
	0,
	0,
	doutb);
	
assign dataout = frame_1[15:8];
endmodule
