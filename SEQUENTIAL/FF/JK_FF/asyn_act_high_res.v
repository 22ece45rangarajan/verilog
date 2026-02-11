module jkff(j,k,res,clk,q);
  input j,k,res,clk;
  output reg q;
  always @ (posedge clk or posedge res)begin
    if (res)
      q<=0;
    else begin
      case({j,k})
        0:q<=q;
        1:q<=0;
        2:q<=1;
        default:q<=~q;
      endcase
    end
  end 
endmodule
