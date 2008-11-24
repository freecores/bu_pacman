`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:52:10 11/20/2008
// Design Name:   blk_mem_gen_v2_7
// Module Name:   X:/Display_Controller/test_mem_init.v
// Project Name:  Display_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blk_mem_gen_v2_7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mem_init;

	// Inputs
	reg clka;
	reg [15:0] dina;
	reg [15:0] addra;
	reg ena;
	reg wea;
	reg clkb;
	reg [15:0] dinb;
	reg [15:0] addrb;
	reg enb;
	reg web;

	// Outputs
	wire [15:0] douta;
	wire [15:0] doutb;

	// Instantiate the Unit Under Test (UUT)
	blk_mem_gen_v2_7 uut (
		.clka(clka), 
		.dina(dina), 
		.addra(addra), 
		.ena(ena), 
		.wea(wea), 
		.douta(douta), 
		.clkb(clkb), 
		.dinb(dinb), 
		.addrb(addrb), 
		.enb(enb), 
		.web(web), 
		.doutb(doutb)
	);


	
	initial begin
		// Initialize Inputs
		clka = 0;
		dina = 0;
		addra = 1;
		ena = 1;
		wea = 0;
		clkb = 0;
		dinb = 0;
		addrb = 0;
		enb = 0;
		web = 0;
		
		#100
		clka =1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

