`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:57:43 01/26/2022 
// Module Name:    Cordic_Machine 
// Project Name: 	 IMPLEMENTATION_CORDIC_MACHINE_CIRCULAR_ROTATION_MODE
// Tool versions: V1.0 
// Author: Ali & Yekta
//////////////////////////////////////////////////////////////////////////////////

module Cordic_Machine(clock_pulse, x_input, y_input, z_input, x_output, y_output, z_output, flag);

	input clock_pulse;
	
	parameter fractional_bit = 22;
	parameter iteration_number = 22;
	
	// Q3.22
	input signed [fractional_bit+2:0] x_input;
	input signed [fractional_bit+2:0] y_input;
	input signed [fractional_bit+2:0] z_input;
	
	output signed [fractional_bit+2:0] x_output;
	output signed [fractional_bit+2:0] y_output;
	output signed [fractional_bit+2:0] z_output;
	
	output flag; // IF FLAG = 1 , DATA IS READY
	
	reg [fractional_bit+2:0] x_temp_result;
	reg [fractional_bit+2:0] y_temp_result;
	reg [fractional_bit+2:0] z_temp_result;
	
	reg [5:0] counter; // COUNT TO REACH ITERATION_NUMBER(22)
	
	// QM.N ---> ROW = Iteration Number COLUMN = M + N ---> M = 3 N = 22
	reg signed [fractional_bit+2:0] LUT_Atan [iteration_number:0];
	
	
	// arctan 2^(-iteration_number) are pre-calculated and stored in a LUT
	initial
	
		begin
			counter = 0;
			
			LUT_Atan[00] = 25'b000_0010000000000000000000;   // 45.000 degrees -> atan(2^0)
			LUT_Atan[01] = 25'b000_0001001011100100000000;  // 26.565 degrees -> atan(2^-1)
			LUT_Atan[02] = 25'b000_0000100111111011001110; // 14.036 degrees -> atan(2^-2)
			LUT_Atan[03] = 25'b000_0000010100010001000100;
			LUT_Atan[04] = 25'b000_0000001010001011000011;
			LUT_Atan[05] = 25'b000_0000000101000101110101;
			LUT_Atan[06] = 25'b000_0000000010100010111101;
			LUT_Atan[07] = 25'b000_0000000001010001011111;
			LUT_Atan[08] = 25'b000_0000000000101000101111;
			LUT_Atan[09] = 25'b000_0000000000010100010111;
			LUT_Atan[10] = 25'b000_0000000000001010001011;
			LUT_Atan[11] = 25'b000_0000000000000101000101;
		   LUT_Atan[12] = 25'b000_0000000000000010100010;
		   LUT_Atan[13] = 25'b000_0000000000000001010001;
		   LUT_Atan[14] = 25'b000_0000000000000000101000;
		   LUT_Atan[15] = 25'b000_0000000000000000010100;
		   LUT_Atan[16] = 25'b000_0000000000000000001010;
		   LUT_Atan[17] = 25'b000_0000000000000000000101;
		   LUT_Atan[18] = 25'b000_0000000000000000000010;
		   LUT_Atan[19] = 25'b000_0000000000000000000001;
		   LUT_Atan[20] = 25'b000_0000000000000000000000;
		   LUT_Atan[21] = 25'b000_0000000000000000000000;
		   LUT_Atan[22] = 25'b000_0000000000000000000000;
		end
		
	
	
	/* Resource Sharing */
	always @(posedge clock_pulse) 
		begin
			if (counter == 0) 
				begin
				
					x_temp_result <= x_input;
					y_temp_result <= y_input;
					z_temp_result <= z_input;
					
					counter <= counter +1;
				end
			else 
				begin
					x_temp_result <= z_temp_result[fractional_bit+2] ? x_temp_result + (y_temp_result >>> (counter-1))
																					 : x_temp_result - (y_temp_result >>> (counter-1));
			
					y_temp_result <= z_temp_result[fractional_bit+2] ? y_temp_result - (x_temp_result >>> (counter-1))
																					 : y_temp_result + (x_temp_result >>> (counter-1));
			
					z_temp_result <= z_temp_result[fractional_bit+2] ? z_temp_result + LUT_Atan[counter-1]
																					 : z_temp_result - LUT_Atan[counter-1];
																				
					counter <= (counter + 1) % (iteration_number);
				end
		end
		
		
	assign flag  = (counter == iteration_number-1) ? 1: 0;
	
	assign x_output = x_temp_result;
	assign y_output = y_temp_result;
	assign z_output = z_temp_result;
	
	
endmodule
