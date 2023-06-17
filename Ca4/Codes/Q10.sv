module LFSR(input clk,rst,output w);
logic Si;
wire [7:0]Po;
assign Si = ~(Po[7] ^ Po[6] ^ Po[3] ^ Po[0]);
Shift_Q9 S1(clk,Si,rst,Po);
assign w = Si;
endmodule
