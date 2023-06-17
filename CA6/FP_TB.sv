`timescale 1ns/1ns

module FP_TB();
//14.79 * -98.13 = 1451.3427
logic [31:0] aa = 32'b01000001011011001010001111010111;
logic [31:0] bb = 32'b11000010110001000100001010001111;
logic startFP = 0;
wire [31:0] RBus1;
wire [31:0] RBus2;
logic clk = 0;
logic rst = 0;
wire doneFP1;
wire doneFP2;
//output is 11000100101101010110101011110111 whic is -1451.342651

FP_top FP1(clk,rst,startFP,aa,bb,RBus1,doneFP1);
FP_topQ FP2(clk,rst,startFP,aa,bb,RBus2,doneFP2);

always #100 clk = ~clk;

initial begin
#110 startFP =1;
#210 startFP = 0;
#2000 $stop;
end
endmodule
