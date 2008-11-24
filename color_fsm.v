`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:32:52 11/20/2008 
// Design Name: 
// Module Name:    color_fsm 
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
module color_fsm(reset,clk_20MHz,clk_2MHz,pixel_set_rgb,fifo_full,fifo_empty,
							hcount,vcount,red_in,green_in,blue_in,
								read_fifo,write_fifo,write_memory,read_memory,count);

//Inputs
input clk_20MHz,clk_2MHz,reset,fifo_full,fifo_empty;
input [15:0] pixel_set_rgb;
input [10:0] hcount;
input [10:0] vcount;
//Outputs
output red_in,green_in,blue_in,read_fifo,write_fifo;
output write_memory, read_memory,count;

//regs
reg red_in, green_in, blue_in,read_fifo,write_fifo,read_memory,write_memory;
reg [2:0] pixel_state = 0;
reg count = 0;

//parameters
parameter [2:0] pixel_1 = 0;
parameter [2:0] pixel_2 = 1;
parameter [2:0] pixel_3 = 2;
parameter [2:0] pixel_4 = 3;
parameter [2:0] pixel_5 = 4;

parameter [8:0] xpos_start = 192;
parameter [8:0] ypos_start = 48;
parameter [8:0] xpos_end = 448;
parameter [8:0] ypos_end = 432;

always @ (clk_2MHz)
begin
if(count == 0) begin
write_memory <= 0;
read_memory <= 1;
if(hcount == 649 && vcount == 479)
count <= 1;
end

else if(count == 1) begin
read_memory <= 0;
write_memory <= 1;
end
end

always @ (posedge clk_20MHz)
begin
if(count == 1)  begin
if(reset) begin
	pixel_state <= pixel_1;
end

else if(vcount >= ypos_start && vcount < ypos_end) begin
		if(hcount >= xpos_start && hcount < xpos_end) begin 
			case(pixel_state)
				pixel_1 :
					begin
						red_in <= pixel_set_rgb[2];
						green_in <= pixel_set_rgb[1];
						blue_in <= pixel_set_rgb[0];
						pixel_state <= pixel_2;
						
					end
				pixel_2 :
					begin
						red_in <= pixel_set_rgb[5];
						green_in <= pixel_set_rgb[4];
						blue_in <= pixel_set_rgb[3];
						pixel_state <= pixel_3;
						
					end
				pixel_3 :
					begin
						red_in <= pixel_set_rgb[8];
						green_in <= pixel_set_rgb[7];
						blue_in <= pixel_set_rgb[6];
						pixel_state <= pixel_4;
			
					end
				pixel_4 :
					begin
						red_in <= pixel_set_rgb[11];
						green_in <= pixel_set_rgb[10];
						blue_in <= pixel_set_rgb[9];

						pixel_state <= pixel_5;
					
					end
				pixel_5 :
					begin
						red_in <= pixel_set_rgb[14];
						green_in <= pixel_set_rgb[13];
						blue_in <= pixel_set_rgb[12];
						pixel_state <= pixel_1;
					
					end
				endcase
			end
end

if(fifo_empty == 1)
read_fifo <= 0;
else
read_fifo <= 1;

if(fifo_full == 1)
write_fifo <= 0;
else
write_fifo <= 1;

end
end
endmodule
