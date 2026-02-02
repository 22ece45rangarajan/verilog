module RIPPLE_CARRY_ADDER(A,B,Cin,S,Cout);
  input[3:0] A, B;
  input Cin;
  output[3:0]S;
  output Cout;
  assign {Cout,S}=A+B+Cin;
endmodule
  
