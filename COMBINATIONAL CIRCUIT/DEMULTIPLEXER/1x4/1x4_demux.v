module demux_1x4(a,s,y0,y1,y2,y3);
  input a;
  input [1:0]s;
  output y0,y1,y2,y3;
  assign y0=(s==2'b00)?a:1'b0;
  assign y1=(s==2'b01)?a:1'b0;
  assign y2=(s==2'b10)?a:1'b0;
  assign y3=(s==2'b11)?a:1'b0;
endmodule
