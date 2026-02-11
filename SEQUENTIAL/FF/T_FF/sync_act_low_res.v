module tff(t,res,clk,q);
  input t,res,clk;
  output reg q;
  always @ (posedge clk)begin
    if (res)
      case(t)
        0:q<=q;
        1:q<=~q;
        default:q<=0;
      endcase
    else
      q<=0;
  end 
endmodule
