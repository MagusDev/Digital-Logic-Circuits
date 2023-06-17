`timescale 1ns/1ns
module shift_reg8(input clk,Sin,output [7:0]W);
wire [8:0]g;
assign g[8] = Sin;
genvar k;
generate
for(k=0;k<8;k = k+1)begin: regs
D_latch XX(clk,g[8-k],g[7-k]);
end
endgenerate
assign W =g;
endmodule

