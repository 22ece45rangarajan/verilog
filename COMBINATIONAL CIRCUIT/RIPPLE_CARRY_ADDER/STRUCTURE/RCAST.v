module Fulladder(input a,b,Cin,output s,cout);
  assign s=a^b^Cin;
  assign cout=(a&b)|(b&Cin)|(a&Cin);
endmodule
module RCA(a,b,cin,s,c);
  input [3:0]a,b;
  input cin;
  output [3:0]s;
  output c;
  wire c0,c1,c2;
  Fulladder FA1(.a(a[0]),.b(b[0]),.Cin(cin),.s(s[0]),.cout(c0));
  Fulladder FA2(.a(a[1]),.b(b[1]),.Cin(c0),.s(s[1]),.cout(c1));
  Fulladder FA3(.a(a[2]),.b(b[2]),.Cin(c1),.s(s[2]),.cout(c2));
  Fulladder FA4(.a(a[3]),.b(b[3]),.Cin(c2),.s(s[3]),.cout(c));
endmodule
