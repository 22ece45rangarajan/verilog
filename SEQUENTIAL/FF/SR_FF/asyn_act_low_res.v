module srff(s,r,res,clk,q);
  input s,r,res,clk;
  output reg q;
  always @ (posedge clk or posedge res)begin
    if (res)
      case({s,r})
        0:q<=q;
        1:q<=0;
        2:q<=1;
        default:q<=1'bx;
      endcase
    else begin
      q<=0;
    end
  end
endmodule
