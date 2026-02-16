// Code your design here
module  asyn_4b_up_counter(clk,res,q);
  input clk,res;
  output reg[3:0]q;
  always @(negedge clk or posedge res )begin
    if(res)begin
      q[0]<=0;
    end
      else begin 
        q[0]<=~q[0];
      end 
  end
  always @(negedge q[0] or posedge res )begin
    if(res)begin
      q[1]<=0;
    end
      else begin 
        q[1]<=~q[1];
      end 
  end
  always @(negedge q[1] or posedge res )begin
    if(res)begin
      q[2]<=0;
    end
      else begin 
        q[2]<=~q[2];
      end 
  end
  always @(negedge q[2] or posedge res )begin
    if(res)begin
      q[3]<=0;
    end
      else begin 
        q[3]<=~q[3];
      end 
    end
endmodule 
