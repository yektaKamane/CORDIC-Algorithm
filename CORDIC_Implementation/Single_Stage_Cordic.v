`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:48:04 01/26/2022 
// Design Name: 
// Module Name:    Single_Stage_Cordic 
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
module Single_Stage_Cordic( clk, X_in, Y_in, Z_in,iteration_number, X_out, Y_out, Z_out);

	parameter width = 32;
	
	input clk;
	input [width-1:0] X_in;
	input [width-1:0] Y_in;
	input [width-1:0] Z_in;
	input [4:0] iteration_number;
	
	output reg [width-1:0] X_out;
	output reg [width-1:0] Y_out;
	output reg [width-1:0] Z_out;
	
	reg signed [31:0] LUT_Atan [0:31]; 
	
	
	
	// QM.N ---> ROW = Iteration Number COLUMN = M + N ---> M = 3 N = 29
	initial 
		begin
		
			LUT_Atan[00] = 32'b000_00100000000000000000000000000;
			LUT_Atan[01] = 32'b000_00010010111001000000010100011;
			LUT_Atan[02] = 32'b000_00001001111110110011100001011;
			LUT_Atan[03] = 32'b000_00000101000100010001000111010;
			LUT_Atan[04] = 32'b000_00000010100010110000110101000;
			LUT_Atan[05] = 32'b000_00000001010001011101011111100;
			LUT_Atan[06] = 32'b000_00000000101000101111011000011;
			LUT_Atan[07] = 32'b000_00000000010100010111110001010;
			LUT_Atan[08] = 32'b000_00000000001010001011111001010;
			LUT_Atan[09] = 32'b000_00000000000101000101111100101;
			LUT_Atan[10] = 32'b000_00000000000010100010111110011;
			LUT_Atan[11] = 32'b000_00000000000001010001011111001;
		   LUT_Atan[12] = 32'b000_00000000000000101000101111100;
		   LUT_Atan[13] = 32'b000_00000000000000010100010111110;
		   LUT_Atan[14] = 32'b000_00000000000000001010001011111;
		   LUT_Atan[15] = 32'b000_00000000000000000101000101111;
		   LUT_Atan[16] = 32'b000_00000000000000000010100010111;
		   LUT_Atan[17] = 32'b000_00000000000000000001010001011;
		   LUT_Atan[18] = 32'b000_00000000000000000000101000101;
		   LUT_Atan[19] = 32'b000_00000000000000000000010100010;
		   LUT_Atan[20] = 32'b000_00000000000000000000001010001;


		end
		
		always @(posedge clk) begin
		
			 X_out = Z_in[31] ? X_in + Y_in *(2 >>> iteration_number) : X_in - Y_in *(2 >>> iteration_number);
			 Y_out = Z_in[31] ? Y_in - X_in *(2 >>> iteration_number) : Y_in + X_in *(2 >>> iteration_number);
			 Z_out = Z_in[31] ? Z_in + (LUT_Atan[iteration_number])   :  Z_in - (LUT_Atan[iteration_number]);
			
		
	
		end
	

endmodule