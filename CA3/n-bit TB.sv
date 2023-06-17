`timescale 1ns/1ns


module n_bit_TB();
wire [3:0]SS;
wire Co;
logic [3:0]AA;
logic [3:0]BB;
logic Ci = 0;
n_bit_adder #(.n(4)) ADD1(.A(AA),.B(BB),.Ci(Ci),.S(SS),.Co(Co));
initial begin
#10 AA = 4'b1101;
repeat (5) begin
#200 AA = $random;
#200 BB = $random;
end
end
endmodule
