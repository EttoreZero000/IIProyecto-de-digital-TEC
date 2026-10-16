// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Mon Oct 12 17:59:27 2026
// Host        : archlinux running 64-bit Arch Linux
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/hector/vivado/proyectos_vivados/IIProyecto/IIProyecto.sim/sim_1/synth/func/xsim/tb_comparador_3bits_func_synth.v
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module top
   (G_input,
    T_input,
    EN_input,
    STOP_input,
    motor_out,
    led_pos,
    led_mov,
    led_alarm,
    led_target,
    seg,
    an);
  input [2:0]G_input;
  input [2:0]T_input;
  input EN_input;
  input STOP_input;
  output [1:0]motor_out;
  output led_pos;
  output led_mov;
  output led_alarm;
  output [2:0]led_target;
  output [6:0]seg;
  output [3:0]an;

  wire EN_input;
  wire EN_input_IBUF;
  wire [2:0]G_input;
  wire [2:0]G_input_IBUF;
  wire STOP_input;
  wire [2:0]T_input;
  wire [3:0]an;
  wire led_alarm;
  wire led_alarm_OBUF;
  wire led_mov;
  wire led_mov_OBUF;
  wire led_pos;
  wire led_pos_OBUF;
  wire [2:0]led_target;
  wire [2:0]led_target_OBUF;
  wire [1:0]motor_out;
  wire [1:0]motor_out_OBUF;
  wire \motor_out_OBUF[1]_inst_i_2_n_0 ;
  wire \motor_out_OBUF[1]_inst_i_3_n_0 ;
  wire [6:0]seg;
  wire [6:0]seg_OBUF;

  IBUF EN_input_IBUF_inst
       (.I(EN_input),
        .O(EN_input_IBUF));
  IBUF \G_input_IBUF[0]_inst 
       (.I(G_input[0]),
        .O(G_input_IBUF[0]));
  IBUF \G_input_IBUF[1]_inst 
       (.I(G_input[1]),
        .O(G_input_IBUF[1]));
  IBUF \G_input_IBUF[2]_inst 
       (.I(G_input[2]),
        .O(G_input_IBUF[2]));
  IBUF STOP_input_IBUF_inst
       (.I(STOP_input),
        .O(led_alarm_OBUF));
  IBUF \T_input_IBUF[0]_inst 
       (.I(T_input[0]),
        .O(led_target_OBUF[0]));
  IBUF \T_input_IBUF[1]_inst 
       (.I(T_input[1]),
        .O(led_target_OBUF[1]));
  IBUF \T_input_IBUF[2]_inst 
       (.I(T_input[2]),
        .O(led_target_OBUF[2]));
  OBUF \an_OBUF[0]_inst 
       (.I(1'b0),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(1'b1),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(1'b1),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(1'b1),
        .O(an[3]));
  OBUF led_alarm_OBUF_inst
       (.I(led_alarm_OBUF),
        .O(led_alarm));
  OBUF led_mov_OBUF_inst
       (.I(led_mov_OBUF),
        .O(led_mov));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h04)) 
    led_mov_OBUF_inst_i_1
       (.I0(\motor_out_OBUF[1]_inst_i_3_n_0 ),
        .I1(led_alarm_OBUF),
        .I2(EN_input_IBUF),
        .O(led_mov_OBUF));
  OBUF led_pos_OBUF_inst
       (.I(led_pos_OBUF),
        .O(led_pos));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    led_pos_OBUF_inst_i_1
       (.I0(EN_input_IBUF),
        .I1(led_alarm_OBUF),
        .I2(\motor_out_OBUF[1]_inst_i_2_n_0 ),
        .I3(\motor_out_OBUF[1]_inst_i_3_n_0 ),
        .O(led_pos_OBUF));
  OBUF \led_target_OBUF[0]_inst 
       (.I(led_target_OBUF[0]),
        .O(led_target[0]));
  OBUF \led_target_OBUF[1]_inst 
       (.I(led_target_OBUF[1]),
        .O(led_target[1]));
  OBUF \led_target_OBUF[2]_inst 
       (.I(led_target_OBUF[2]),
        .O(led_target[2]));
  OBUF \motor_out_OBUF[0]_inst 
       (.I(motor_out_OBUF[0]),
        .O(motor_out[0]));
  LUT3 #(
    .INIT(8'h04)) 
    \motor_out_OBUF[0]_inst_i_1 
       (.I0(\motor_out_OBUF[1]_inst_i_2_n_0 ),
        .I1(led_alarm_OBUF),
        .I2(EN_input_IBUF),
        .O(motor_out_OBUF[0]));
  OBUF \motor_out_OBUF[1]_inst 
       (.I(motor_out_OBUF[1]),
        .O(motor_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00E0)) 
    \motor_out_OBUF[1]_inst_i_1 
       (.I0(\motor_out_OBUF[1]_inst_i_2_n_0 ),
        .I1(\motor_out_OBUF[1]_inst_i_3_n_0 ),
        .I2(led_alarm_OBUF),
        .I3(EN_input_IBUF),
        .O(motor_out_OBUF[1]));
  LUT6 #(
    .INIT(64'hFBF3230333B30002)) 
    \motor_out_OBUF[1]_inst_i_2 
       (.I0(led_target_OBUF[0]),
        .I1(G_input_IBUF[2]),
        .I2(G_input_IBUF[1]),
        .I3(G_input_IBUF[0]),
        .I4(led_target_OBUF[2]),
        .I5(led_target_OBUF[1]),
        .O(\motor_out_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4008021004802001)) 
    \motor_out_OBUF[1]_inst_i_3 
       (.I0(led_target_OBUF[1]),
        .I1(led_target_OBUF[2]),
        .I2(G_input_IBUF[0]),
        .I3(G_input_IBUF[1]),
        .I4(G_input_IBUF[2]),
        .I5(led_target_OBUF[0]),
        .O(\motor_out_OBUF[1]_inst_i_3_n_0 ));
  OBUF \seg_OBUF[0]_inst 
       (.I(seg_OBUF[0]),
        .O(seg[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAAAA0280)) 
    \seg_OBUF[0]_inst_i_1 
       (.I0(led_alarm_OBUF),
        .I1(G_input_IBUF[2]),
        .I2(G_input_IBUF[1]),
        .I3(G_input_IBUF[0]),
        .I4(EN_input_IBUF),
        .O(seg_OBUF[0]));
  OBUF \seg_OBUF[1]_inst 
       (.I(seg_OBUF[1]),
        .O(seg[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFDDD)) 
    \seg_OBUF[1]_inst_i_1 
       (.I0(led_alarm_OBUF),
        .I1(EN_input_IBUF),
        .I2(G_input_IBUF[0]),
        .I3(G_input_IBUF[2]),
        .O(seg_OBUF[1]));
  OBUF \seg_OBUF[2]_inst 
       (.I(seg_OBUF[2]),
        .O(seg[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hDFDDDDDD)) 
    \seg_OBUF[2]_inst_i_1 
       (.I0(led_alarm_OBUF),
        .I1(EN_input_IBUF),
        .I2(G_input_IBUF[2]),
        .I3(G_input_IBUF[1]),
        .I4(G_input_IBUF[0]),
        .O(seg_OBUF[2]));
  OBUF \seg_OBUF[3]_inst 
       (.I(seg_OBUF[3]),
        .O(seg[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hBB00AE00)) 
    \seg_OBUF[3]_inst_i_1 
       (.I0(EN_input_IBUF),
        .I1(G_input_IBUF[0]),
        .I2(G_input_IBUF[1]),
        .I3(led_alarm_OBUF),
        .I4(G_input_IBUF[2]),
        .O(seg_OBUF[3]));
  OBUF \seg_OBUF[4]_inst 
       (.I(seg_OBUF[4]),
        .O(seg[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hA88AAAA8)) 
    \seg_OBUF[4]_inst_i_1 
       (.I0(led_alarm_OBUF),
        .I1(EN_input_IBUF),
        .I2(G_input_IBUF[2]),
        .I3(G_input_IBUF[1]),
        .I4(G_input_IBUF[0]),
        .O(seg_OBUF[4]));
  OBUF \seg_OBUF[5]_inst 
       (.I(seg_OBUF[5]),
        .O(seg[5]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAFBE0000)) 
    \seg_OBUF[5]_inst_i_1 
       (.I0(EN_input_IBUF),
        .I1(G_input_IBUF[0]),
        .I2(G_input_IBUF[2]),
        .I3(G_input_IBUF[1]),
        .I4(led_alarm_OBUF),
        .O(seg_OBUF[5]));
  OBUF \seg_OBUF[6]_inst 
       (.I(seg_OBUF[6]),
        .O(seg[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00150000)) 
    \seg_OBUF[6]_inst_i_1 
       (.I0(G_input_IBUF[1]),
        .I1(G_input_IBUF[2]),
        .I2(G_input_IBUF[0]),
        .I3(EN_input_IBUF),
        .I4(led_alarm_OBUF),
        .O(seg_OBUF[6]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
