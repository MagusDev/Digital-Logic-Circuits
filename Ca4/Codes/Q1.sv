`timescale 1ns/1ns

module sr_latch(input clk,s,r,output Q,Q_p);
not(si,s);
not(ri,r);
not(clki,clk);
nand #8 N1(o1,si,clki);
nand #8 N2(o2,ri,clki);
nand #8 N3(Q,o1,Q_p);
nand #8 N4(Q_p,o2,Q);
endmodule
