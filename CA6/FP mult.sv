
module FP_mult_DP(input clk, rst,adds,mults,LoadA,LoadB,LoadR,input  [31:0]Ain,Bin , output [31:0]Rbus, output M47);

wire As;
wire Bs;
wire Ws;
wire [7:0] Ae;
wire [7:0] Be;
wire [7:0] We;
wire [22:0] Am;
wire [22:0] Bm;
wire [47:0] M;
wire [22:0] Wm;
logic [31:0] Areg,Breg,Rreg;

parameter [6:0] Bias = 127;

always @ (posedge clk,posedge rst) begin
if(rst)
Areg<= 32'b0;
else 
if(LoadA)
Areg<=Ain;
end

always @ (posedge clk,posedge rst) begin
if(rst)
Breg<= 32'b0;
else 
if(LoadB)
Breg<=Bin;
end

always @ (posedge clk,posedge rst) begin
if(rst)
Rreg<= 32'b0;
else 
if(LoadR)
Rreg<={Ws,We,Wm};
end

//sign of output

assign As = Areg[31];
assign Bs = Breg[31];
assign Ws = As^Bs;

//exponent of output

assign Ae = Areg[30:23] - Bias;
assign Be = Breg[30:23] - Bias;
assign We = (adds)? Ae + Be + Bias +1 : Ae + Be + Bias;

//Mantissa operations

assign Am = Areg[22:0];
assign Bm = Breg[22:0];
assign M = {1'b1,Am} * {1'b1,Bm};
assign M47 = M[47];
assign Wm = (~mults)? M[46:24]: M[45:23];

assign Rbus = Rreg;
endmodule

module FP_mult_ctrl(input clk,rst,startFP,M47, output logic LoadA,LoadB,LoadR,adds,mults,doneFP);

logic [1:0] ps,ns;
parameter [1:0]
Idle = 0, Init = 1,load =2,norm = 3;

always @(ps,startFP,M47) begin
ns = 0;
{LoadA,LoadB,LoadR,adds,mults,doneFP} = 6'b0;
case(ps)
Idle: begin ns = (startFP) ? Init:Idle; doneFP = 1'b1;end
Init:  ns = (startFP) ? Init: load; 
load: begin ns = norm; LoadA = 1'b1; LoadB = 1'b1;end
norm: begin ns = Idle; adds = M47; mults = ~M47; LoadR = 1'b1;end
endcase
end

always @( posedge clk,posedge rst) begin
if(rst)
ps<= Idle;
else
ps<=ns;
end
endmodule


module FP_top(input clk,rst,startFP,input [31:0]Abus,Bbus,output [31:0]ResultBus,output doneFP);
wire M47;
wire LoadA,LoadB,LoadR,adds,mults;

FP_mult_DP dp(clk,rst,adds,mults,LoadA,LoadB,LoadR,Abus,Bbus,ResultBus,M47);
FP_mult_ctrl cu(clk,rst,startFP,M47,LoadA,LoadB,LoadR,adds,mults,doneFP);

endmodule
