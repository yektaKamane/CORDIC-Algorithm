`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:23:05 01/26/2022
// Design Name:   Cordic_Machine
// Module Name:   C:/Users/lenovo/Desktop/FPGA/CORDIC_FINAL/Cordic_Machine_Test.v
// Project Name:  CORDIC_FINAL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Cordic_Machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Cordic_Machine_Test;

	// Inputs
	reg clk;
	reg [31:0] X_zero;
	reg [31:0] Y_zero;
	reg [31:0] Z_zero;

	// Outputs
	wire [31:0] X_n;
	wire [31:0] Y_n;
	wire [31:0] Z_n;

	// Instantiate the Unit Under Test (UUT)
	Cordic_Machine uut (
		.clk(clk), 
		.X_zero(X_zero), 
		.Y_zero(Y_zero), 
		.Z_zero(Z_zero), 
		.X_n(X_n), 
		.Y_n(Y_n), 
		.Z_n(Z_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		X_zero = 0;
		Y_zero = 0;
		Z_zero = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		clk = 0;
		X_zero = 32'b001_00000000000000000000000000000;
		Y_zero = 0;
		Z_zero = 0;
		
        
		// Add stimulus here

	end
	
		always #50 clk = ~clk;
      
endmodule

