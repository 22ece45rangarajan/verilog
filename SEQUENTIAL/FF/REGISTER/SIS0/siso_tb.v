module siso_tb();
  reg d;
  reg res,clk;
  wire y;
  siso  dut(d,res,clk,y);
  always #5 clk= ~clk;
  always #10 d=~d;
  always #50 res=~res;
  initial begin
    $monitor("time=0%t,d=%b,res=%b,clk=%b,y=%b",$time,d,res,clk,y);
   d=0;res=0;clk=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #250 $finish;
  end
endmodule
