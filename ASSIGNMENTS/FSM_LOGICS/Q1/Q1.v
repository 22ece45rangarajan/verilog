module fsm_1(clk,rst,x,y);
  input  clk,rst,x;
  output y;
  
  localparam [2:0] s0=0,
                   s1=1,
                   s2=2,
                   s3=3,
                   s4=4,
                   s5=5,
                   s6=6;
  reg  [2:0] nxt_state,state;
  
  always@(posedge clk)begin
    if(rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  
  always@(*)begin
    case(state)
      s0:nxt_state= x?s1:s4;
      s1:nxt_state= x?s2:s4;
      s2:nxt_state= x?s3:s4;
      s3:nxt_state= x?s2:s4;
      s4:nxt_state= x?s1:s5;
      s5:nxt_state= x?s1:s6;
      s6:nxt_state= x?s1:s5;
      
      default:nxt_state=s0;
      
    endcase
  end
  
  assign y=((state==s3)||(state==s6));
endmodule 
