`timescale 1ns/1ns
module FA_TB();
wire ss,co;
logic aa = 0,bb = 0,cc = 0;
Full_adder_G F1(aa,bb,cc,ss,co);
initial begin
#50 aa=1;
#50 bb = 1;
#50 cc = 1;
#50 aa = 0;
#50 bb = 0;
#50 cc = 0;
#50 $stop;
end
endmodule

