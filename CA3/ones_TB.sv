`timescale 1ns/1ns

module ones_TB();
logic [126:0] AA;
wire [126:0] BB;
wire [6:0][63:0]M;
logic [6:0] SS = 7'b0;
wire [6:0] o1;
wire [6:0] o2;
counter_127 O1(.A(BB),.S(o1),.Monitor(M));
ones_synth O2(BB,o2);
shifter S1(AA,SS,BB);
initial begin
#0 AA = 127'b0;
#1500 AA[126] = 1;
#1500 SS = 7'b0000001;
#1500 SS = 7'b0000011;
#1500 SS = 7'b0000100;
#1500 SS = 7'b0001111;
#1500 $stop;
end
endmodule
