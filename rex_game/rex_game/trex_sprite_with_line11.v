module tex_sprite_with_line11 (
	input pclk, rst,
	input [9:0]x,
	input [9:0]y,
	input jump,
	output reg vga);
	
	// Definição dos parâmetros para melhor organização do código
	parameter rexXBegin = 50, rexXend = 66;	
	reg [9:0] rexYBegin = 240, rexYend = 256;
	reg [9:0] cactoXBegin = 700, cactoXEnd = 716;
	parameter cactoYBegin = 240, cactoYEnd = 256;
	reg [9:0] cacto2XBegin = 980, cacto2XEnd = 996;
	parameter cacto2YBegin = 240, cacto2YEnd = 256;
	reg [9:0] nuvemXBegin = 690, nuvemXEnd = 706;
	parameter nuvemYBegin = 150, nuvemYEnd = 166;
	reg [9:0] nuvem2XBegin = 800, nuvem2XEnd = 816;
	parameter nuvem2YBegin = 180, nuvem2YEnd = 196;
	parameter chaoXBegin = 0, chaoXEnd = 640, chaoYBegin = 245, chaoYEnd = 247;
	parameter listra1YBegin = 270, listra1YEnd = 272;
	reg [9:0] listra1XBegin = 680, listra1XEnd = 770;
	parameter listra2YBegin = 250, listra2YEnd = 252;
	reg [9:0] listra2XBegin = 771, listra2XEnd = 861;
	parameter gXBegin = 250, gXEnd = 266, gYBegin = 150, gYEnd = 166;
	parameter aXBegin = 266, aXEnd = 282, aYBegin = 150, aYEnd = 166;
	parameter mXBegin = 282, mXEnd = 298, mYBegin = 150, mYEnd = 166;
	parameter eXBegin = 299, eXEnd = 315, eYBegin = 150, eYEnd = 166;
	parameter oXBegin = 330, oXEnd = 346, oYBegin = 150, oYEnd = 166;
	parameter vXBegin = 346, vXEnd = 362, vYBegin = 150, vYEnd = 166;
	parameter e2XBegin = 362, e2XEnd = 378, e2YBegin = 150, e2YEnd = 166;
	parameter rXBegin = 378, rXEnd = 394, rYBegin = 150, rYEnd = 166;
	
	reg [15:0] rex [15:0];
	reg [15:0] cacto [15:0];
	reg [15:0] nuvem [15:0];
	
	reg [15:0] g [15:0];
	reg [15:0] a [15:0];
	reg [15:0] m [15:0];
	reg [15:0] e [15:0];
	reg [15:0] o [15:0];
	reg [15:0] v [15:0];
	reg [15:0] r [15:0];
	
	// incialização das matrizes dos sprites
	initial begin
		rex[15] = 16'b0011111100000000;
		rex[14] = 16'b0111111110000000;
		rex[13] = 16'b0111111110000000;
		rex[12] = 16'b0110111110000000;
		rex[11] = 16'b0111111110000000;
		rex[10] = 16'b0111111110011000;
		rex[9]  = 16'b0111111110010000;
		rex[8]  = 16'b0111111100111101;
		rex[7]  = 16'b0011111111111111;
		rex[6]  = 16'b0000001111111000;
		rex[5]  = 16'b0000001111110000;
		rex[4]  = 16'b0000000111110001;
		rex[3]  = 16'b0000000011111111;
		rex[2]  = 16'b0000000001111100;
		rex[1]  = 16'b0000000111111000;
		rex[0]  = 16'b0000001111110000;

		cacto[15] = 16'b0000000000000000;
		cacto[14] = 16'b0000000111000000;
		cacto[13] = 16'b0000001111100000;
		cacto[12] = 16'b0000000011100000;
		cacto[11] = 16'b0000000001110000;
		cacto[10] = 16'b0000000001110000;
		cacto[9]  = 16'b0001111111111111;
		cacto[8]  = 16'b0000111111111111;
		cacto[7]  = 16'b0000011111111111;
		cacto[6]  = 16'b0000000001110000;
		cacto[5]  = 16'b0000000001110000;
		cacto[4]  = 16'b0000001111100000;
		cacto[3]  = 16'b0000000111100000;
		cacto[2]  = 16'b0000000011000000;
		cacto[1]  = 16'b0000000000000000;
		cacto[0]  = 16'b0000000000000000;

		nuvem[15] = 16'b0000000001100000;
		nuvem[14] = 16'b0000000010100000;
		nuvem[13] = 16'b0000000100110000;
		nuvem[12] = 16'b0000011000010000;
		nuvem[11] = 16'b0000010000010000;
		nuvem[10] = 16'b0000100000010000;
		nuvem[9]  = 16'b0001000000010000;
		nuvem[8]  = 16'b0001000000010000;
		nuvem[7]  = 16'b0001000000010000;
		nuvem[6]  = 16'b0001000000010000;
		nuvem[5]  = 16'b0001000000010000;
		nuvem[4]  = 16'b0001000000010000;
		nuvem[3]  = 16'b0000100000010000;
		nuvem[2]  = 16'b0000010000010000;
		nuvem[1]  = 16'b0000001000100000;
		nuvem[0]  = 16'b0000000111000000;
		
		g[15] = 16'b0000111111110000;
		g[14] = 16'b0001111111111000;
		g[13] = 16'b0011110000111100;
		g[12] = 16'b0111100000011100;
		g[11] = 16'b0111000000011100;
		g[10] = 16'b0111000000000000;
		g[9]  = 16'b0111000011111100;
		g[8]  = 16'b0111000011111100;
		g[7]  = 16'b0111000000011100;
		g[6]  = 16'b0111100000011100;
		g[5]  = 16'b0011110000111100;
		g[4]  = 16'b0001111111111000;
		g[3]  = 16'b0000111111110000;
		g[2]  = 16'b0000000000000000;
		g[1]  = 16'b0000000000000000;
		g[0]  = 16'b0000000000000000;

		a[15] = 16'b0000011111000000;
		a[14] = 16'b0000111111100000;
		a[13] = 16'b0000110011100000;
		a[12] = 16'b0001110011110000;
		a[11] = 16'b0001110011110000;
		a[10] = 16'b0011100000111000;
		a[9]  = 16'b0011100000111000;
		a[8]  = 16'b0111111111111100;
		a[7]  = 16'b0111111111111100;
		a[6]  = 16'b1110000000001110;
		a[5]  = 16'b1110000000001110;
		a[4]  = 16'b1110000000001110;
		a[3]  = 16'b1110000000001110;
		a[2]  = 16'b0000000000000000;
		a[1]  = 16'b0000000000000000;
		a[0]  = 16'b0000000000000000;

		m[15] = 16'b1110000000001110;
		m[14] = 16'b1111000000011110;
		m[13] = 16'b1111100000111110;
		m[12] = 16'b1111100000111110;
		m[11] = 16'b1110110001101110;
		m[10] = 16'b1110011011001110;
		m[9]  = 16'b1110011011001110;
		m[8]  = 16'b1110001110001110;
		m[7]  = 16'b1110000000001110;
		m[6]  = 16'b1110000000001110;
		m[5]  = 16'b1110000000001110;
		m[4]  = 16'b1110000000001110;
		m[3]  = 16'b1110000000001110;
		m[2]  = 16'b0000000000000000;
		m[1]  = 16'b0000000000000000;
		m[0]  = 16'b0000000000000000;

		e[15] = 16'b1111111111111100;
		e[14] = 16'b1111111111111100;
		e[13] = 16'b1110000000000000;
		e[12] = 16'b1110000000000000;
		e[11] = 16'b1110000000000000;
		e[10] = 16'b1111111111111000;
		e[9]  = 16'b1111111111111000;
		e[8]  = 16'b1110000000000000;
		e[7]  = 16'b1110000000000000;
		e[6]  = 16'b1110000000000000;
		e[5]  = 16'b1110000000000000;
		e[4]  = 16'b1111111111111100;
		e[3]  = 16'b1111111111111100;
		e[2]  = 16'b0000000000000000;
		e[1]  = 16'b0000000000000000;
		e[0]  = 16'b0000000000000000;

		o[15] = 16'b0001111111100000;
		o[14] = 16'b0011111111110000;
		o[13] = 16'b0111100001111000;
		o[12] = 16'b0111000000111000;
		o[11] = 16'b1110000000011100;
		o[10] = 16'b1110000000011100;
		o[9]  = 16'b1110000000011100;
		o[8]  = 16'b1110000000011100;
		o[7]  = 16'b1110000000011100;
		o[6]  = 16'b0111000000111000;
		o[5]  = 16'b0111100001111000;
		o[4]  = 16'b0011111111110000;
		o[3]  = 16'b0001111111100000;
		o[2]  = 16'b0000000000000000;
		o[1]  = 16'b0000000000000000;
		o[0]  = 16'b0000000000000000;

		v[15] = 16'b1110000000011100;
		v[14] = 16'b1110000000011100;
		v[13] = 16'b1110000000011100;
		v[12] = 16'b1110000000011100;
		v[11] = 16'b0111000000111000;
		v[10] = 16'b0111000000111000;
		v[9]  = 16'b0111000000111000;
		v[8]  = 16'b0011100001110000;
		v[7]  = 16'b0011100001110000;
		v[6]  = 16'b0011100001110000;
		v[5]  = 16'b0001110011100000;
		v[4]  = 16'b0000011110000000;
		v[3]  = 16'b0000001100000000;
		v[2]  = 16'b0000000000000000;
		v[1]  = 16'b0000000000000000;
		v[0]  = 16'b0000000000000000;
		
		r[15] = 16'b1111111111110000;
		r[14] = 16'b1111111111111000;
		r[13] = 16'b1110000001111100;
		r[12] = 16'b1110000000111100;
		r[11] = 16'b1110000000111100;
		r[10] = 16'b1110000001111000;
		r[9]  = 16'b1111111111110000;
		r[8]  = 16'b1111111111100000;
		r[7]  = 16'b1110000011110000;
		r[6]  = 16'b1110000001110000;
		r[5]  = 16'b1110000001111000;
		r[4]  = 16'b1110000000111100;
		r[3]  = 16'b1110000000111100;
		r[2]  = 16'b0000000000000000;
		r[1]  = 16'b0000000000000000;
		r[0]  = 16'b0000000000000000;
	end

	reg gameOver;
	reg [19:0] deslocamento = 'd125000, velocidade = 'd100, velocidadeReg = 'd125000;
	
	// definição das cores do pixel da vez, se tiver em um pixel de algum elemento deve ser branco, caso contrário, preto
	always @(posedge pclk) begin
		vga = 0;
		
		if(y >= chaoXBegin && y < chaoXEnd && x >= chaoYBegin && x < chaoYEnd) begin
			vga = 1;
		end
		
		if(y >= listra1XBegin && y < listra1XEnd && x >= listra1YBegin && x < listra1YEnd) begin
			vga = 1;
		end
		
		if(y >= listra2XBegin && y < listra2XEnd && x >= listra2YBegin && x < listra2YEnd) begin
			vga = 1;	
		end
		
		if(y >= cactoXBegin && y < cactoXEnd && x >= cactoYBegin && x < cactoYEnd) begin
			vga = cacto[15 - (y - cactoXBegin)][x - cactoYBegin];
		end
		
		if(y >= cacto2XBegin && y < cacto2XEnd && x >= cacto2YBegin && x < cacto2YEnd) begin
			vga = cacto[15 - (y - cacto2XBegin)][x - cacto2YBegin];
		end
		
		if(y >= nuvemXBegin && y < nuvemXEnd && x >= nuvemYBegin && x < nuvemYEnd) begin
			vga = nuvem[15 - (y - nuvemXBegin)][x - nuvemYBegin];
		end
		
		if(y >= nuvem2XBegin && y < nuvem2XEnd && x >= nuvem2YBegin && x < nuvem2YEnd) begin
			vga = nuvem[15 - (y - nuvem2XBegin)][x - nuvem2YBegin];
		end
		
		if(y >= rexXBegin && y < rexXend && x >= rexYBegin && x < rexYend) begin
			vga = rex[15 - (y - rexXBegin)][x - rexYBegin];
		end
		
		if(gameOver) begin
			if(y >= gXBegin && y < gXEnd && x >= gYBegin && x < gYEnd) begin
				vga = g[x - gYBegin][y - gXBegin];
			end
			
			if(y >= aXBegin && y < aXEnd && x >= aYBegin && x < aYEnd) begin
				vga = a[x - aYBegin][y - aXBegin];
			end
			
			if(y >= mXBegin && y < mXEnd && x >= mYBegin && x < mYEnd) begin
				vga = m[x - mYBegin][y - mXBegin];
			end
			
			if(y >= eXBegin && y < eXEnd && x >= eYBegin && x < eYEnd) begin
				vga = e[x - eYBegin][y - eXBegin];
			end
			
			if(y >= oXBegin && y < oXEnd && x >= oYBegin && x < oYEnd) begin
				vga = o[x - oYBegin][y - oXBegin];
			end
			
			if(y >= vXBegin && y < vXEnd && x >= vYBegin && x < vYEnd) begin
				vga = v[x - vYBegin][y - vXBegin];
			end
			
			if(y >= e2XBegin && y < e2XEnd && x >= e2YBegin && x < e2YEnd) begin
				vga = e[x - e2YBegin][y - e2XBegin];
			end
			
			if(y >= rXBegin && y < rXEnd && x >= rYBegin && x < rYEnd) begin
				vga = r[x - rYBegin][y - rXBegin];
			end
		end
	end
	
	// lógica para pular
	always @(posedge pclk) begin
		if(jump && rexYend > 227 && !gameOver) begin
			rexYBegin <= rexYBegin - 25;
			rexYend <= rexYend - 25;
		end
		else if(~jump) begin
			rexYBegin <= 236;
			rexYend <= 252;
		end
	end
	
	// lógica de deslocamento do rex e dos elementos
	always @(posedge pclk) begin
		if(rst) begin
			deslocamento = 'd125000;
			velocidadeReg = 'd125000;
			velocidade = 'd100;
			gameOver = 0;
			cactoXBegin = 681;
			cactoXEnd = 697;
			cacto2XBegin = 897;
			cacto2XEnd = 913;
			nuvemXBegin = 640;
			nuvemXEnd = 656;
			nuvem2XBegin = 696;
			nuvem2XEnd = 712;
			listra1XBegin = 640;
			listra1XEnd = 720;
			listra2XBegin = 760;
			listra2XEnd = 840;
		end 
		else if(!gameOver) begin
			if(deslocamento > 0) begin
				deslocamento <= deslocamento - 1;
			end
			else begin // deslocamento dos cactos
				if(cactoXEnd > 0) begin
					cactoXBegin = cactoXBegin - 1;
					cactoXEnd = cactoXEnd - 1;
				end
				else begin
					cactoXBegin = 681;
					cactoXEnd = 697;
				end
				
				if(cacto2XEnd > 0) begin
					cacto2XBegin = cacto2XBegin - 1;
					cacto2XEnd = cacto2XEnd - 1;
				end
				else begin
					cacto2XBegin = 897;
					cacto2XEnd = 913;
				end
				
				// deslocamento das nuvens
				if(nuvemXEnd > 0) begin 
					nuvemXBegin = nuvemXBegin - 1;
					nuvemXEnd = nuvemXEnd - 1;
				end
				else begin
					nuvemXBegin = 640;
					nuvemXEnd = 656;
				end
				
				if(nuvem2XEnd > 0) begin
					nuvem2XBegin = nuvem2XBegin - 1;
					nuvem2XEnd = nuvem2XEnd - 1;
				end
				else begin
					nuvem2XBegin = 696;
					nuvem2XEnd = 712;
				end
				
				// deslocamento dos detalhes da pista
				if(listra1XEnd > 0) begin
					listra1XBegin = listra1XBegin - 1;
					listra1XEnd = listra1XEnd - 1;
				end
				else begin
					listra1XBegin = 640;
					listra1XEnd = 720;
				end
				
				if(listra2XBegin > 0) begin
					listra2XBegin = listra2XBegin - 1;
					listra2XEnd = listra2XEnd - 1;
				end
				else begin
					listra2XBegin = 760;
					listra2XEnd = 840;
				end

				deslocamento = velocidadeReg;
				// lógica do aumento de velocidade
				if(velocidade > 0) begin
					velocidade = velocidade - 1;
				end
				else begin
					if(velocidadeReg > 62500) begin
						velocidadeReg = velocidadeReg - 500;
						velocidade = 100;
					end
				end
			end
		end
		
		// lógica do game over
		if(rexXend == cactoXBegin && rexYBegin == cactoYBegin || rexXend == cacto2XBegin && rexYBegin == cacto2YBegin || (cactoXEnd - rexXend) <= 16 && (cactoXEnd - rexXend) > 0 && rexYend == cactoYBegin || (cacto2XEnd - rexXend) <= 16 && (cacto2XEnd - rexXend) > 0 && rexYend == cacto2YBegin) begin
			gameOver = 1;
		end
	end
			
endmodule