`timescale 1ns/1ns

module counter_127(input [126:0]A,output [6:0]S,[6:0][63:0]Monitor);
//parameter n_bits = 128;
//parameter n_levels = 6;
wire [6:0][63:0]g;
wire [5:0][31:0]C;
assign C[0] = A[95:64];
assign C[1][15:0] = A[111:96];
assign C[2][7:0] = A[119:112];
assign C[3][3:0] = A[123:120];
assign C[4][1:0] = A[125:124];
assign C[5][0] = A[126];
assign g[0]= A[63:0];

genvar i;
genvar j;
generate 
for (i = 0 ;i<6;i = i+1) begin: OUTER
for (j = 0 ;j<64/2**(i +1);j = j+1) begin: INNER
n_bit_adder #(i+1) inst(
	.A(g[i][2*(i+1)*j+ i:2*(i+ 1)*j]),
	.B(g[i][2*(i+1)*j + (2*i+1): 2*(i+ 1)*j+ i+1]),
	.Ci(C[i][j]),
	.S(g[i+1][(i+2)*j+ i:(i+2)*j]),
	.Co(g[i+1][(i+2)*j+ i+1]));
end
end
endgenerate
assign S = g[6][6:0];
assign Monitor = g;
endmodule
