module mealey_non_overlap(input a,res,clk,output reg y);
  localparam [1:0] s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg [1:0]state,nxt_state;
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
          nxt_state=s0;
        end
        else begin
          nxt_state=s2;
        end
      default:nxt_state=s0;
    endcase
  end
  always @(posedge clk)
  y=((state==s3)&&(a==1));
endmodule
