/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_cu_mod_13 (
    input clk,
    input rst,
    input [15:0] regfile_rb_direct,
    input slow_clock,
    input [5:0] buttons,
    input reset_button,
    output reg [5:0] alufn,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [2:0] wdsel,
    output reg [3:0] regfile_write_address,
    output reg [3:0] regfile_read_address_a,
    output reg [3:0] regfile_read_address_b,
    output reg we_regfile,
    output reg seg_sel,
    output reg rrg_generate_next,
    output reg [5:0] current_state,
    input next_ste_btn
  );
  
  
  
  localparam O1_game_fsm = 6'd0;
  localparam O2_game_fsm = 6'd1;
  localparam O3_game_fsm = 6'd2;
  localparam IN_GAME_IDLE_game_fsm = 6'd3;
  localparam STORE_P2_game_fsm = 6'd4;
  localparam STORE_P1_game_fsm = 6'd5;
  localparam CHECK_P1_game_fsm = 6'd6;
  localparam BRANCH_P1_OR_P2_game_fsm = 6'd7;
  localparam CHECK_P2_BAN_game_fsm = 6'd8;
  localparam BRANCH_P2_BAN_game_fsm = 6'd9;
  localparam IS_P2_CORRECT_game_fsm = 6'd10;
  localparam BRANCH_P2_CORRECT_game_fsm = 6'd11;
  localparam SET_P2_BAN_game_fsm = 6'd12;
  localparam INCREASE_P2_game_fsm = 6'd13;
  localparam CHECK_P1_BAN_game_fsm = 6'd14;
  localparam BRANCH_P1_BAN_game_fsm = 6'd15;
  localparam IS_P1_CORRECT_game_fsm = 6'd16;
  localparam BRANCH_P1_CORRECT_game_fsm = 6'd17;
  localparam SET_P1_BAN_game_fsm = 6'd18;
  localparam INCREASE_P1_game_fsm = 6'd19;
  localparam CHECK_ROUNDS_GT_8_game_fsm = 6'd20;
  localparam BRANCH_ROUNDS_1_game_fsm = 6'd21;
  localparam INC_ROUNDS_game_fsm = 6'd22;
  localparam SET_COUNTDOWN_1_game_fsm = 6'd23;
  localparam CHECK_ROUNDS_LE_3_game_fsm = 6'd24;
  localparam BRANCH_ROUNDS_2_game_fsm = 6'd25;
  localparam SET_COUNTDOWN_5_game_fsm = 6'd26;
  localparam CHECK_ROUNDS_LE_6_game_fsm = 6'd27;
  localparam SET_COUNTDOWN_3_game_fsm = 6'd28;
  localparam BRANCH_ROUNDS_3_game_fsm = 6'd29;
  localparam CHECK_P1_BAN_GT_0_game_fsm = 6'd30;
  localparam BRANCH_P1_BAN_PURPLE_game_fsm = 6'd31;
  localparam DECREMENT_P1_BAN_game_fsm = 6'd32;
  localparam CHECK_P2_BAN_GT_0_game_fsm = 6'd33;
  localparam BRANCH_P2_BAN_PURPLE_game_fsm = 6'd34;
  localparam DECREMENT_P2_BAN_game_fsm = 6'd35;
  localparam CHECK_COUNTDOWN_GT_0_PURPLE_game_fsm = 6'd36;
  localparam BRANCH_COUNTDOWN_game_fsm = 6'd37;
  localparam DECREMENT_COUNTDOWN_game_fsm = 6'd38;
  localparam P1_CMPEQ_P2_game_fsm = 6'd39;
  localparam BRANCH_DRAW_game_fsm = 6'd40;
  localparam DRAW_game_fsm = 6'd41;
  localparam CHECK_WINNER_game_fsm = 6'd42;
  localparam BRANCH_WINNER_game_fsm = 6'd43;
  localparam P1_WINS_game_fsm = 6'd44;
  localparam P2_WINS_game_fsm = 6'd45;
  localparam GAMEOVER_game_fsm = 6'd46;
  localparam SET_ROUNDS_1_game_fsm = 6'd47;
  localparam SET_ROUND_COUNTDOWN_5_game_fsm = 6'd48;
  localparam PRE_IDLE_game_fsm = 6'd49;
  localparam RESET_P1_BTN_game_fsm = 6'd50;
  localparam RESET_P2_BTN_game_fsm = 6'd51;
  
  reg [5:0] M_game_fsm_d, M_game_fsm_q = O1_game_fsm;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    alufn = 6'h00;
    asel = 3'h0;
    bsel = 3'h0;
    regfile_read_address_a = 4'h0;
    regfile_read_address_b = 4'h0;
    regfile_write_address = 4'hd;
    we_regfile = 1'h0;
    wdsel = 3'h0;
    seg_sel = 1'h0;
    current_state = 8'h00;
    rrg_generate_next = 1'h0;
    if (rst) begin
      M_game_fsm_d = SET_ROUNDS_1_game_fsm;
    end else begin
      if (reset_button) begin
        M_game_fsm_d = SET_ROUNDS_1_game_fsm;
      end else begin
        
        case (M_game_fsm_q)
          O1_game_fsm: begin
            wdsel = 3'h5;
            regfile_write_address = 4'hb;
            we_regfile = 1'h1;
            current_state = 8'h01;
            if (next_ste_btn) begin
              M_game_fsm_d = O2_game_fsm;
            end
          end
          O2_game_fsm: begin
            alufn = 6'h18;
            asel = 3'h1;
            we_regfile = 1'h1;
            regfile_read_address_b = 4'hb;
            regfile_write_address = 4'h7;
            current_state = 8'h02;
            if (next_ste_btn) begin
              M_game_fsm_d = O3_game_fsm;
            end
          end
          O3_game_fsm: begin
            regfile_read_address_a = 4'hb;
            alufn = 6'h21;
            asel = 3'h0;
            bsel = 3'h1;
            we_regfile = 1'h1;
            regfile_write_address = 4'h2;
            current_state = 8'h03;
            if (next_ste_btn) begin
              M_game_fsm_d = IN_GAME_IDLE_game_fsm;
            end
          end
          IN_GAME_IDLE_game_fsm: begin
            regfile_write_address = 4'hf;
            we_regfile = 1'h1;
            wdsel = 3'h6;
            seg_sel = 1'h1;
            current_state = 8'h04;
            if (reset_button) begin
              M_game_fsm_d = SET_ROUNDS_1_game_fsm;
            end else begin
              if (slow_clock) begin
                M_game_fsm_d = CHECK_P1_BAN_GT_0_game_fsm;
              end else begin
                if ((|buttons)) begin
                  M_game_fsm_d = STORE_P2_game_fsm;
                end else begin
                  M_game_fsm_d = IN_GAME_IDLE_game_fsm;
                end
              end
            end
          end
          STORE_P2_game_fsm: begin
            regfile_read_address_b = 4'hf;
            alufn = 6'h18;
            asel = 3'h1;
            we_regfile = 1'h1;
            regfile_write_address = 4'h6;
            seg_sel = 1'h1;
            current_state = 8'h05;
            if (next_ste_btn) begin
              M_game_fsm_d = STORE_P1_game_fsm;
            end
          end
          STORE_P1_game_fsm: begin
            regfile_read_address_a = 4'hf;
            alufn = 6'h21;
            bsel = 3'h1;
            we_regfile = 1'h1;
            regfile_write_address = 4'h5;
            seg_sel = 1'h1;
            current_state = 8'h06;
            if (next_ste_btn) begin
              M_game_fsm_d = CHECK_P1_game_fsm;
            end
          end
          CHECK_P1_game_fsm: begin
            alufn = 6'h35;
            bsel = 3'h2;
            regfile_read_address_a = 4'hf;
            regfile_write_address = 4'hc;
            we_regfile = 1'h1;
            seg_sel = 1'h1;
            current_state = 8'h07;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P1_OR_P2_game_fsm;
            end
          end
          BRANCH_P1_OR_P2_game_fsm: begin
            regfile_read_address_b = 4'hc;
            seg_sel = 1'h1;
            current_state = 8'h08;
            if (next_ste_btn && regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = CHECK_P2_BAN_game_fsm;
            end
            if (next_ste_btn && regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = CHECK_P1_BAN_game_fsm;
            end
          end
          CHECK_P2_BAN_game_fsm: begin
            alufn = 6'h33;
            regfile_read_address_a = 4'ha;
            bsel = 3'h3;
            regfile_write_address = 4'hf;
            we_regfile = 1'h1;
            seg_sel = 1'h1;
            current_state = 8'h09;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P2_BAN_game_fsm;
            end
          end
          BRANCH_P2_BAN_game_fsm: begin
            regfile_read_address_b = 4'hf;
            seg_sel = 1'h1;
            current_state = 8'h0a;
            if (next_ste_btn && regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = IS_P2_CORRECT_game_fsm;
            end
            if (next_ste_btn && regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = IN_GAME_IDLE_game_fsm;
            end
          end
          IS_P2_CORRECT_game_fsm: begin
            alufn = 6'h33;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'h6;
            regfile_read_address_b = 4'h7;
            regfile_write_address = 4'hf;
            seg_sel = 1'h1;
            current_state = 8'h0b;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P2_CORRECT_game_fsm;
            end
          end
          BRANCH_P2_CORRECT_game_fsm: begin
            regfile_read_address_b = 4'hf;
            seg_sel = 1'h1;
            current_state = 8'h0c;
            if (next_ste_btn && regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = INCREASE_P2_game_fsm;
            end
            if (next_ste_btn && regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = SET_P2_BAN_game_fsm;
            end
          end
          SET_P2_BAN_game_fsm: begin
            alufn = 6'h03;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'ha;
            regfile_write_address = 4'ha;
            seg_sel = 1'h1;
            M_game_fsm_d = RESET_P2_BTN_game_fsm;
            current_state = 8'h0d;
          end
          RESET_P2_BTN_game_fsm: begin
            wdsel = 3'h4;
            regfile_write_address = 4'h6;
            we_regfile = 1'h1;
            M_game_fsm_d = IN_GAME_IDLE_game_fsm;
          end
          INCREASE_P2_game_fsm: begin
            alufn = 6'h03;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'h1;
            regfile_write_address = 4'h1;
            M_game_fsm_d = CHECK_ROUNDS_GT_8_game_fsm;
            current_state = 8'h0e;
          end
          CHECK_P1_BAN_game_fsm: begin
            alufn = 6'h33;
            bsel = 3'h3;
            regfile_read_address_a = 4'h9;
            regfile_write_address = 4'he;
            we_regfile = 1'h1;
            seg_sel = 3'h1;
            current_state = 8'h0f;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P1_BAN_game_fsm;
            end
          end
          BRANCH_P1_BAN_game_fsm: begin
            regfile_read_address_b = 4'he;
            seg_sel = 1'h1;
            current_state = 8'h10;
            if (next_ste_btn && regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = IS_P1_CORRECT_game_fsm;
            end
            if (next_ste_btn && regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = IN_GAME_IDLE_game_fsm;
            end
          end
          IS_P1_CORRECT_game_fsm: begin
            regfile_read_address_a = 4'h5;
            regfile_read_address_b = 4'h7;
            alufn = 6'h33;
            we_regfile = 1'h1;
            regfile_write_address = 4'he;
            seg_sel = 1'h1;
            current_state = 8'h11;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P1_CORRECT_game_fsm;
            end
          end
          BRANCH_P1_CORRECT_game_fsm: begin
            regfile_read_address_b = 4'he;
            seg_sel = 1'h1;
            current_state = 8'h12;
            if (next_ste_btn && regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = INCREASE_P1_game_fsm;
            end
            if (next_ste_btn && regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = SET_P1_BAN_game_fsm;
            end
          end
          SET_P1_BAN_game_fsm: begin
            alufn = 6'h03;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'h9;
            regfile_write_address = 4'h9;
            seg_sel = 1'h1;
            M_game_fsm_d = RESET_P1_BTN_game_fsm;
            current_state = 8'h13;
          end
          RESET_P1_BTN_game_fsm: begin
            wdsel = 3'h4;
            regfile_write_address = 4'h5;
            we_regfile = 1'h1;
            M_game_fsm_d = IN_GAME_IDLE_game_fsm;
          end
          INCREASE_P1_game_fsm: begin
            alufn = 6'h03;
            we_regfile = 1'h1;
            regfile_write_address = 8'h00;
            M_game_fsm_d = CHECK_ROUNDS_GT_8_game_fsm;
            current_state = 8'h14;
          end
          CHECK_ROUNDS_GT_8_game_fsm: begin
            alufn = 6'h35;
            asel = 3'h2;
            we_regfile = 1'h1;
            regfile_read_address_b = 4'h4;
            regfile_write_address = 4'hf;
            current_state = 8'h15;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_ROUNDS_1_game_fsm;
            end
          end
          BRANCH_ROUNDS_1_game_fsm: begin
            regfile_read_address_b = 4'hf;
            if (regfile_rb_direct == 1'h0) begin
              rrg_generate_next = 1'h1;
              M_game_fsm_d = INC_ROUNDS_game_fsm;
            end else begin
              M_game_fsm_d = P1_CMPEQ_P2_game_fsm;
            end
            current_state = 8'h16;
          end
          INC_ROUNDS_game_fsm: begin
            alufn = 6'h03;
            we_regfile = 1'h1;
            regfile_read_address_a = 4'h4;
            regfile_write_address = 4'h4;
            M_game_fsm_d = SET_COUNTDOWN_1_game_fsm;
            current_state = 8'h17;
          end
          SET_COUNTDOWN_1_game_fsm: begin
            we_regfile = 1'h1;
            regfile_write_address = 4'h8;
            wdsel = 3'h1;
            current_state = 8'h17;
            if (next_ste_btn) begin
              M_game_fsm_d = CHECK_ROUNDS_LE_3_game_fsm;
            end
          end
          CHECK_ROUNDS_LE_3_game_fsm: begin
            alufn = 6'h37;
            we_regfile = 1'h1;
            bsel = 3'h1;
            regfile_read_address_a = 4'h4;
            regfile_write_address = 4'hf;
            current_state = 8'h17;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_ROUNDS_2_game_fsm;
            end
          end
          BRANCH_ROUNDS_2_game_fsm: begin
            regfile_read_address_b = 4'hf;
            if (regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = SET_COUNTDOWN_5_game_fsm;
            end else begin
              M_game_fsm_d = CHECK_ROUNDS_LE_6_game_fsm;
            end
            current_state = 8'h18;
          end
          SET_COUNTDOWN_5_game_fsm: begin
            we_regfile = 1'h1;
            regfile_write_address = 4'h8;
            wdsel = 3'h3;
            current_state = 8'h19;
            if (next_ste_btn) begin
              M_game_fsm_d = O1_game_fsm;
            end
          end
          CHECK_ROUNDS_LE_6_game_fsm: begin
            alufn = 6'h37;
            regfile_read_address_a = 4'h4;
            bsel = 3'h2;
            we_regfile = 1'h1;
            regfile_write_address = 4'hf;
            current_state = 8'h1a;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_ROUNDS_3_game_fsm;
            end
          end
          SET_COUNTDOWN_3_game_fsm: begin
            we_regfile = 1'h1;
            regfile_write_address = 4'h8;
            wdsel = 3'h2;
            current_state = 8'h1b;
            if (next_ste_btn) begin
              M_game_fsm_d = O1_game_fsm;
            end
          end
          BRANCH_ROUNDS_3_game_fsm: begin
            regfile_read_address_b = 4'hf;
            if (regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = SET_COUNTDOWN_3_game_fsm;
            end else begin
              M_game_fsm_d = O1_game_fsm;
            end
            current_state = 8'h1c;
          end
          CHECK_P1_BAN_GT_0_game_fsm: begin
            alufn = 6'h35;
            asel = 3'h4;
            we_regfile = 1'h1;
            regfile_read_address_b = 4'h9;
            regfile_write_address = 4'hf;
            seg_sel = 1'h1;
            current_state = 8'h1d;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P1_BAN_PURPLE_game_fsm;
            end
          end
          BRANCH_P1_BAN_PURPLE_game_fsm: begin
            regfile_read_address_b = 4'hf;
            seg_sel = 1'h1;
            if (regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = CHECK_P2_BAN_GT_0_game_fsm;
            end else begin
              M_game_fsm_d = DECREMENT_P1_BAN_game_fsm;
            end
            current_state = 8'h1e;
          end
          DECREMENT_P1_BAN_game_fsm: begin
            alufn = 6'h1a;
            asel = 3'h4;
            we_regfile = 1'h1;
            regfile_write_address = 4'h9;
            seg_sel = 1'h1;
            M_game_fsm_d = CHECK_P2_BAN_GT_0_game_fsm;
            current_state = 8'h1f;
          end
          CHECK_P2_BAN_GT_0_game_fsm: begin
            alufn = 6'h35;
            asel = 3'h4;
            we_regfile = 1'h1;
            regfile_read_address_b = 4'ha;
            regfile_write_address = 4'he;
            seg_sel = 1'h1;
            current_state = 8'h20;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_P2_BAN_PURPLE_game_fsm;
            end
          end
          BRANCH_P2_BAN_PURPLE_game_fsm: begin
            regfile_read_address_b = 4'he;
            seg_sel = 1'h1;
            if (regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = CHECK_COUNTDOWN_GT_0_PURPLE_game_fsm;
            end else begin
              M_game_fsm_d = DECREMENT_P2_BAN_game_fsm;
            end
            current_state = 8'h21;
          end
          DECREMENT_P2_BAN_game_fsm: begin
            alufn = 6'h1a;
            asel = 3'h4;
            we_regfile = 1'h1;
            regfile_write_address = 4'ha;
            seg_sel = 1'h1;
            M_game_fsm_d = CHECK_COUNTDOWN_GT_0_PURPLE_game_fsm;
            current_state = 8'h22;
          end
          CHECK_COUNTDOWN_GT_0_PURPLE_game_fsm: begin
            alufn = 6'h37;
            regfile_read_address_a = 4'h8;
            regfile_read_address_b = 4'h0;
            asel = 3'h0;
            bsel = 3'h3;
            regfile_write_address = 4'hf;
            wdsel = 3'h0;
            we_regfile = 1'h1;
            seg_sel = 1'h1;
            M_game_fsm_d = BRANCH_COUNTDOWN_game_fsm;
            current_state = 8'h22;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_COUNTDOWN_game_fsm;
            end
          end
          BRANCH_COUNTDOWN_game_fsm: begin
            regfile_read_address_b = 4'hf;
            seg_sel = 1'h1;
            if (regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = CHECK_ROUNDS_GT_8_game_fsm;
            end else begin
              M_game_fsm_d = DECREMENT_COUNTDOWN_game_fsm;
            end
            current_state = 8'h23;
          end
          DECREMENT_COUNTDOWN_game_fsm: begin
            alufn = 6'h01;
            regfile_read_address_a = 4'h8;
            asel = 3'h0;
            bsel = 3'h4;
            wdsel = 3'h0;
            we_regfile = 1'h1;
            regfile_write_address = 4'h8;
            seg_sel = 1'h1;
            M_game_fsm_d = IN_GAME_IDLE_game_fsm;
            current_state = 8'h24;
          end
          P1_CMPEQ_P2_game_fsm: begin
            alufn = 6'h33;
            we_regfile = 1'h1;
            regfile_read_address_b = 4'h1;
            regfile_write_address = 4'hf;
            current_state = 8'h25;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_DRAW_game_fsm;
            end
          end
          BRANCH_DRAW_game_fsm: begin
            regfile_read_address_b = 4'hf;
            if (regfile_rb_direct == 1'h1) begin
              M_game_fsm_d = DRAW_game_fsm;
            end else begin
              M_game_fsm_d = CHECK_WINNER_game_fsm;
            end
            current_state = 8'h26;
          end
          DRAW_game_fsm: begin
            alufn = 6'h02;
            asel = 3'h1;
            bsel = 3'h1;
            we_regfile = 1'h1;
            regfile_write_address = 4'h2;
            current_state = 8'h27;
            if (next_ste_btn) begin
              M_game_fsm_d = GAMEOVER_game_fsm;
            end
          end
          CHECK_WINNER_game_fsm: begin
            alufn = 6'h35;
            we_regfile = 1'h1;
            regfile_read_address_b = 4'h1;
            regfile_write_address = 4'hd;
            current_state = 8'h28;
            if (next_ste_btn) begin
              M_game_fsm_d = BRANCH_WINNER_game_fsm;
            end
          end
          BRANCH_WINNER_game_fsm: begin
            regfile_read_address_b = 4'hd;
            if (regfile_rb_direct == 1'h0) begin
              M_game_fsm_d = P1_WINS_game_fsm;
            end else begin
              M_game_fsm_d = P2_WINS_game_fsm;
            end
            current_state = 8'h29;
          end
          P1_WINS_game_fsm: begin
            alufn = 6'h02;
            asel = 3'h2;
            bsel = 3'h1;
            we_regfile = 1'h1;
            regfile_write_address = 4'h2;
            current_state = 8'h2a;
            if (next_ste_btn) begin
              M_game_fsm_d = GAMEOVER_game_fsm;
            end
          end
          P2_WINS_game_fsm: begin
            alufn = 6'h21;
            asel = 3'h5;
            bsel = 3'h1;
            we_regfile = 1'h1;
            regfile_write_address = 4'h2;
            current_state = 8'h2b;
            if (next_ste_btn) begin
              M_game_fsm_d = GAMEOVER_game_fsm;
            end
          end
          GAMEOVER_game_fsm: begin
            seg_sel = 1'h1;
            if ((|buttons)) begin
              M_game_fsm_d = SET_ROUNDS_1_game_fsm;
            end else begin
              M_game_fsm_d = GAMEOVER_game_fsm;
            end
            current_state = 8'h2c;
          end
          SET_ROUNDS_1_game_fsm: begin
            we_regfile = 1'h1;
            regfile_write_address = 4'h4;
            wdsel = 3'h1;
            current_state = 8'h2d;
            if (next_ste_btn) begin
              M_game_fsm_d = SET_ROUND_COUNTDOWN_5_game_fsm;
            end
          end
          SET_ROUND_COUNTDOWN_5_game_fsm: begin
            we_regfile = 1'h1;
            regfile_write_address = 4'h8;
            wdsel = 3'h3;
            current_state = 8'h2e;
            if (next_ste_btn) begin
              M_game_fsm_d = PRE_IDLE_game_fsm;
            end
          end
          PRE_IDLE_game_fsm: begin
            if ((|buttons)) begin
              rrg_generate_next = 1'h1;
              M_game_fsm_d = O1_game_fsm;
            end else begin
              M_game_fsm_d = PRE_IDLE_game_fsm;
            end
            current_state = 8'h2f;
          end
        endcase
      end
    end
  end
  
  always @(posedge clk) begin
    M_game_fsm_q <= M_game_fsm_d;
  end
  
endmodule
