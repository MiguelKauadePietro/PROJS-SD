// Copyright (C) 2024  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"
// CREATED		"Tue Jan  7 11:33:48 2025"

module proj2(
	KEY,
	SW,
	LEDR
);


input wire	[0:0] KEY;
input wire	[1:0] SW;
output wire	[0:0] LEDR;

wire	CLK;
wire	D0;
wire	D1;
wire	nx0;
wire	nx1;
reg	Q0;
reg	Q1;
wire	x0;
wire	x1;
wire	Z0;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;





always@(posedge CLK)
begin
	begin
	Q1 <= D1;
	end
end


always@(posedge CLK)
begin
	begin
	Q0 <= D0;
	end
end

assign	D1 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_7;

assign	nx0 =  ~x0;

assign	nx1 =  ~x1;

assign	SYNTHESIZED_WIRE_4 = nx0 & nx1 & Q0;

assign	SYNTHESIZED_WIRE_1 = x1 & nx0 & Q0;

assign	SYNTHESIZED_WIRE_0 = nx0 & nx1 & Q1;

assign	SYNTHESIZED_WIRE_3 = x1 & Q1 & x0;

assign	SYNTHESIZED_WIRE_5 = nx1 & x0;

assign	Z0 = Q1 & Q0;

assign	SYNTHESIZED_WIRE_7 = Z0 | SYNTHESIZED_WIRE_3;

assign	D0 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_7;

assign	LEDR = Z0;
assign	CLK = KEY;
assign	x0 = SW[1];
assign	x0 = SW[1];
assign	x1 = SW[0];

endmodule
