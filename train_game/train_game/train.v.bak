module train (
	input clk,
	input	rst,
	input	s1,
	input	s2,
	input	s3,
	input	s4, 
	output trilhoA,
	output trilhoB
);

	parameter ABout = 3'b000;
	parameter Ain = 3'b001;
	parameter Bin = 3'b010;
	parameter Astop = 3'b011;
	parameter Bstop = 3'b100;

	reg [2:0] cur_state, next_state;
	
	
	always @(posedge clk or posedge rst) begin
		if (reset) begin
			curr_state = next_state
		 case (curr_state)
			  
				ABout: begin
					if (s1 == 0 && s2 == 0)
						 next_state = ABout;
					else if (s1 == 1)
						 next_state = Ain;
					else if ( s1 == 0 && s2 == 1)
						 next_state = Bin;
					end
					
				Ain: begin
				if ( s2 == 0 && s4 == 0)
					next_state == Ain;
				else if (s2 ==  1 && s4 == 0)
						 next_state = Bstop;
				else if (s4 == 1)
						 next_state = ABout;
				end
				
				Bin: begin
				if ( s1 == 0 && s3 == 0)
					next_state = Bin;
				else if (s3 == 1)
						 next_state = ABout;
				else if (s1 == 1 && s3 == 0)
						 next_state = Astop;
				end
				
				
				Astop: begin
				if (s3 == 0)
					next_state = Astop;
				else if (s3 == 1 )
						 next_state = Ain;
				end
				
				Bstop: begin
				if (s4 == 0)
					next_state = Bstop;
				else if (s4 == 1)
						 next_state = Bin;
				end
				

			  default: next_state = ABout;
		 endcase
		end	
	end
	
	always @(*) begin
		
    
end