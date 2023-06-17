`timescale 1ns/1ns
module mooreTB();
reg clk = 0,j = 0,rst = 0;
wire w1,w2;

moore10010 m1(clk,j,rst,w1);
moore10010Q m2(clk,j,rst,w2);

always #25 clk =~clk;
initial begin
#70 j = 1;
#50 j = 0;
#100 j = 1;
#50 j = 0;
#150 $stop;
end
endmodule
