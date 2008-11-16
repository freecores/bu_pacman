//////////////////////////////////////////////////////////////////////////////////
// Company: BU PACMAN TEAM
// Engineer: Huaxin Dai
// 
// Create Date:    21:02:09 11/14/2008 
// Design Name: 	 PS/2 Interface
// Module Name:    ps2_rcv 
// Project Name:   BU PACMAN
// Target Devices: Spartan3 XC3S1000
// Tool versions:  ISE 10.1
// Description: 	 PS/2 interface, data receiving part.
//
// Dependencies:   Nothing
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Currently the parity check and start/stop bit detection
//								hasn't been done, will do it in later version.
//////////////////////////////////////////////////////////////////////////////////
module ps2_receive(
				input in_clk,
				input in_reset,
				input in_ps2_clk,
				input in_ps2_data,
				output reg [7:0] out_data
				);

reg [3:0] i;//Counter
reg [10:0] data_in;//keycode register, including start bit, keycode, parity bit and stop bit
reg flag_break;
reg [2:0] ps2_clkr;//a fifo to detect ps2 clk

wire ps2_clk_fallingedge = (ps2_clkr[2:1]==2'b10); //re-generate the falling edge

always @(posedge in_clk)
ps2_clkr <= {ps2_clkr[1:0], in_ps2_clk};					//Buffer the incoming PS/2 clock

always @(posedge in_clk)
	if(in_reset)														//Reset
		begin
		i <= 0;
		data_in <= 0;
		out_data <= 8'h00;
		end
	else
		if(ps2_clk_fallingedge)								//Incoming clock falling edge, read data
			begin
				data_in[i] <= in_ps2_data;
				if(i<10) 										//If it's still in the middle of some word
					i <= i+1;
				else												//Word processing
					begin
					i <= 0;
					if(data_in[8:1]==8'hF0)					//If it's the break code
						begin
							out_data <= 8'h00;						//Output an Idle
							flag_break <= 1;					//Set the break flag
						end
					else if(flag_break == 1)				//If the break flag is on, which means this is a keycode for break action
						begin
							out_data <= 8'h00;						//Output an Idle
							flag_break <= 0;					//Clear the break flag
						end
					else											//If it's a make code
						out_data <= data_in[8:1];				//Output the keycode
					end
			end
endmodule