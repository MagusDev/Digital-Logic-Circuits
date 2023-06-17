module sr_shift_reg8(input clk,Sin,rst,output [7:0]W);
wire [8:0]g;
assign g[8] = Sin;
genvar k;
generate
for(k=0;k<8;k = k+1)begin: regs
ms_ff XX(clk,g[8-k],rst,g[7-k]);
end
endgenerate
assign W =g;
endmodule
