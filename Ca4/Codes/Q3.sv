`timescale 1ns/1ns

module D_latch(input clk,D,output Q);
not N1(Di,D);
wire Q_p;
sr_latch L1(clk,D,Di,Q_p,Q);
endmodule
