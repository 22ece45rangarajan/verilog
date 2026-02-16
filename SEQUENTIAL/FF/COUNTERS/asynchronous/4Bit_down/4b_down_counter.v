module  asyn_4b_down_counter(clk,res,q);
  input clk,res;
  output reg[3:0]q;
  always @(posedge clk or posedge res )begin
    if(res)begin
      q[0]<=0;
    end
      else begin 
        q[0]<=~q[0];
      end 
  end
  always @(posedge q[0] or posedge res )begin
    if(res)begin
      q[1]<=0;
    end
      else begin 
        q[1]<=~q[1];
      end 
  end
  always @(posedge q[1] or posedge res )begin
    if(res)begin
      q[2]<=0;
    end
      else begin 
        q[2]<=~q[2];
      end 
  end
  always @(posedge q[2] or posedge res )begin
    if(res)begin
      q[3]<=0;
    end
      else begin 
        q[3]<=~q[3];
      end 
    end
endmodule 
