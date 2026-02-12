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
      q<=q<<1;// or q<={d,q[2:0];
      q[0]<=d;//
    end
   end
  assign y=q[3];
endmodule
