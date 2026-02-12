module pipo(d,res,clk,load,y);
  input [3:0]d;
  input res,clk,load;
  output reg [3:0]y;
  reg [3:0]q;
  always@(posedge clk)begin
    if(res)begin
      q<=4'b0000;
    end
    else if(load)begin
        q<=d;
    end
      else begin
       y<=q;
   end
  end
endmodule
