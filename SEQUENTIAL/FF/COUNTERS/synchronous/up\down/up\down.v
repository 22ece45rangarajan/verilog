module syn_up_down_counter(m,clk,res,q);
  input m,clk,res;
  output reg[3:0]q;
  always@(posedge clk)begin
    if (res)begin
      q<=0;
    end
    else begin
      q[0]<=~q[0];
      q[1]<=q[1]^(m?(q[0]):(~q[0]));
      q[2]<=q[2]^(m?(q[1]&q[0]):(~q[1] & ~q[0]));
      q[3]<=q[3]^(m?(q[2]&q[1]&q[0]):(~q[2] & ~q[1]& ~q[0]));
    end
  end
endmodule
