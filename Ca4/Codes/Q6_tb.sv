`timescale 1ns/1ns
module ms_TB();
logic D,clk =0,rst=0;
wire QQ;

ms_ff D1(clk,D,rst,QQ);
initial begin
#50 D = 0;
#50 clk =1;
#50 clk =0;
#50 D = 1;
#50 clk = 1;
#50 clk = 0;
#50 D = 0;
#50 clk =1;
#50 clk =0;
#50 D = 1;
#50 clk =1;
#50 clk =0;
#50 rst=1;
#50 clk =1;
#50 clk =0;
#50 $stop;
end
endmodule
