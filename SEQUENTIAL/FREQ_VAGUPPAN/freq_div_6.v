module freq_divider_6(clk_in,res,clk_out);
  input clk_in,res;
  output reg  clk_out;
  reg [2:0]counter;
  always @(posedge clk_in)begin
    if(res)begin
      clk_out<=0;
      counter<=0;
    end
    else if(counter==3'b010)begin
      counter<=0;
      clk_out<=~clk_out;
    end
    else 
      counter<=counter+1;
  end
endmodule
