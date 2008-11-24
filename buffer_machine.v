`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:54 11/20/2008 
// Design Name: 
// Module Name:    buffer_machine 
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
module buffer_machine(hcount,vcount,buf_cntrl);

//Inputs
input [10:0] hcount;
input [10:0] vcount;

//Outputs
output buf_cntrl;

//regs
reg buf_cntrl;
reg buf_state = 0;

//parameters
parameter state1 = 0;
parameter state2 = 1;

always @ (hcount,vcount)
begin
	if(hcount == 639 && vcount == 479) begin
		case(buf_state)
			state1: begin
				buf_state <= state2;
				buf_cntrl <= 1;
				end
			state2: begin
				buf_state <= state1;
				buf_cntrl <= 0;
				end
			endcase
		end
end

endmodule
