`timescale 1ns/1ns

module Full_adder_G(input a,b,ci ,output s , co);
xor #(17,19) x1(s0,a,b);
xor #(17,19) x2(s,s0,ci);
nand #(10,8) a1(c0,a,b);
nand #(10,8) a2(c1,ci,s0);
nand  #(10,8)o1(co,c1,c0);
endmodule
