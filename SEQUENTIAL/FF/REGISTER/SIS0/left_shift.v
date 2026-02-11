module siso(d,res,clk,y);
  input d;
  input res,clk;
  output y;
  reg [3:0]q;
  always@(posedge clk)begin
    if(res)begin
      q<=4'b0000;
    end
    else begin
      q<=q>>1;
      q[3]<=d;
    end
   end
   assign y=q[0];
endmodule
