module FA2HA();
  reg a,b,c;;
  reg sum,carry;
  FA dut(a,b,c,sum,carry);
  initial begin
    $monitor ("time=0%t,a=%b,b=%b,c=%b | sum=%b,carry=%b",$time,a,b,c,sum,carry);
    #10;a=0;b=0;c=1;
    #10;a=0;b=1;c=1;
    #10;a=1;b=1;c=1;
    #10;a=0;b=0;c=0;
    #10;a=0;b=1;c=0;
    #10;a=1;b=1;c=0;
  end 
endmodule
