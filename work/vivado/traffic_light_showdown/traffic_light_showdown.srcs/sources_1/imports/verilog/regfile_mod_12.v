/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_mod_12 (
    input clk,
    input rst,
    input we,
    input [15:0] data,
    input [3:0] write_address,
    input [3:0] read_address_a,
    input [3:0] read_address_b,
    output reg [15:0] out_a,
    output reg [15:0] out_b,
    output reg [15:0] p1_score,
    output reg [15:0] p2_score,
    output reg [15:0] display_config,
    output reg [15:0] round_no,
    output reg [15:0] count_down,
    output reg [2:0] debugg_p1_button,
    output reg [2:0] debugansreg,
    output reg debugp1ban,
    output reg debugp2ban,
    output reg [2:0] debugp2btn,
    output reg [15:0] debugregF
  );
  
  
  
  reg [15:0] M_p1_scorereg_d, M_p1_scorereg_q = 1'h0;
  reg [15:0] M_p2_scorereg_d, M_p2_scorereg_q = 1'h0;
  reg [15:0] M_display_config_reg_d, M_display_config_reg_q = 1'h0;
  reg [15:0] M_round_num_reg_d, M_round_num_reg_q = 1'h0;
  reg [15:0] M_p1_button_d, M_p1_button_q = 1'h0;
  reg [15:0] M_p2_button_d, M_p2_button_q = 1'h0;
  reg [15:0] M_round_ans_reg_d, M_round_ans_reg_q = 1'h0;
  reg [15:0] M_round_countdown_reg_d, M_round_countdown_reg_q = 1'h0;
  reg [15:0] M_p1_ban_reg_d, M_p1_ban_reg_q = 1'h0;
  reg [15:0] M_p2_ban_reg_d, M_p2_ban_reg_q = 1'h0;
  reg [15:0] M_free_regB_d, M_free_regB_q = 1'h0;
  reg [15:0] M_free_regC_d, M_free_regC_q = 1'h0;
  reg [15:0] M_free_regD_d, M_free_regD_q = 1'h0;
  reg [15:0] M_free_regE_d, M_free_regE_q = 1'h0;
  reg [15:0] M_free_regF_d, M_free_regF_q = 1'h0;
  
  always @* begin
    M_p2_scorereg_d = M_p2_scorereg_q;
    M_round_countdown_reg_d = M_round_countdown_reg_q;
    M_p1_ban_reg_d = M_p1_ban_reg_q;
    M_free_regB_d = M_free_regB_q;
    M_round_num_reg_d = M_round_num_reg_q;
    M_free_regD_d = M_free_regD_q;
    M_free_regC_d = M_free_regC_q;
    M_p1_button_d = M_p1_button_q;
    M_free_regF_d = M_free_regF_q;
    M_free_regE_d = M_free_regE_q;
    M_p1_scorereg_d = M_p1_scorereg_q;
    M_p2_button_d = M_p2_button_q;
    M_p2_ban_reg_d = M_p2_ban_reg_q;
    M_display_config_reg_d = M_display_config_reg_q;
    M_round_ans_reg_d = M_round_ans_reg_q;
    
    if (we) begin
      
      case (write_address)
        4'h0: begin
          M_p1_scorereg_d = data;
        end
        4'h1: begin
          M_p2_scorereg_d = data;
        end
        4'h2: begin
          M_display_config_reg_d = data;
        end
        4'h4: begin
          M_round_num_reg_d = data;
        end
        4'h5: begin
          M_p1_button_d = data;
        end
        4'h6: begin
          M_p2_button_d = data;
        end
        4'h7: begin
          M_round_ans_reg_d = data;
        end
        4'h8: begin
          M_round_countdown_reg_d = data;
        end
        4'h9: begin
          M_p1_ban_reg_d = data;
        end
        4'ha: begin
          M_p2_ban_reg_d = data;
        end
        4'hb: begin
          M_free_regB_d = data;
        end
        4'hc: begin
          M_free_regC_d = data;
        end
        4'hd: begin
          M_free_regD_d = data;
        end
        4'he: begin
          M_free_regE_d = data;
        end
        4'hf: begin
          M_free_regF_d = data;
        end
      endcase
    end
    
    case (read_address_a)
      4'h0: begin
        out_a = M_p1_scorereg_q;
      end
      4'h1: begin
        out_a = M_p2_scorereg_q;
      end
      4'h2: begin
        out_a = M_display_config_reg_q;
      end
      4'h4: begin
        out_a = M_round_num_reg_q;
      end
      4'h5: begin
        out_a = M_p1_button_q;
      end
      4'h6: begin
        out_a = M_p2_button_q;
      end
      4'h7: begin
        out_a = M_round_ans_reg_q;
      end
      4'h8: begin
        out_a = M_round_countdown_reg_q;
      end
      4'h9: begin
        out_a = M_p1_ban_reg_q;
      end
      4'ha: begin
        out_a = M_p2_ban_reg_q;
      end
      4'hb: begin
        out_a = M_free_regB_q;
      end
      4'hc: begin
        out_a = M_free_regC_q;
      end
      4'hd: begin
        out_a = M_free_regD_q;
      end
      4'he: begin
        out_a = M_free_regE_q;
      end
      4'hf: begin
        out_a = M_free_regF_q;
      end
      default: begin
        out_a = 1'h0;
      end
    endcase
    
    case (read_address_b)
      4'h0: begin
        out_b = M_p1_scorereg_q;
      end
      4'h1: begin
        out_b = M_p2_scorereg_q;
      end
      4'h2: begin
        out_b = M_display_config_reg_q;
      end
      4'h4: begin
        out_b = M_round_num_reg_q;
      end
      4'h5: begin
        out_b = M_p1_button_q;
      end
      4'h6: begin
        out_b = M_p2_button_q;
      end
      4'h7: begin
        out_b = M_round_ans_reg_q;
      end
      4'h8: begin
        out_b = M_round_countdown_reg_q;
      end
      4'h9: begin
        out_b = M_p1_ban_reg_q;
      end
      4'ha: begin
        out_b = M_p2_ban_reg_q;
      end
      4'hb: begin
        out_b = M_free_regB_q;
      end
      4'hc: begin
        out_b = M_free_regC_q;
      end
      4'hd: begin
        out_b = M_free_regD_q;
      end
      4'he: begin
        out_b = M_free_regE_q;
      end
      4'hf: begin
        out_b = M_free_regF_q;
      end
      default: begin
        out_b = 1'h0;
      end
    endcase
    p1_score = M_p1_scorereg_q;
    p2_score = M_p2_scorereg_q;
    display_config = M_display_config_reg_q;
    round_no = M_round_num_reg_q;
    count_down = M_round_countdown_reg_q;
    debugg_p1_button = M_p1_button_q[0+2-:3];
    debugregF = M_free_regF_q;
    debugansreg = M_round_ans_reg_q[0+2-:3];
    debugp1ban = M_p1_ban_reg_q[0+0-:1];
    debugp2ban = M_p2_ban_reg_q[0+0-:1];
    debugp2btn = M_p2_button_q[0+2-:3];
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_p1_scorereg_q <= 1'h0;
      M_p2_scorereg_q <= 1'h0;
      M_display_config_reg_q <= 1'h0;
      M_round_num_reg_q <= 1'h0;
      M_p1_button_q <= 1'h0;
      M_p2_button_q <= 1'h0;
      M_round_ans_reg_q <= 1'h0;
      M_round_countdown_reg_q <= 1'h0;
      M_p1_ban_reg_q <= 1'h0;
      M_p2_ban_reg_q <= 1'h0;
      M_free_regB_q <= 1'h0;
      M_free_regC_q <= 1'h0;
      M_free_regD_q <= 1'h0;
      M_free_regE_q <= 1'h0;
      M_free_regF_q <= 1'h0;
    end else begin
      M_p1_scorereg_q <= M_p1_scorereg_d;
      M_p2_scorereg_q <= M_p2_scorereg_d;
      M_display_config_reg_q <= M_display_config_reg_d;
      M_round_num_reg_q <= M_round_num_reg_d;
      M_p1_button_q <= M_p1_button_d;
      M_p2_button_q <= M_p2_button_d;
      M_round_ans_reg_q <= M_round_ans_reg_d;
      M_round_countdown_reg_q <= M_round_countdown_reg_d;
      M_p1_ban_reg_q <= M_p1_ban_reg_d;
      M_p2_ban_reg_q <= M_p2_ban_reg_d;
      M_free_regB_q <= M_free_regB_d;
      M_free_regC_q <= M_free_regC_d;
      M_free_regD_q <= M_free_regD_d;
      M_free_regE_q <= M_free_regE_d;
      M_free_regF_q <= M_free_regF_d;
    end
  end
  
endmodule
