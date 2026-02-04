module mux2x1_tb();
  reg a,b,s;
  wire o;
  mux2x1 dut(a,b,s,o);
  initial begin
    $monitor("time=%0t,a=%b,b=%b,s=%b,o=%b",$time,a,b,s,o);
    #5;s=0;a=0;b=0;
    #5;s=0;a=0;b=1;
    #5;s=0;a=1;b=0;
    #5;s=0;a=1;b=1;
    #5;s=1;a=0;b=0;
    #5;s=1;a=0;b=1;
    #5;s=1;a=1;b=0;
    #5;s=1;a=1;b=1;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,mux2x1_tb);
    #70 $finish;
  end 
endmodule
