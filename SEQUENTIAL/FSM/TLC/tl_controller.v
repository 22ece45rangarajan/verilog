//red=001;
//yellow=010;
//green =100;

module tl_controler(input clk,res,output reg[2:0] NS,EW,P_NS,P_EW);
  localparam [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
  reg [2:0]state,nxt_state;
  always@(posedge clk or posedge res) begin
    if(res)begin
      state<=0;
    end
    else begin
      state<=nxt_state;
    end
  end
  always@(*)begin
    nxt_state=state;
    case(state)
      s0:
         nxt_state=s1;
      s1:
         nxt_state=s2;
      s2:
         nxt_state=s3;
      s3:
         nxt_state=s4;
      s4:
         nxt_state=s5;
      s5:
         nxt_state=s0;
      default:nxt_state=s0;
    endcase
  end
  always @(posedge clk or posedge res )begin
    if (res)begin
      NS<=3'b001;
      EW<=3'b001;
      P_NS<=3'b001;
      P_EW<=3'b001;
    end
    else begin
      case(state)
        s0:begin
          NS<=3'b001;//red
          EW<=3'b001;//red
          P_NS<=3'b100;//green
          P_EW<=3'b001;//red
        end
        s1:begin
          NS<=3'b001;//red
          EW<=3'b001;//red
          P_NS<=3'b001;//red
          P_EW<=3'b100;//green
        end
        s2:begin
          NS<=3'b001;//red
          EW<=3'b001;//red
          P_NS<=3'b001;//red
          P_EW<=3'b001;//red
        end
        s3:begin
          NS<=3'b010;//yellow
          EW<=3'b001;//red
          P_NS<=3'b001;//red
          P_EW<=3'b001;//red
        end
        s4:begin
          NS<=3'b100;//green
          EW<=3'b010;//yellow
          P_NS<=3'b001;//red
          P_EW<=3'b001;//red
        end
        s5:begin
          NS<=3'b001;//red
          EW<=3'b100;//green
          P_NS<=3'b001;//red
          P_EW<=3'b001;//red
        end
        default:begin
          NS<=3'b001;
          EW<=3'b001;
          P_NS<=3'b001;
          P_EW<=3'b001;
        end
      endcase
    end
  end
endmodule
