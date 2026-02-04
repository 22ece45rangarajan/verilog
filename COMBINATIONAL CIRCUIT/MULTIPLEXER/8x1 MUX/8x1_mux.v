module mux8x1(a,b,c,d,e,f,g,h,s,out);
  input a,b,c,d,e,f,g,h;
  input [2:0]s;
  output out;
  assign out= s[2]?(s[1]?(s[0]?h:g):(s[0] ? f:e)):(s[1] ? (s[0]? d:c):(s[0]? b:a));
endmodule
  
