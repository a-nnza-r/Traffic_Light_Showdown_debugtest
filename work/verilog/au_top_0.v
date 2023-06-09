/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_1 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_game_reset_btn_cond_out;
  reg [1-1:0] M_game_reset_btn_cond_in;
  button_conditioner_3 game_reset_btn_cond (
    .clk(clk),
    .in(M_game_reset_btn_cond_in),
    .out(M_game_reset_btn_cond_out)
  );
  wire [(3'h6+0)-1:0] M_player_button_cond_out;
  reg [(3'h6+0)-1:0] M_player_button_cond_in;
  
  genvar GEN_player_button_cond0;
  generate
  for (GEN_player_button_cond0=0;GEN_player_button_cond0<3'h6;GEN_player_button_cond0=GEN_player_button_cond0+1) begin: player_button_cond_gen_0
    button_conditioner_3 player_button_cond (
      .clk(clk),
      .in(M_player_button_cond_in[GEN_player_button_cond0*(1)+(1)-1-:(1)]),
      .out(M_player_button_cond_out[GEN_player_button_cond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [4-1:0] M_game_machine_countdown;
  wire [4-1:0] M_game_machine_round_no;
  wire [4-1:0] M_game_machine_p1_score;
  wire [4-1:0] M_game_machine_p2_score;
  wire [5-1:0] M_game_machine_game_display;
  wire [6-1:0] M_game_machine_current_state;
  wire [3-1:0] M_game_machine_asel_debug;
  wire [3-1:0] M_game_machine_bsel_debug;
  wire [3-1:0] M_game_machine_wdsel_debug;
  wire [8-1:0] M_game_machine_debug_word;
  wire [3-1:0] M_game_machine_debug_p1button;
  wire [3-1:0] M_game_machine_debugansreg;
  wire [1-1:0] M_game_machine_debugp1ban;
  wire [1-1:0] M_game_machine_debugp2ban;
  wire [3-1:0] M_game_machine_debugp2btn;
  wire [16-1:0] M_game_machine_debugregF;
  reg [1-1:0] M_game_machine_rst;
  reg [6-1:0] M_game_machine_buttons;
  reg [1-1:0] M_game_machine_reset_button;
  reg [1-1:0] M_game_machine_next_state_btn;
  reg [1-1:0] M_game_machine_increase_time;
  game_datapath_mod_4 game_machine (
    .clk(clk),
    .rst(M_game_machine_rst),
    .buttons(M_game_machine_buttons),
    .reset_button(M_game_machine_reset_button),
    .next_state_btn(M_game_machine_next_state_btn),
    .increase_time(M_game_machine_increase_time),
    .countdown(M_game_machine_countdown),
    .round_no(M_game_machine_round_no),
    .p1_score(M_game_machine_p1_score),
    .p2_score(M_game_machine_p2_score),
    .game_display(M_game_machine_game_display),
    .current_state(M_game_machine_current_state),
    .asel_debug(M_game_machine_asel_debug),
    .bsel_debug(M_game_machine_bsel_debug),
    .wdsel_debug(M_game_machine_wdsel_debug),
    .debug_word(M_game_machine_debug_word),
    .debug_p1button(M_game_machine_debug_p1button),
    .debugansreg(M_game_machine_debugansreg),
    .debugp1ban(M_game_machine_debugp1ban),
    .debugp2ban(M_game_machine_debugp2ban),
    .debugp2btn(M_game_machine_debugp2btn),
    .debugregF(M_game_machine_debugregF)
  );
  wire [(3'h6+0)-1:0] M_player_buttons_detectors_out;
  reg [(3'h6+0)-1:0] M_player_buttons_detectors_in;
  
  genvar GEN_player_buttons_detectors0;
  generate
  for (GEN_player_buttons_detectors0=0;GEN_player_buttons_detectors0<3'h6;GEN_player_buttons_detectors0=GEN_player_buttons_detectors0+1) begin: player_buttons_detectors_gen_0
    edge_detector_5 player_buttons_detectors (
      .clk(clk),
      .in(M_player_buttons_detectors_in[GEN_player_buttons_detectors0*(1)+(1)-1-:(1)]),
      .out(M_player_buttons_detectors_out[GEN_player_buttons_detectors0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [1-1:0] M_reset_button_detector_out;
  reg [1-1:0] M_reset_button_detector_in;
  edge_detector_5 reset_button_detector (
    .clk(clk),
    .in(M_reset_button_detector_in),
    .out(M_reset_button_detector_out)
  );
  wire [1-1:0] M_next_state_btn_ctd_out;
  reg [1-1:0] M_next_state_btn_ctd_in;
  button_conditioner_3 next_state_btn_ctd (
    .clk(clk),
    .in(M_next_state_btn_ctd_in),
    .out(M_next_state_btn_ctd_out)
  );
  wire [1-1:0] M_next_state_btn_detect_out;
  reg [1-1:0] M_next_state_btn_detect_in;
  edge_detector_5 next_state_btn_detect (
    .clk(clk),
    .in(M_next_state_btn_detect_in),
    .out(M_next_state_btn_detect_out)
  );
  wire [1-1:0] M_increse_time_btn_ctd_out;
  reg [1-1:0] M_increse_time_btn_ctd_in;
  button_conditioner_3 increse_time_btn_ctd (
    .clk(clk),
    .in(M_increse_time_btn_ctd_in),
    .out(M_increse_time_btn_ctd_out)
  );
  wire [1-1:0] M_increse_time_btn_detect_out;
  reg [1-1:0] M_increse_time_btn_detect_in;
  edge_detector_5 increse_time_btn_detect (
    .clk(clk),
    .in(M_increse_time_btn_detect_in),
    .out(M_increse_time_btn_detect_out)
  );
  
  reg [5:0] player_button;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    M_seg_values = 16'hffff;
    player_button[5+0-:1] = 1'h0;
    player_button[4+0-:1] = 1'h0;
    player_button[3+0-:1] = 1'h0;
    player_button[2+0-:1] = 1'h0;
    player_button[1+0-:1] = io_button[1+0-:1];
    player_button[0+0-:1] = io_button[4+0-:1];
    player_button[2+0-:1] = 1'h0;
    M_next_state_btn_ctd_in = io_button[2+0-:1];
    M_increse_time_btn_ctd_in = io_button[3+0-:1];
    M_next_state_btn_detect_in = M_next_state_btn_ctd_out;
    M_increse_time_btn_detect_in = M_increse_time_btn_ctd_out;
    M_game_machine_next_state_btn = M_next_state_btn_detect_out;
    M_game_machine_increase_time = M_increse_time_btn_detect_out;
    M_game_reset_btn_cond_in = io_button[0+0-:1];
    M_player_button_cond_in = player_button;
    M_reset_button_detector_in = M_game_reset_btn_cond_out;
    M_player_buttons_detectors_in = M_player_button_cond_out;
    M_game_machine_rst = rst;
    M_game_machine_buttons = M_player_buttons_detectors_out;
    M_game_machine_reset_button = M_reset_button_detector_out;
    M_seg_values = {M_game_machine_round_no, M_game_machine_countdown, M_game_machine_p1_score, M_game_machine_p2_score};
    io_led[16+7+0-:1] = M_game_machine_debugp2ban;
    io_led[16+0+6-:7] = M_game_machine_current_state;
    io_led[8+5+2-:3] = M_game_machine_debugp2btn;
    io_led[8+0+2-:3] = M_game_machine_debugansreg;
    io_led[0+7-:8] = M_game_machine_debugregF[0+7-:8];
  end
endmodule
