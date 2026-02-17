module moore_non_overlap(input a,res,clk,output reg y);
  localparam [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
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
    nxt_state=state;y=1'b0;
    case(state)
      s0:
        if(a)begin
          nxt_state=s1;
        end
        else begin
          nxt_state=s0;
        end
       s1:
         if(a)begin
          nxt_state=s1;
        end
        else begin
          nxt_state=s2;
        end
      s2:
         if(a)begin
          nxt_state=s3;
        end
        else begin
          nxt_state=s0;
        end
      s3:
         if(a)begin
          nxt_state=s4;
        end
        else begin
          nxt_state=s2;
        end
      s4:begin
         if(a)begin
          nxt_state=s0;
        end
        else begin
          nxt_state=s0;
        end
       y=1'b1;
      end
      default:nxt_state=s0;
    endcase
  end
endmodule
