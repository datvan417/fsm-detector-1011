`timescale 1ns/1ns
module tb_fsm_detector_1011();
	reg 	i_clk = 1'b0, i_run = 1'b0, i_reset = 1'b1;
	wire 	o_Y;

	always #10 i_clk = ~i_clk;

	initial
		begin
		$monitor($time, "i_switch = %b, o_LED = %b", i_switch, o_LED);
			#5 i_reset = 1'b0;
			#15	i_run = 1'b1;
			#10 i_run = 1'b0;
			#20 i_run = 1'b1;
			#120 $stop;
		end
		
		fsm_detector_1011 DUT
		(
		.clk(i_clk),
		.run(i_run),
		.reset(i_reset),
		.Y(o_Y)
		);
endmodule

