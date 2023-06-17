`timescale 1ns/1ns
module D_latch_TB();
logic D,clk =1;
wire QQ;
D_latch D1(clk,D,QQ);
initial begin
#20 D = 0;
#20 clk =0;
#20 clk =1;
#20 D = 1;
#20 clk = 0;
#20 clk = 1;
#20 D = 0;
#20 clk =0;
#20 clk =1;
#50 $stop;
end
endmodule
