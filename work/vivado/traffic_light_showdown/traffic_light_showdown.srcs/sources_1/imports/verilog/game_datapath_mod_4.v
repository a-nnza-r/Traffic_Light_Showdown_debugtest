/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_datapath_mod_4 (
    input clk,
    input rst,
    input [5:0] buttons,
    input reset_button,
    output reg [3:0] countdown,
    output reg [3:0] round_no,
    output reg [3:0] p1_score,
    output reg [3:0] p2_score,
    output reg [4:0] game_display,
    input next_state_btn,
    input increase_time,
    output reg [5:0] current_state,
    output reg [2:0] asel_debug,
    output reg [2:0] bsel_debug,
    output reg [2:0] wdsel_debug,
    output reg [7:0] debug_word,
    output reg [2:0] debug_p1button,
    output reg [2:0] debugansreg,
    output reg debugp1ban,
    output reg debugp2ban,
    output reg [2:0] debugp2btn,
    output reg [15:0] debugregF
  );
  
  
  
  reg [15:0] asel_out;
  
  reg [15:0] bsel_out;
  
  wire [16-1:0] M_alu_unit_out;
  wire [3-1:0] M_alu_unit_zvn;
  reg [16-1:0] M_alu_unit_a;
  reg [16-1:0] M_alu_unit_b;
  reg [1-1:0] M_alu_unit_inv;
  reg [6-1:0] M_alu_unit_alufn_signal;
  alu_10 alu_unit (
    .a(M_alu_unit_a),
    .b(M_alu_unit_b),
    .inv(M_alu_unit_inv),
    .alufn_signal(M_alu_unit_alufn_signal),
    .out(M_alu_unit_out),
    .zvn(M_alu_unit_zvn)
  );
  
  wire [8-1:0] M_rrg_unit_out;
  reg [1-1:0] M_rrg_unit_generate_next;
  random_round_genrator_11 rrg_unit (
    .clk(clk),
    .rst(reset_button),
    .generate_next(M_rrg_unit_generate_next),
    .out(M_rrg_unit_out)
  );
  wire [16-1:0] M_regfile_unit_out_a;
  wire [16-1:0] M_regfile_unit_out_b;
  wire [16-1:0] M_regfile_unit_p1_score;
  wire [16-1:0] M_regfile_unit_p2_score;
  wire [16-1:0] M_regfile_unit_display_config;
  wire [16-1:0] M_regfile_unit_round_no;
  wire [16-1:0] M_regfile_unit_count_down;
  wire [3-1:0] M_regfile_unit_debugg_p1_button;
  wire [3-1:0] M_regfile_unit_debugansreg;
  wire [1-1:0] M_regfile_unit_debugp1ban;
  wire [1-1:0] M_regfile_unit_debugp2ban;
  wire [3-1:0] M_regfile_unit_debugp2btn;
  wire [16-1:0] M_regfile_unit_debugregF;
  reg [1-1:0] M_regfile_unit_we;
  reg [16-1:0] M_regfile_unit_data;
  reg [4-1:0] M_regfile_unit_write_address;
  reg [4-1:0] M_regfile_unit_read_address_a;
  reg [4-1:0] M_regfile_unit_read_address_b;
  regfile_mod_12 regfile_unit (
    .clk(clk),
    .rst(reset_button),
    .we(M_regfile_unit_we),
    .data(M_regfile_unit_data),
    .write_address(M_regfile_unit_write_address),
    .read_address_a(M_regfile_unit_read_address_a),
    .read_address_b(M_regfile_unit_read_address_b),
    .out_a(M_regfile_unit_out_a),
    .out_b(M_regfile_unit_out_b),
    .p1_score(M_regfile_unit_p1_score),
    .p2_score(M_regfile_unit_p2_score),
    .display_config(M_regfile_unit_display_config),
    .round_no(M_regfile_unit_round_no),
    .count_down(M_regfile_unit_count_down),
    .debugg_p1_button(M_regfile_unit_debugg_p1_button),
    .debugansreg(M_regfile_unit_debugansreg),
    .debugp1ban(M_regfile_unit_debugp1ban),
    .debugp2ban(M_regfile_unit_debugp2ban),
    .debugp2btn(M_regfile_unit_debugp2btn),
    .debugregF(M_regfile_unit_debugregF)
  );
  wire [6-1:0] M_game_cu_alufn;
  wire [3-1:0] M_game_cu_asel;
  wire [3-1:0] M_game_cu_bsel;
  wire [3-1:0] M_game_cu_wdsel;
  wire [4-1:0] M_game_cu_regfile_write_address;
  wire [4-1:0] M_game_cu_regfile_read_address_a;
  wire [4-1:0] M_game_cu_regfile_read_address_b;
  wire [1-1:0] M_game_cu_we_regfile;
  wire [1-1:0] M_game_cu_seg_sel;
  wire [1-1:0] M_game_cu_rrg_generate_next;
  wire [6-1:0] M_game_cu_current_state;
  reg [16-1:0] M_game_cu_regfile_rb_direct;
  reg [1-1:0] M_game_cu_slow_clock;
  reg [6-1:0] M_game_cu_buttons;
  reg [1-1:0] M_game_cu_reset_button;
  reg [1-1:0] M_game_cu_next_ste_btn;
  game_cu_mod_13 game_cu (
    .clk(clk),
    .rst(reset_button),
    .regfile_rb_direct(M_game_cu_regfile_rb_direct),
    .slow_clock(M_game_cu_slow_clock),
    .buttons(M_game_cu_buttons),
    .reset_button(M_game_cu_reset_button),
    .next_ste_btn(M_game_cu_next_ste_btn),
    .alufn(M_game_cu_alufn),
    .asel(M_game_cu_asel),
    .bsel(M_game_cu_bsel),
    .wdsel(M_game_cu_wdsel),
    .regfile_write_address(M_game_cu_regfile_write_address),
    .regfile_read_address_a(M_game_cu_regfile_read_address_a),
    .regfile_read_address_b(M_game_cu_regfile_read_address_b),
    .we_regfile(M_game_cu_we_regfile),
    .seg_sel(M_game_cu_seg_sel),
    .rrg_generate_next(M_game_cu_rrg_generate_next),
    .current_state(M_game_cu_current_state)
  );
  
  always @* begin
    M_game_cu_next_ste_btn = next_state_btn;
    M_game_cu_slow_clock = increase_time;
    M_game_cu_buttons = buttons;
    M_game_cu_reset_button = reset_button;
    M_regfile_unit_we = M_game_cu_we_regfile;
    M_regfile_unit_write_address = M_game_cu_regfile_write_address;
    M_regfile_unit_read_address_a = M_game_cu_regfile_read_address_a;
    M_regfile_unit_read_address_b = M_game_cu_regfile_read_address_b;
    M_game_cu_regfile_rb_direct = M_regfile_unit_out_b;
    M_rrg_unit_generate_next = M_game_cu_rrg_generate_next;
    
    case (M_game_cu_asel)
      3'h0: begin
        asel_out = M_regfile_unit_out_a;
      end
      3'h1: begin
        asel_out = 16'h0007;
      end
      3'h2: begin
        asel_out = 16'h0008;
      end
      3'h3: begin
        asel_out = 16'h7fff;
      end
      3'h4: begin
        asel_out = 16'h0000;
      end
      3'h5: begin
        asel_out = 16'h00f8;
      end
      default: begin
        asel_out = 1'h0;
      end
    endcase
    
    case (M_game_cu_bsel)
      3'h0: begin
        bsel_out = M_regfile_unit_out_b;
      end
      3'h1: begin
        bsel_out = 16'h0003;
      end
      3'h2: begin
        bsel_out = 16'h0006;
      end
      3'h3: begin
        bsel_out = 16'h0000;
      end
      3'h4: begin
        bsel_out = 16'h0001;
      end
      3'h1: begin
        bsel_out = 16'h0038;
      end
      default: begin
        bsel_out = 1'h0;
      end
    endcase
    M_alu_unit_a = asel_out;
    M_alu_unit_b = bsel_out;
    M_alu_unit_inv = 1'h0;
    M_alu_unit_alufn_signal = M_game_cu_alufn;
    
    case (M_game_cu_wdsel)
      3'h0: begin
        M_regfile_unit_data = M_alu_unit_out;
      end
      3'h1: begin
        M_regfile_unit_data = 16'h0001;
      end
      3'h2: begin
        M_regfile_unit_data = 16'h0003;
      end
      3'h3: begin
        M_regfile_unit_data = 16'h0005;
      end
      3'h4: begin
        M_regfile_unit_data = 16'h0000;
      end
      3'h5: begin
        M_regfile_unit_data = M_rrg_unit_out;
      end
      3'h6: begin
        M_regfile_unit_data = buttons;
      end
      default: begin
        M_regfile_unit_data = 16'h0000;
      end
    endcase
    
    case (M_game_cu_seg_sel)
      1'h1: begin
        game_display = M_regfile_unit_display_config[0+4-:5];
      end
      default: begin
        game_display = 5'h1f;
      end
    endcase
    countdown = M_regfile_unit_count_down[0+3-:4];
    round_no = M_regfile_unit_round_no[0+3-:4];
    p1_score = M_regfile_unit_p1_score[0+3-:4];
    p2_score = M_regfile_unit_p2_score[0+3-:4];
    asel_debug = M_game_cu_asel;
    bsel_debug = M_game_cu_bsel;
    wdsel_debug = M_game_cu_wdsel;
    current_state = M_game_cu_current_state;
    debug_word = M_rrg_unit_out;
    debug_p1button = M_regfile_unit_debugg_p1_button;
    debugansreg = M_regfile_unit_debugansreg;
    debugp1ban = M_regfile_unit_debugp1ban;
    debugp2ban = M_regfile_unit_debugp2ban;
    debugp2btn = M_regfile_unit_debugp2btn;
    debugregF = M_regfile_unit_debugregF;
  end
endmodule
