`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:43 11/20/2008 
// Design Name: 
// Module Name:    generate_add 
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
module generate_add(clk_2M,addr,pixel_color);

//Inputs
input clk_2M;
//Outputs
output [15:0] addr,pixel_color;

//reg
reg [15:0] addr = 0;
reg [15:0] pixel_color;
integer i;
 

always @ (posedge clk_2M)
begin
if(addr != 19661)
addr <= addr + 1;
else
addr <= 0;
end

always @ (posedge clk_2M)
begin
for(i=0; i<=9831; i=i+1) begin
if(i>0 && i<9830)
pixel_color = 16'b1001001001001001;
else begin
i=9831;
pixel_color = 16'b1101110101110101;
end
end
end
endmodule
