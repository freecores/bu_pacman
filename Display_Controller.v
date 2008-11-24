`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:56:57 11/20/2008 
// Design Name: 
// Module Name:    Display_Controller 
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
module Display_Controller(reset,clk,red_out,green_out,blue_out,v_sync,h_sync,fifo_full,fifo_empty,addr,pixel_color,write_memory,read_memory,chip_enable);

//Inputs
input clk,reset;

//Outputs
output red_out, green_out, blue_out;
output v_sync, h_sync;
output fifo_full,fifo_empty,read_memory,write_memory,chip_enable;
inout [15:0] pixel_color;
output [15:0] addr;

//wires
wire blank,pixel_clk,red_in,blue_in,green_in,clk_5M;
wire [10:0] hcounter;
wire [10:0] vcounter;
wire read_fifo,write_fifo;
wire clk_2M,count;
wire [15:0] pixel_set;

assign chip_enable = 0;

clk_divider clk1(clk, pixel_clk);
clk_divider #(.NDIV(10),.NBIT(4)) clk2(pixel_clk,clk_5M);
clk_divider #(.NDIV(20),.NBIT(5)) clk3(pixel_clk,clk_2M);

vga_controller vga1(reset,pixel_clk,h_sync,v_sync,hcounter,vcounter,blank);
fifo_generator_v4_3 fifo1(
	clk_2M,
	clk_5M,
	read_fifo,
	reset,
	pixel_clk,
	write_fifo,
	pixel_set,
	fifo_empty,
	fifo_full);
color_fsm vga2(reset,pixel_clk,clk_2M,pixel_set,fifo_full,fifo_empty,hcounter,vcounter,red_in,green_in,blue_in,read_fifo,write_fifo,write_memory,read_memory,count);
vga_display vga3(reset,pixel_clk,blank,red_in,blue_in,green_in,hcounter,vcounter,red_out,green_out,blue_out,count);

generate_add add1(clk_2M,addr,pixel_color);
endmodule
