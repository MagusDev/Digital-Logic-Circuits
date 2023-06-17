`timescale 1ns/1ns

module LFSR_TB();
logic clk=0,rst=1;

wire ww;
LFSR L1(clk,rst,ww);
always #50 clk = ~clk;
initial begin;
#100 rst=0;
#50000 $stop;
end
endmodule
