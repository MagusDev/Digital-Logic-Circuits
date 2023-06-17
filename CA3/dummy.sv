`timescale 1ns/1ns
module dum(input [126:0]A,output[6:0]S);
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
for (j = 0 ;j<32;j = j+1) begin: INNER
n_bit_adder #(1) inst(
	.A(g[0][2*j]),
	.B(g[0][2*j+1]),
	.Ci(C[0][j]),
	.S(g[1][2*j]),
	.Co(g[1][2*j+ 1]));
end

endgenerate
assign S = g[1][6:0];
endmodule

module shifter(input signed [126:0]A, input [6:0]S,output  [126:0]B);
assign B = A>>>S;
endmodule

