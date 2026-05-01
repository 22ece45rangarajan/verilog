module fsm_2(clk,rst,x,y);
  input  clk,rst,x;
  output y;
  
  localparam [2:0] s0   =0,//rem_1
                   s1   =1,//rem_2
                   s2   =2,//rem_3
                   s3   =3,//rem_4
                   s4   =4;//rem_0
  reg  [2:0] nxt_state,state;
  
  always@(posedge clk)begin
    if(rst)
      state<=s0;
    else
      state<=nxt_state;
  end
  
  always@(*)begin
    case(state)
      s0:nxt_state= x?s0:s4;
      s1:nxt_state= x?s2:s1;
      s2:nxt_state= x?s4:s3;
      s3:nxt_state= x?s1:s0;
      s4:nxt_state= x?s3:s2;
      
      default:nxt_state=s0;
      
    endcase
  end
  
  assign y=(state==s4);
endmodule 
