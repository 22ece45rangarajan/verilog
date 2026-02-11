module srff(s,r,res,clk,q);
  input s,r,res,clk;
  output reg q;
  always @ (posedge clk)begin
    if (res)
      q<=0;
    else begin
      case({s,r})
        0:q<=q;
        1:q<=0;
        2:q<=1;
        default:q<=1'bx;
      endcase
      end
  end
endmodule
