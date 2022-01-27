`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    5:10:43 01/26/2022 
// Module Name:    Cordic_Machine 
// Project Name: 	 IMPLEMENTATION_CORDIC_MACHINE_CIRCULAR_ROTATION_MODE
// Tool versions: V1.0 
// Author: Ali & Yekta
//////////////////////////////////////////////////////////////////////////////////

module Cordic_Machine_TB;

	// Inputs
	reg clock_pulse;
	reg [24:0] x_input;
	reg [24:0] y_input;
	reg [24:0] z_input;

	// Outputs
	wire [24:0] x_output;
	wire [24:0] y_output;
	wire [24:0] z_output;
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	Cordic_Machine uut (
		.clock_pulse(clock_pulse), 
		.x_input(x_input), 
		.y_input(y_input), 
		.z_input(z_input), 
		.x_output(x_output), 
		.y_output(y_output), 
		.z_output(z_output), 
		.flag(flag)
	);


	initial 
		begin
			clock_pulse = 0;
		end
	
	always # 50 clock_pulse = ~clock_pulse; // T = 100 ns

	initial begin


		/* TESTCASE 1
			Theta = 45
			X(cos Theta): 000.101101010000010010000 (0.70709991455078125)
			Y(sin Theta): 000.101101010000010101100 (0.7071132659912109375)
		*/
		
		//x_input = 25'b000_1001101101010110111010; 	// X_INPUT = 1 / K = 1 / 6467603 = 0.60679496  
		//y_input = 0;
		//z_input = 25'b000_0010000000000000000000;	  // 45 Degree (45/360 = 1/8 = 0.125)
		

		/* TESTCASE 2 
			Theta = 30
			X(cos Theta): 000.110111011011001111100 (0.8660259246826171875)
			Y(sin Theta): 000.100000000000000000001 (0.500000476837158203125)
		*/
 
		//x_input = 25'b000_1001101101010110111010;  // X_INPUT = 1 / K = 1 / 6467603 = 0.60679496 
		//y_input = 0;
		//z_input = 25'b000_0001010101010101000111; // 30 Degree (30/360 = 1/12 = 0.08333)
		
		
		
		/* TESTCASE 3 
			Theta = 60
			X(cos Theta): 000.100000000000000000001 (0.500000476837158203125)
			Y(sin Theta): 000.110111011011001111100 (0.8660259246826171875)
		*/
 
		// x_input = 25'b000_1001101101010110111010;  // X_INPUT = 1 / K = 1 / 6467603 = 0.60679496 
		// y_input = 0;
		// z_input = 25'b000_0010101010101010101100; // 60 Degree (60/360 = 1/6 = 0.16666667)
		
	
	end
      
endmodule

