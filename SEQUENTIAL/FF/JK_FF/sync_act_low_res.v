module jkff(j,k,res,clk,q);
  input j,k,res,clk;
  output reg q;
  always @ (posedge clk)begin
    if (res)
      case({j,k})
        0:q<=q;
        1:q<=0;
        2:q<=1;
        default:q<=~q;
      endcase
    else begin
      q<=0;
    end
  end 
endmodule
