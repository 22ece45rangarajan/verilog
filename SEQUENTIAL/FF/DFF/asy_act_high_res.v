module dff(d,res,clk,q);
  input d,res,clk;
  output reg q;
  always @ (posedge clk or posedge res)begin
    if (res)
      q<=0;
    else
      q<=d;
  end 
endmodule
