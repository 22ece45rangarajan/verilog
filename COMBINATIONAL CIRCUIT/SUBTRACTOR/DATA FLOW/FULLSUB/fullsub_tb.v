module Fullsub_tb();
  reg a,b,c;
  wire d,borrow;
  Fullsub dut(.a(a),.b(b),.c(c),.d(d),.borrow(borrow));
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
    $monitor ("time=%0t a=%b b=%b c=%b d=%b borrow=%b",$time,a,b,c,d,borrow);
  end
endmodule
