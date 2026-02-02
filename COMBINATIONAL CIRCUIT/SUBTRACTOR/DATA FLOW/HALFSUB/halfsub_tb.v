module hs_tb();
reg a,b;
wire d,bo;
  hs dut(a,b,d,bo);
  
  initial begin
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
  end
  initial begin 
    $monitor("time=0%t,   a=%b,b=%b,  d=%b, bo=%b",$time,a,b,d,bo);
  end
endmodule
