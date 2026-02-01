module Fulladder_tb();
  reg a,b,c;
  wire s,cout;
  Fulladder dut(.a(a),.b(b),.c(c),.s(s),.cout(cout));
  initial begin
        a=0;b=0;c=0;#5
        a=0;b=0;c=1;#5
        a=0;b=1;c=0;#5
        a=0;b=1;c=1;#5
        a=1;b=0;c=0;#5
        a=1;b=0;c=1;#5
        a=1;b=1;c=0;#5
        a=1;b=1;c=1;
  end 
  initial begin
   $monitor ("time=%0t a=%b b=%b c=%b s=%b cout=%b",$time,a,b,c,s,cout);
  end
endmodule
