module train (
    input clk,
    input rst,
    output reg [9:0] Ax, // posição X do trem A
    output reg [9:0] Ay, // posição Y do trem A
    output reg [9:0] Bx, // posição X do trem B
    output reg [9:0] By  // posição Y do trem B
);

    parameter ABout = 3'b000;
    parameter Ain = 3'b001;
    parameter Bin = 3'b010;
    parameter Astop = 3'b011;
    parameter Bstop = 3'b100;

    reg [2:0] state, next_state;
    reg [9:0] SsY;
	 reg a_or_b;
    
    initial begin
        Ax = 320; // trem A começa na posição 320x60
        Ay = 60;
        Bx = 320; // trem B começa na posição 320x180
        By = 180;
		  SsY = 422;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= ABout;
            next_state <= ABout;
            Ax = 320; // trem A começa na posição 320x60
            Ay = 60;
            Bx = 320; // trem B começa na posição 320x180
            By = 180;
            SsY = 422; // dimensão Y de todos os sensores
        end else begin
            state = next_state;
            case (state)
                ABout: begin
                    // TREM A - Move when condition met
                    if (Ax == 60 && Ay < 422) begin // se estiver na linha da esquerda
                        Ay = Ay + 1;
                    end else if (Ax == 580 && Ay > 60) begin // se estiver na linha da direita
                        Ay = Ay - 1;
                    end else begin // se estiver nas linhas horizontais
                        if (Ay == 60 && Ax > 60) begin // se estiver na linha de cima vai andar para a esquerda
                            Ax = Ax - 1;
                        end else if (Ay == 422 && Ax < 580) begin // se estiver na linha de baixo vai andar para a direita
                            Ax = Ax + 1;
                        end
                    end

                    // TREM B - Move when condition met
                    if (Bx == 188 && By < 422) begin // se estiver na linha da esquerda
                        By = By + 1;
                    end else if (Bx == 452 && By > 180) begin // se estiver na linha da direita
                        By = By - 1;
                    end else begin // se estiver nas linhas horizontais
                        if (By == 180 && Bx > 188) begin // se estiver na linha de cima vai andar para a esquerda
                            Bx = Bx - 1;
                        end else if (By == 422 && Bx < 454) begin // se estiver na linha de baixo vai andar para a direita
                            Bx = Bx + 1;
                        end
                    end

                    // Transition to next state based on positions
                    if (Ay == SsY && By != 422) begin
                        next_state = Ain;
                    end else if (By == SsY) begin
                        next_state = Bin;
                    end else begin
                        next_state = ABout;
                    end
                end

                Ain: begin
                    // TREM A Movement
                    if (By < SsY) begin
								next_state = ABout;
						  end else begin
                        if (Ax < 580) begin
                            Ax = Ax + 1; // Move Train A right
									 next_state = Ain;
                        end else begin
                            Ay = Ay - 1; // Train A starts to go up
									 next_state = ABout;
                        end      
                    end
                end

                Bin: begin
                    // TREM B Movement
                    if (Ay < SsY) begin
								next_state = ABout;
						  end else begin
                        if (Bx < 452) begin
                            Bx = Bx + 1; // Move Train B right
									 next_state = Bin;
                        end else begin
                            By = By - 1; // Train B starts to go up
									 next_state = ABout;
                        end      
                    end
                end

                Astop: begin
                end

                Bstop: begin
                end
            endcase
        end
    end
endmodule
