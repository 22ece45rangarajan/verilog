module syn_mod_10_counter(clk,res,q);
  input clk,res;
  output reg[3:0]q;
  wire mode;
  assign  mode=(q[3] & ~q[2] & q[1] & ~q[0]);
  always@(posedge clk)begin
    if (res | mode)begin
      q<=0;
    end
    else begin
      q[0]<=~q[0];
      q[1]<=q[1]^q[0];
      q[2]<=q[2]^(q[1]&q[0]);
      q[3]<=q[3]^(q[2]&q[1]&q[0]);
    end
  end
endmodule
