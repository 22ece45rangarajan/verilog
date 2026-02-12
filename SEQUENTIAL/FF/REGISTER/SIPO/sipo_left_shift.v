module sipo(d,res,clk,y);
  input d;
  input res,clk;
  output reg[3:0]y;
  reg [3:0]q;
  always@(posedge clk)begin
    if(res)begin
      q<=4'b0000;
    end
    else begin
      q<=q<<1;
      q[0]<=d;
      y<=q;
    end
   end
endmodule
