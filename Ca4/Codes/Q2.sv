module pencoder4bit(input [3:0]S, EI,output [1:0] N,EO,AS);
	assign N[0] = ~EI & (S[3] | (~S[2] & S[1]));
	assign N[1] = ~EI & (S[3] | S[2]);
	assign EO = ~EI & (S[0] | S[1] | S[2] | S[3]);
	assign AS = ~EI & ~(S[0] | S[1] | S[2] | S[3]);

endmodule 

module pencoder16bit(input [15:0]S,EI,output [3:0]N,EO,AS);
wire [4:0] E;
wire [0:3] A;
wire [0:3] O1;
wire  [0:3] O0;
assign N[1] = |O1;
assign N[0] = |O0;
assign EO = E[0] | E[1] | E[2] | E[3];
assign E[4] = EI;
assign AS =  ~EI;
genvar k;
generate
	for (k = 0; k<4; k = k+1) begin: encoders
		pencoder4bit XX({S[4*k+3],S[4*k +2],S[4*k + 1],S[4*k] },E[k+1],{O1[k],O0[k]},E[k],A[k]);
	end
endgenerate

assign N3 = E[3]|E[2]|A[1]|A[0];
assign N2 = E[3]|A[2]|E[1]|A[0];
endmodule
