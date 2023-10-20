module fsm_detector_1011(input clk, run, reset, output reg Y);
reg [2:0] current_state, next_state;
parameter [2:0] Init = 3'b000, A = 3'b001, B = 3'b010, C = 3'b011, D = 3'b100;

always @(posedge clk, posedge reset)
begin
	if(reset) current_state <= Init;
	else current_state <= next_state;
end	

always @(run, current_state)
	case (current_state)
		Init:
			if(run) next_state = A;
			else next_state = Init;
		
		A:
			if(~run) next_state = B;
			else next_state = A;
		B:
			if(run) next_state = C;
			else next_state = Init;
		C:
			if(run) next_state = D;
			else next_state = B;
		D:
			if(run) next_state = A;
			else next_state = B;
	endcase

always @(current_state)
	case(current_state)
		Init: Y <= 0;
		A: Y <= 0;
		B: Y <= 0;
		C: Y <= 0;
		D: Y <= 1;
	endcase

endmodule