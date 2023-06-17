`timescale 1ns/1ns
module n_bit_adder #(parameter n = 1)(input [n-1:0] A,[n-1:0] B,input Ci, output [n-1:0] S,output Co);
assign #(n*38) {Co,S} = A + B + Ci;
endmodule