module mux_Nx1 #(parameter n=8,parameter r=3)(d,s,y);
  input [n-1:0] d;
  input [r-1:0]s;
  output y;
  assign y=d[s];
endmodule
