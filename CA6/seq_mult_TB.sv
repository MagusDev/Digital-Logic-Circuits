
`timescale 1ns/1ns
module Mult24_TB();
  reg [23:0]A,B;
  reg clk = 0, rst = 0 , startMul = 0;
  wire [47:0]Result1,Result2;
  wire doneMul1doneMul2;
  Mult24_TOP_Level M1(clk,rst,startMul,A,B,Result1,doneMul1);
  Mult24_TOP_LevelQ M3(clk,rst,startMul,A,B,Result2,doneMul2);
  always #50 clk <= ~clk;
  initial begin 
    #30 rst = 1;
    #30 rst = 0;
    #130 A = 23'd17;
    #130 B = 23'd139;
    #30 startMul = 1;
    #130 startMul = 0;
    #10130 rst = 1;
    #30 rst = 0;
    #130 A = 23'd124;
    #130 B = 23'd530;
    #30 startMul = 1;
    #130 startMul = 0;
    #10000 $stop;
  end
endmodule
