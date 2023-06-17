`timescale 1ns/1ns

module SR_latch_TB();
logic ss,rr,clk=0;
wire QQ,QP;
sr_latch L1(clk,ss,rr,QQ,QP);
initial begin
#0 ss=1;rr=0;
#20 clk = 1;
#20 clk = 0;
#20 ss =0; rr=1;
#20 clk = 1;
#20 clk = 0;
#20 ss = 0;rr=0;
#20 clk = 1;
#20 clk = 0;
#20 ss=1; rr=1;
#20 clk = 1;
#20 clk = 0;
#20 $stop;
end
endmodule
