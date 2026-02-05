module demux_1x8(a,s,y0,y1,y2,y3,y4,y5,y6,y7);
  input a;
  input [3:0]s;
  output y0,y1,y2,y3,y4,y5,y6,y7;
  assign y0=(s==3'b000)?a:1'b0;
  assign y1=(s==3'b001)?a:1'b0;
  assign y2=(s==3'b010)?a:1'b0;
  assign y3=(s==3'b011)?a:1'b0;
  assign y4=(s==3'b100)?a:1'b0;
  assign y5=(s==3'b101)?a:1'b0;
  assign y6=(s==3'b110)?a:1'b0;
  assign y7=(s==3'b111)?a:1'b0;
endmodule
