//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" LPM_DIRECTION="UP" LPM_PORT_UPDOWN="PORT_UNUSED" LPM_TYPE="LPM_COUNTER" LPM_WIDTH=0 clock q
//VERSION_BEGIN 23.1 cbx_mgl 2024:05:14:17:57:46:SC cbx_stratixii 2024:05:14:17:57:38:SC cbx_util_mgl 2024:05:14:17:57:38:SC  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2024  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = lpm_counter 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mg9ec
	( 
	clock,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	output   q;

	wire  wire_mgl_prim1_q;

	lpm_counter   mgl_prim1
	( 
	.clock(clock),
	.q(wire_mgl_prim1_q));
	defparam
		mgl_prim1.lpm_direction = "UP",
		mgl_prim1.lpm_port_updown = "PORT_UNUSED",
		mgl_prim1.lpm_type = "LPM_COUNTER",
		mgl_prim1.lpm_width = 0;
	assign
		q = wire_mgl_prim1_q;
endmodule //mg9ec
//VALID FILE
