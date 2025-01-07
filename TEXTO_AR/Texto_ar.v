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
// CREATED		"Tue Jan  7 11:28:08 2025"

module Texto_ar(
	CLOCK_50,
	LEDR
);


input wire	CLOCK_50;
output wire	[9:0] LEDR;

wire	[17:0] q;
wire	[4:0] SYNTHESIZED_WIRE_0;





rt	b2v_inst(
	.clock(q[16]),
	.address(SYNTHESIZED_WIRE_0),
	.q(LEDR));


counter	b2v_inst1(
	.clock(q[17]),
	.q(SYNTHESIZED_WIRE_0));


divider	b2v_inst2(
	.clock(CLOCK_50),
	.q(q));


endmodule
