module ha_tb();
reg a,b;
wire s,c;
  ha dut(.a(a),.b(b),.c(c),.s(s));
  
  initial begin
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
  end
  initial begin 
    $monitor("time=0%t,   a=%b,b=%b,  s=%b, c=%b",$time,a,b,s,c);
  end
endmodule
