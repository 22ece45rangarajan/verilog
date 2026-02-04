module mux4x1_tb();
  reg a,b,c,d;
  reg [1:0]s;
  wire o;
  mux4x1 dut(a,b,c,d,s,o);
  initial begin
    $monitor("time=%0t,a=%b,b=%b,c=%b,d=%b,s=%b,o=%b",$time,a,b,c,d,s,o);
    #5;s=0;a=0;b=0;c=0;d=0;
    #5;s=0;a=0;b=0;c=0;d=1;
    #5;s=0;a=0;b=0;c=1;d=0;
    #5;s=0;a=0;b=0;c=1;d=1;
    #5;s=0;a=0;b=0;c=0;d=0;
    #5;s=0;a=0;b=1;c=0;d=1;
    #5;s=0;a=0;b=1;c=1;d=0;
    #5;s=0;a=0;b=1;c=1;d=1;
    #5;s=0;a=1;b=1;c=0;d=0;
    #5;s=0;a=1;b=0;c=0;d=1;
    #5;s=0;a=1;b=0;c=1;d=0;
    #5;s=0;a=1;b=0;c=1;d=1;
    #5;s=0;a=1;b=1;c=0;d=0;
    #5;s=0;a=1;b=1;c=0;d=1;
    #5;s=0;a=1;b=1;c=1;d=0;
    #5;s=0;a=1;b=1;c=1;d=1;
    #5;s=1;a=0;b=0;c=0;d=0;
    #5;s=1;a=0;b=0;c=0;d=1;
    #5;s=1;a=0;b=0;c=1;d=0;
    #5;s=1;a=0;b=0;c=1;d=1;
    #5;s=1;a=0;b=0;c=0;d=0;
    #5;s=1;a=0;b=1;c=0;d=1;
    #5;s=1;a=0;b=1;c=1;d=0;
    #5;s=1;a=0;b=1;c=1;d=1;
    #5;s=1;a=1;b=1;c=0;d=0;
    #5;s=1;a=1;b=0;c=0;d=1;
    #5;s=1;a=1;b=0;c=1;d=0;
    #5;s=1;a=1;b=0;c=1;d=1;
    #5;s=1;a=1;b=1;c=0;d=0;
    #5;s=1;a=1;b=1;c=0;d=1;
    #5;s=1;a=1;b=1;c=1;d=0;
    #5;s=1;a=1;b=1;c=1;d=1;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,mux4x1_tb);
    #200 $finish;
  end 
endmodule
