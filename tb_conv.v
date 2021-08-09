`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:52:56 01/26/2021
// Design Name:   conv
// Module Name:   E:/DSD LABS/labs/CEP/tb_conv.v
// Project Name:  CEP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: conv
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_conv;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] image_out;

	// Instantiate the Unit Under Test (UUT)
	conv uut (
		.clk(clk), 
		.rst(rst), 
		.image_out(image_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;rst = 1;

		// Wait 100 ns for global reset to finish
		#10;
		rst = 1;
		#10;
		rst = 1;
		#10;
		rst = 1;
		#10;
		rst=0;
		#10;
			rst=0;
		#10;
			rst=0;
		#10;
			rst=0;
		#10;
        

	end
      always #5 clk=~clk;
endmodule

