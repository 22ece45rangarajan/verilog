module bd_siso(d,res,bd,clk,y);
  input d,res,bd,clk;
  output reg y;
  reg [3:0]q;
  always@(posedge clk)begin
    if(res)begin
      q<=4'b0000;
    end
    else begin
      if(bd)begin
        q<={q[2:0],d};
       y<=q[3];
      end
      else begin
        q<={d,q[3:1]};
        y<=q[0];
      end
    end
  end
endmodule
