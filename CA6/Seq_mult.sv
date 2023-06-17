//Sequential Multiplier Data Path module:
module Mult24_DP (input clk,rst,loadA,loadB,loadP,shiftA,initP,Bsel,
         input[23:0] Abus,Bbus, output [47:0] multresult , output A0);
  reg [23:0] Areg,Breg,Preg;
  wire  [23:0] B_and;
  wire  [24:0] AddBus;
  always @(posedge clk , posedge rst) begin
    if (rst)
      Breg <= 24'b0;
    else 
      if(loadB)
        Breg <= Bbus;
  end
  always @(posedge clk , posedge rst) begin
    if (rst)
      Preg <= 24'b0;
    else begin
         if(initP)
        Preg <= 24'b0;
        else
          if(loadP)
            Preg <= AddBus [24:1];
          end
  end
  always @(posedge clk , posedge rst)begin
    if (rst)
      Areg <= 24'b0;
    else begin
      if(loadA)
        Areg <= Abus ;
        else
          if(shiftA)
            Areg <= {AddBus[0],Areg[23:1]};
      end
  end
  assign B_and = Bsel ? Breg : 24'b0;
  assign AddBus = B_and + Preg;
  assign multresult = {Preg,Areg};
  assign A0 = Areg[0];
endmodule

//Sequential Multiplier controller module:
module Mult24_CU (input clk,rst,start,A0,output reg loadA,shiftA,loadB,loadP,initP,Bsel,ready);
  wire Co;
  reg Init_counter , Inc_counter;
  reg [1:0] pstate, nstate;
  reg [4:0] Count;
  parameter Idle = 0 , Init = 1 , load = 2 , shift = 3;
  always@(pstate,start,A0,Co) begin
    nstate = 0;
    {loadA,shiftA,loadB,loadP,initP,Bsel,ready} = 7'b0;
    {Init_counter,Inc_counter} = 2'b0;
      case(pstate)
        Idle : begin nstate = start ? Init : Idle; ready = 1'b1; end
        Init : begin nstate = start ? Init : load; Init_counter = 1'b1;initP = 1'b1;end
        load : begin nstate = shift ; loadA = 1'b1;loadB = 1'b1; end
        shift : begin nstate = Co ? Idle : shift;Inc_counter = 1'b1;shiftA = 1'b1;loadP = 1'b1; Bsel = A0;end
      endcase
  end
  always @(posedge clk,posedge rst) begin
    if(rst)
    pstate <= Idle;
    else
    pstate <= nstate;
  end
  always @(posedge clk,posedge rst) begin
    if (rst) Count <= 5'd0;
    else begin
      if(Init_counter) Count <= 5'd8;
        else
          if(Inc_counter) Count <= Count +1;
  end
  end 
  assign Co = & Count;
endmodule

//Sequential Multiplier top level module:
module Mult24_TOP_Level (input clk , rst , startMul ,input [23:0] A,B , output [47:0] ResultBus , output doneMul);
  wire A0;
  wire loadA,shiftA,loadB,loadP,InitP,Bsel;
  Mult24_DP dp(clk,rst,loadA,loadB,loadP,shiftA,InitP,Bsel,A,B,ResultBus,A0);
  Mult24_CU co(clk,rst,startMul,A0,loadA,shiftA,loadB,loadP,InitP,Bsel,doneMul);
endmodule
