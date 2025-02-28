module trex_control (
    input wire clk,
    input wire reset,
    input wire botao_pulo,
    output reg [9:0] y,
    output reg [9:0] x,
    output reg game_over            // Estado do jogo
);

    // Estados do jogo
    parameter IDLE = 2'b00;
    parameter RUNNING = 2'b01;
    parameter JUMPING = 2'b10;
    parameter GAME_OVER = 2'b11;
    reg [1:0] estado;

    // Parâmetros
    parameter integer CHAO = 250;  // Posição Y do chão
    parameter integer GRAVIDADE = 2;
    parameter integer PULO_FORCA = 15;

    // Variáveis auxiliares
    reg [9:0] velocidade_y;  // Controle da gravidade e do pulo
    reg [9:0] pos_y; // Posição do rex no eixo Y
    reg [9:0] obstaculo_x; // Posição do obstaculo no eixo X
    reg [15:0] VELOCIDADE_OBSTACULO = 5;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            estado <= IDLE;
            pos_y <= CHAO;
            obstaculo_x <= 640;
            game_over <= 0;
            velocidade_y <= 0;
        end else begin
            case (estado)
                IDLE: begin
                    if (botao_pulo) estado <= JUMPING;
                end

                RUNNING: begin
                    // Movimentação do obstáculo
                    if (obstaculo_x > 0) obstaculo_x <= obstaculo_x - VELOCIDADE_OBSTACULO;
                    else obstaculo_x <= 640;  // Reinicia o obstáculo

                    // Pulo
                    if (botao_pulo) estado <= JUMPING;

                    // Detecção de colisão -> Rex fica sempre no pixel 50 da tela
                    if ((obstaculo_x <= 50) && (pos_y == CHAO)) estado <= GAME_OVER;
                end

                JUMPING: begin
                    if (pos_y == CHAO) pos_y <= pos_y - PULO_FORCA; // Se o REX estiver no chão, vai pular
                    if (!botao_pulo) begin
                      if (pos_y < CHAO) pos_y <= pos_y + PULO_FORCA;
                      VELOCIDADE_OBSTACULO <= VELOCIDADE_OBSTACULO + 1; // Incremento na velocidade
                      estado <= RUNNING; // Enquanto o botão estiver apertado ele continua no ar
                    end
                end

                GAME_OVER: begin
                    game_over <= 1;
                    // Prevent state transitions after game over
                end
            endcase
        end
    end

endmodule
