module RIPPLE_CARRY_ADDER(A,B,Cin,S,Cout);
  input[3:0] A, B;
  input Cin;
  output[3:0]S;
  output Cout;
  wire C0,C1,C2;
  assign C0=Cin & (A[0]^B[0])|(A[0]&B[0]);
  assign C1=C0& (A[1]^B[1])|(A[1]&B[1]);
  assign C2=C1& (A[2]^B[2])|(A[2]&B[2]);
  assign Cout=C2 & (A[3]^B[3])|(A[3]&B[3]);
  assign S[0]=A[0]^B[0]^Cin;
  assign S[1]=A[1]^B[1]^C0;
  assign S[2]=A[2]^B[2]^C1;
  assign S[3]=A[3]^B[3]^C2;
endmodule
