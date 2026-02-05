module demux_1x2(a,s,y0,y1);
  input a,s;
  output y0,y1;
  assign y0=s?a:1'b0;
  assign y1=s?1'b0:a;
endmodule
