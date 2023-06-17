`timescale 1ns/1ns

module Shift_Q5_TB();
logic Si = 1;
wire [7:0]ww;
logic clk =1;
shift_reg8 S1(clk,Si,ww);
initial begin
#20 clk =0;
#20 clk =1;
#30 clk =0;
#30 clk =1; Si =0;
#40 clk =0;
#40 clk =1;
#30 clk =0;
#30 clk =1;
#20 $stop;
end
endmodule

