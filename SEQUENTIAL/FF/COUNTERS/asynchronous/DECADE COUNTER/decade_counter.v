module tff(t,clk,res,q);
  input t,res,clk;
  output reg q;
  always @ (posedge clk or posedge res)begin
    if (res)
      q<=0;
    else
      case(t)
        0:q<=q;
        1:q<=~q;
      default:q<=0;
      endcase
  end 
endmodule
module asy_decade_counter(input res,clk,output[3:0]q);
  wire mode;
  assign  mode=(q[3] & ~q[2] & q[1] & ~q[0]);
  tff t1(1'b1,clk,(res|mode),q[0]);
  tff t2(1'b1,~q[0],(res|mode),q[1]);
  tff t3(1'b1,~q[1],(res|mode),q[2]);
  tff t4(1'b1,~q[2],(res|mode),q[3]);
endmodule
