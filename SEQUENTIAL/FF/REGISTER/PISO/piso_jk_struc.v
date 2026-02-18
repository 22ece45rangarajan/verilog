module jkff(j,k,res,clk,q);
  input j,k,res,clk;
  output reg q;
  always @ (posedge clk or posedge res)begin
    if (res)
      q<=0;
    else begin
      case({j,k})
        0:q<=q;
        1:q<=0;
        2:q<=1;
        default:q<=~q;
      endcase
    end
  end 
endmodule
module piso_jk(d,res,clk,load,o);
  input [3:0]d;
  input load,res,clk;
  output o;
  wire [3:0]q;
  wire [3:0] x;
  assign o=q[3];
  assign x[0]=load?d[0]:1'b0;
  assign x[1]=load?d[1]:q[0];
  assign x[2]=load?d[2]:q[1];
  assign x[3]=load?d[3]:q[2];
  jkff f0(x[0],~x[0],res,clk,q[0]);
  jkff f1(x[1],~x[1],res,clk,q[1]);
  jkff f2(x[2],~x[2],res,clk,q[2]);
  jkff f3(x[3],~x[3],res,clk,q[3]);
endmodule
