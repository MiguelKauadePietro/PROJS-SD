module hashgame(
    input clk,
    input reset,
    input player,
    input wire [3:0] position,
    output wire [17:0] board,
    output wire [8:0] leds,
    output win1,
    output win2,
    output draw,
    output game_over
);


parameter beginning = 3'b000;
parameter ongoing = 3'b001;
parameter p1win = 3'b010;
parameter p2win = 3'b011;
parameter draw_state = 3'b101;


reg [2:0] curr_state, next_state;
reg [17:0] board_reg;
reg [8:0] filled_positions;


assign board = board_reg;
assign win1 = (curr_state == p1win);
assign win2 = (curr_state == p2win);
assign draw = (curr_state == draw_state);
assign game_over = (curr_state != ongoing && curr_state != beginning);


assign leds[0] = (board_reg[1:0] != 2'b00);
assign leds[1] = (board_reg[3:2] != 2'b00);
assign leds[2] = (board_reg[5:4] != 2'b00);
assign leds[3] = (board_reg[7:6] != 2'b00);
assign leds[4] = (board_reg[9:8] != 2'b00);
assign leds[5] = (board_reg[11:10] != 2'b00);
assign leds[6] = (board_reg[13:12] != 2'b00);
assign leds[7] = (board_reg[15:14] != 2'b00);
assign leds[8] = (board_reg[17:16] != 2'b00);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        curr_state <= beginning;
        board_reg <= 18'b0;
        filled_positions <= 9'b0;
    end else begin
        curr_state <= next_state;
        if (curr_state == ongoing && position >= 0 && position < 9 && !filled_positions[position]) begin
            board_reg[position * 2 +: 2] <= (player == 0) ? 2'b01 : 2'b10;
            filled_positions[position] <= 1'b1;
        end
    end
end



always @(*) begin
    next_state = curr_state; // Padrão
    case (curr_state)
        beginning: next_state = ongoing;

        ongoing: begin
			
            if (check_win(board_reg, 2'b01))
                next_state = p1win;
            else if (check_win(board_reg, 2'b10))
                next_state = p2win;
            else if (filled_positions == 9'b111111111)
                next_state = draw_state;
        end

        p1win, p2win, draw_state: next_state = curr_state;

        default: next_state = beginning;
    endcase
end
	


function check_win(input [17:0] board, input [1:0] player_token);
    reg [8:0] win_positions;
    begin
        win_positions[0] = (board[1:0] == player_token && board[3:2] == player_token && board[5:4] == player_token);
        win_positions[1] = (board[7:6] == player_token && board[9:8] == player_token && board[11:10] == player_token);
        win_positions[2] = (board[13:12] == player_token && board[15:14] == player_token && board[17:16] == player_token);
        win_positions[3] = (board[1:0] == player_token && board[7:6] == player_token && board[13:12] == player_token);
        win_positions[4] = (board[3:2] == player_token && board[9:8] == player_token && board[15:14] == player_token);
        win_positions[5] = (board[5:4] == player_token && board[11:10] == player_token && board[17:16] == player_token);
        win_positions[6] = (board[1:0] == player_token && board[9:8] == player_token && board[17:16] == player_token);
        win_positions[7] = (board[5:4] == player_token && board[9:8] == player_token && board[13:12] == player_token);
        
        check_win = win_positions[0] | win_positions[1] | win_positions[2] |
                    win_positions[3] | win_positions[4] | win_positions[5] |
                    win_positions[6] | win_positions[7];
    end
endfunction


endmodule
