module freq_divider_6(clk_in,res,clk_out);
  input clk_in,res;
  output   clk_out;
  reg [2:0]counter;
  reg pos_count,neg_count;
  always @(posedge clk_in)begin
    if(res)begin
      counter<=0;
      pos_count<=0;
      neg_count<=0;
    end
    else begin
      if(counter==3'd5)
        counter<=0;
      else
        counter<=counter+1;
    end
  end
  always@(posedge clk_in)begin
    pos_count<=(counter==0);
  end
  always@(negedge clk_in)begin
    neg_count<=(pos_count);
  end
  assign clk_out=pos_count|neg_count;
endmodule
