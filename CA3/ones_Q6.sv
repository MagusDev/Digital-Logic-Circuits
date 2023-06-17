`timescale 1ns/1ns

module ones_synth(input [126:0]A,output logic [6:0]S);
logic [6:0] C;
int i;
always @ (A) begin
C = 7'b0;
for (i = 0;i<128;i = i+1) begin
if (A[i] == 1'b1) C = C+1;
end
end
assign #798 S = C;
endmodule
