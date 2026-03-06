module freq_divider_7(clk_in,res,clk_out);
  input clk_in,res;
  output reg  clk_out;
  reg [2:0]counter;
  always @(posedge clk_in)begin
    if(res)begin
      clk_out<=1;
      counter<=7;
    end
    else begin
      counter<=counter+1;
      if(counter==6)begin
          clk_out<=!clk_out;
      end
    end
  end
  always @(negedge clk_in)begin
    if(res)begin
      clk_out<=1;
      counter<=7;
    end
    else begin
      if(counter==3)begin
          clk_out<=!clk_out;
      end
    end
  end
endmodule
