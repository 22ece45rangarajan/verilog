module piso(d,res,clk,load,y);
  input [3:0]d;
  input res,clk,load;
  output reg y;
  reg [3:0]q;
  always@(posedge clk or posedge res)begin
    if(res)begin
      y<=1'b0;
      q<=4'b0000;
    end
    else if(load)begin
        q<=d;
    end
      else begin
        q<=q>>1;
      end
    y<=q[0];
  end
endmodule
