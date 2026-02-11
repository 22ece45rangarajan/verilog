module tff(t,res,clk,q);
  input t,res,clk;
  output reg q;
  always @ (posedge clk or posedge res)begin
    if (res)
      case(t)
        0:q<=q;
        1:q<=~q;
      endcase
    else
      q<=0;
  end 
endmodule
