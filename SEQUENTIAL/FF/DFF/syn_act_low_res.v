module dff(d,res,clk,q);
  input d,res,clk;
  output reg q;
  always @ (posedge clk)begin
    if (res)
      q<=d;
    else
      q<=0;
  end 
endmodule
