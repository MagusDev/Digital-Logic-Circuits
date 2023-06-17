`timescale 1ns/1ns

module Shift_Q9_TB();
logic Si = 1;
wire [7:0]ww;
logic clk =0;
logic rst =0;
Shift_Q9 S1(clk,Si,rst,ww);
initial begin
#20 clk =1;
#20 clk =0;
#30 clk =1;
#30 clk =0; Si =0;
#40 clk =1;
#40 clk =0;
#30 clk =1;
#30 clk =0;
#20 $stop;
end
endmodule

