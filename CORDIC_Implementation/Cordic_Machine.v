`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:43 01/26/2022 
// Design Name: 
// Module Name:    Cordic_Machine 
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
module Cordic_Machine( clk, X_zero, Y_zero, Z_zero, X_n, Y_n, Z_n);

	input clk;
	input [31:0] X_zero;
	input [31:0] Y_zero;
	input [31:0] Z_zero;
	
	output [31:0] X_n;
	output [31:0] Y_n;
	output [31:0] Z_n;
	
	
	wire [31:0] X_middle1;
	wire [31:0] X_middle2;
	wire [31:0] X_middle3;
	wire [31:0] X_middle4;
	wire [31:0] X_middle5;
	wire [31:0] X_middle6;
	wire [31:0] X_middle7;
	wire [31:0] X_middle8;
	wire [31:0] X_middle9;
	wire [31:0] X_middle10;
	
	wire [31:0] Y_middle1;
	wire [31:0] Y_middle2;
	wire [31:0] Y_middle3;
	wire [31:0] Y_middle4;
	wire [31:0] Y_middle5;
	wire [31:0] Y_middle6;
	wire [31:0] Y_middle7;
	wire [31:0] Y_middle8;
	wire [31:0] Y_middle9;
	wire [31:0] Y_middle10;
	
	wire [31:0] Z_middle1;
	wire [31:0] Z_middle2;
	wire [31:0] Z_middle3;
	wire [31:0] Z_middle4;
	wire [31:0] Z_middle5;
	wire [31:0] Z_middle6;
	wire [31:0] Z_middle7;
	wire [31:0] Z_middle8;
	wire [31:0] Z_middle9;
	wire [31:0] Z_middle10;


	Single_Stage_Cordic s1( .clk(clk), .X_in(X_zero), .Y_in(Y_zero), .Z_in(Z_zero), .iteration_number(0), .X_out(X_middle1), .Y_out(Y_middle1), .Z_out(Z_middle1));
	Single_Stage_Cordic s2( .clk(clk), .X_in(X_middle1), .Y_in(Y_middle1), .Z_in(Z_middle1), .iteration_number(1), .X_out(X_middle2), .Y_out(Y_middle2), .Z_out(Z_middle2));
	Single_Stage_Cordic s3( .clk(clk), .X_in(X_middle2), .Y_in(Y_middle2), .Z_in(Z_middle2), .iteration_number(2), .X_out(X_middle3), .Y_out(Y_middle3), .Z_out(Z_middle3));
	Single_Stage_Cordic s4( .clk(clk), .X_in(X_middle3), .Y_in(Y_middle3), .Z_in(Z_middle3), .iteration_number(3), .X_out(X_middle4), .Y_out(Y_middle4), .Z_out(Z_middle4));
	Single_Stage_Cordic s5( .clk(clk), .X_in(X_middle4), .Y_in(Y_middle4), .Z_in(Z_middle4), .iteration_number(4), .X_out(X_middle5), .Y_out(Y_middle5), .Z_out(Z_middle5));
	Single_Stage_Cordic s6( .clk(clk), .X_in(X_middle5), .Y_in(Y_middle5), .Z_in(Z_middle5), .iteration_number(5), .X_out(X_middle6), .Y_out(Y_middle6), .Z_out(Z_middle6));
	Single_Stage_Cordic s7( .clk(clk), .X_in(X_middle6), .Y_in(Y_middle6), .Z_in(Z_middle6), .iteration_number(6), .X_out(X_middle7), .Y_out(Y_middle7), .Z_out(Z_middle7));
	Single_Stage_Cordic s8( .clk(clk), .X_in(X_middle7), .Y_in(Y_middle7), .Z_in(Z_middle7), .iteration_number(7), .X_out(X_middle8), .Y_out(Y_middle8), .Z_out(Z_middle8));
	Single_Stage_Cordic s9( .clk(clk), .X_in(X_middle8), .Y_in(Y_middle8), .Z_in(Z_middle8), .iteration_number(8), .X_out(X_middle9), .Y_out(Y_middle9), .Z_out(Z_middle9));
	Single_Stage_Cordic s10( .clk(clk), .X_in(X_middle9), .Y_in(Y_middle9), .Z_in(Z_middle9), .iteration_number(9), .X_out(X_middle10), .Y_out(Y_middle10), .Z_out(Z_middle10));
	
	
	assign X_n = X_middle10;
	assign Y_n = Y_middle10;
	assign Z_n = Z_middle10;


endmodule
