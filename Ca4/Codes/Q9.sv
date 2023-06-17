`timescale 1ns/1ns

module Shift_Q9(input clk,Sin,rst,output logic [7:0]W);
always@(posedge clk)begin
if(rst)
W<= 8'b0;
else
W<={Sin,W[7:1]};
end
endmodule
