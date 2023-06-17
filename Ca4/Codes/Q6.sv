`timescale 1ns/1ns

module ms_ff(input clk,D,rst,output Q);
assign clki = ~clk;
wire rsti,Do;

//active high reset
not(rsti,rst);
and(Do,D,rsti);
//master slave
D_latch D1(clk,Do,Q1);
D_latch D2(clki,Q1,Q);
endmodule