module vga_display(
    input clk,
    input [9:0] h_counter,
    input [9:0] v_counter,
    input [9:0] Ax,
    input [9:0] Ay,
    input [9:0] Bx,
    input [9:0] By,
    output reg vga_r,
    output reg vga_g,
    output reg vga_b
);

    // Sprites dos trens A e B
    parameter [15:0] train_A0 = 16'b0000000000000000;
    parameter [15:0] train_A1 = 16'b0000000000000000;
    parameter [15:0] train_A2 = 16'b0001111100000000;
    parameter [15:0] train_A3 = 16'b0010000100000000;
    parameter [15:0] train_A4 = 16'b0100000100100000;
    parameter [15:0] train_A5 = 16'b0100110010100000;
    parameter [15:0] train_A6 = 16'b0101001001100000;
    parameter [15:0] train_A7 = 16'b0101001000111000;
    parameter [15:0] train_A8 = 16'b0101111000000100;
    parameter [15:0] train_A9 = 16'b0101001000000100;
    parameter [15:0] train_A10 = 16'b0100000000000010;
    parameter [15:0] train_A11 = 16'b0010101101010100;
    parameter [15:0] train_A12 = 16'b0100100100100100;
    parameter [15:0] train_A13 = 16'b0100100100100100;
    parameter [15:0] train_A14 = 16'b0011001100001100;
    parameter [15:0] train_A15 = 16'b0000000000000000;

    parameter [15:0] train_B0 = 16'b0000000000000000;
    parameter [15:0] train_B1 = 16'b0000000000000000;
    parameter [15:0] train_B2 = 16'b0001111100000000;
    parameter [15:0] train_B3 = 16'b0010000100000000;
    parameter [15:0] train_B4 = 16'b0100000100100000;
    parameter [15:0] train_B5 = 16'b0100110010100000;
    parameter [15:0] train_B6 = 16'b0101001001100000;
    parameter [15:0] train_B7 = 16'b0101001000111000;
    parameter [15:0] train_B8 = 16'b0101111000000100;
    parameter [15:0] train_B9 = 16'b0101001000000100;
    parameter [15:0] train_B10 = 16'b0100000000000010;
    parameter [15:0] train_B11 = 16'b0010101101010100;
    parameter [15:0] train_B12 = 16'b0100100100100100;
    parameter [15:0] train_B13 = 16'b0100100100100100;
    parameter [15:0] train_B14 = 16'b0011001100001100;
    parameter [15:0] train_B15 = 16'b0000000000000000;

    always @(*) begin
        // Cor padrão (preto)
        vga_r = 0;
        vga_g = 0;
        vga_b = 0;

        // Desenha os trilhos
        if (((h_counter >= 62 && h_counter <= 578) && (v_counter >= 58 && v_counter <= 62)) || 
            ((h_counter >= 190 && h_counter <= 450) && (v_counter >= 178 && v_counter <= 182))) begin
            vga_r = 1;
            vga_g = 1;
            vga_b = 1;
        end else if (((v_counter >= 58 && v_counter <= 422) && (h_counter >= 58 && h_counter <= 62)) || 
                     ((v_counter >= 178 && v_counter <= 422) && (h_counter >= 186 && h_counter <= 190))) begin
            vga_r = 1;
            vga_g = 1;
            vga_b = 1;
        end else if (((v_counter >= 58 && v_counter <= 422) && (h_counter >= 578 && h_counter <= 582)) || 
                     ((v_counter >= 178 && v_counter <= 422) && (h_counter >= 450 && h_counter <= 454))) begin
            vga_r = 1;
            vga_g = 1;
            vga_b = 1;
        end else if ((h_counter >= 62 && h_counter <= 578) && (v_counter >= 418 && v_counter <= 422)) begin
            vga_r = 1;
            vga_g = 1;
            vga_b = 1;
        end

		  // Checa se está na área do sprite do trem A
        if ((h_counter >= Ax) && (h_counter < Ax + 16) && (v_counter >= Ay) && (v_counter < Ay + 16)) begin
            // Calcula a posição no sprite do trem A
            if ((v_counter - Ay) >= 0 && (v_counter - Ay) <= 15 && (h_counter - Ax) >= 0 && (h_counter - Ax) <= 15) begin
                case (v_counter - Ay)
                    0: if (train_A0[h_counter - Ax]) vga_r = 1;
                    1: if (train_A1[h_counter - Ax]) vga_r = 1;
                    2: if (train_A2[h_counter - Ax]) vga_r = 1;
                    3: if (train_A3[h_counter - Ax]) vga_r = 1;
                    4: if (train_A4[h_counter - Ax]) vga_r = 1;
                    5: if (train_A5[h_counter - Ax]) vga_r = 1;
                    6: if (train_A6[h_counter - Ax]) vga_r = 1;
                    7: if (train_A7[h_counter - Ax]) vga_r = 1;
                    8: if (train_A8[h_counter - Ax]) vga_r = 1;
                    9: if (train_A9[h_counter - Ax]) vga_r = 1;
                    10: if (train_A10[h_counter - Ax]) vga_r = 1;
                    11: if (train_A11[h_counter - Ax]) vga_r = 1;
                    12: if (train_A12[h_counter - Ax]) vga_r = 1;
                    13: if (train_A13[h_counter - Ax]) vga_r = 1;
                    14: if (train_A14[h_counter - Ax]) vga_r = 1;
                    15: if (train_A15[h_counter - Ax]) vga_r = 1;
                endcase
            end
        end

        // Checa se está na área do sprite do trem B
        if ((h_counter >= Bx) && (h_counter < Bx + 16) && (v_counter >= By) && (v_counter < By + 16)) begin
            // Calcula a posição no sprite do trem B
            if ((v_counter - By) >= 0 && (v_counter - By) <= 15 && (h_counter - Bx) >= 0 && (h_counter - Bx) <= 15) begin
                case (v_counter - By)
                    0: if (train_B0[h_counter - Bx]) vga_b = 1;
                    1: if (train_B1[h_counter - Bx]) vga_b = 1;
                    2: if (train_B2[h_counter - Bx]) vga_b = 1;
                    3: if (train_B3[h_counter - Bx]) vga_b = 1;
                    4: if (train_B4[h_counter - Bx]) vga_b = 1;
                    5: if (train_B5[h_counter - Bx]) vga_b = 1;
                    6: if (train_B6[h_counter - Bx]) vga_b = 1;
                    7: if (train_B7[h_counter - Bx]) vga_b = 1;
                    8: if (train_B8[h_counter - Bx]) vga_b = 1;
                    9: if (train_B9[h_counter - Bx]) vga_b = 1;
                    10: if (train_B10[h_counter - Bx]) vga_b = 1;
                    11: if (train_B11[h_counter - Bx]) vga_b = 1;
                    12: if (train_B12[h_counter - Bx]) vga_b = 1;
                    13: if (train_B13[h_counter - Bx]) vga_b = 1;
                    14: if (train_B14[h_counter - Bx]) vga_b = 1;
                    15: if (train_B15[h_counter - Bx]) vga_b = 1;
                endcase
            end
        end
    end
endmodule
