`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:09 11/19/2008 
// Design Name: 
// Module Name:    vga_display 
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
module vga_display(reset,pixel_clk,blank,red_in,blue_in,green_in,hcounter,vcounter,red_out,green_out,blue_out,count);

//Inputs
input pixel_clk,reset,blank,count;
input red_in,blue_in,green_in;
input [10:0] hcounter, vcounter;

//Outputs
output red_out,green_out,blue_out;

//regs
reg red_out, green_out, blue_out;


//parameters
parameter [8:0] xpos_start = 192;
parameter [8:0] ypos_start = 48;
parameter [8:0] xpos_end = 448;
parameter [8:0] ypos_end = 432;

parameter [8:0] score_pos = 450;

always @ (posedge pixel_clk)
begin
if(count == 1) begin
	if(blank | reset) begin
				red_out <= 0;
				green_out <= 0;
				blue_out <= 0;
			end
			
	else if(vcounter >= ypos_start && vcounter < ypos_end) begin
		if(hcounter >= xpos_start && hcounter < xpos_end) 
			begin
				red_out <= red_in;
				green_out <= green_in;
				blue_out <= blue_in;
			end
		else
			begin
				red_out <= 1;
				green_out <= 1;
				blue_out <= 0;
			end
		end
		
	else 
	begin
			red_out <= 1;
			green_out <= 1;
			blue_out <= 0;
		end
end
end
			
			
endmodule
