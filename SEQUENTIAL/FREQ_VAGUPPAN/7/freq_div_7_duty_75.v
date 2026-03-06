module freq_divider_7(clk_in,res,clk_out);
  input clk_in,res;
  output reg  clk_out;
  reg [2:0]counter;
  always @(posedge clk_in)begin
    if(res)begin
      clk_out<=0;
      counter<=0;
    end
    else begin
      if(counter==6)begin
          counter<=0;
      end
      else begin
      counter<=counter+1;
      if(counter>1)
        clk_out<=1;
      else
        clk_out<=0;
        end
    end
  end
endmodule
