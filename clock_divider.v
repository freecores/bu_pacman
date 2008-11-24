`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:07:44 11/20/2008 
// Design Name: 
// Module Name:    clock_divider 
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
module clk_divider(clk, div_clk);
    input clk;
    output div_clk;
    
    parameter NDIV = 2;
    parameter NBIT = 2;
    
    reg [NBIT-1:0] count;
    reg div_clk;
    
    initial begin
      div_clk = 0;
      count = 0;
    end
    
    always @(posedge clk)
    begin
      if (count >= (NDIV - 1)) count <= 0;
        else count <= count + 1;
        div_clk <= count > ((NDIV - 1)/2) ? 1 : 0;
    end

endmodule


