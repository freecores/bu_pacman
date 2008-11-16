`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU PACMAN TEAM
// Engineer: Huaxin Dai
// 
// Create Date:    21:02:09 11/14/2008 
// Design Name: 	 PS/2 Interface
// Module Name:    ps2_decode 
// Project Name:   BU PACMAN
// Target Devices: XC3S1000
// Tool versions:  ISE 10.1
// Description:    PS/2 interface, key decode part.
//
// Dependencies:   ps2_receive.v
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ps2_decode(
	 input in_clk,
    input in_reset,
    input [7:0]in_data,
    output reg [6:0]out_data
    );
always @(posedge in_clk)
if(in_reset)
	begin
	out_data <= 7'b0000001;
	end
else
	begin
		case(in_data)
			8'h1C:begin//left, A
						out_data <= 7'b0010000;
					end
			8'h1B:begin//down, S
						out_data <= 7'b0100000;
					end
			8'h23:begin//right, D
						out_data <= 7'b0001000;
					end
			8'h1D:begin//up, W
						out_data <= 7'b1000000;
					end
			8'h2D:begin//reset, R
						out_data <= 7'b0000100;
					end
			8'h4D:begin//pause, P
						out_data <= 7'b0000010;
					end
		default: begin//stop
						out_data <= 7'b0000001;
					end
		endcase
	end

endmodule
