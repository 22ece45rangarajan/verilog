module bd_siso_tb();
  reg d,res,bd,clk;
  wire y;
  bd_siso  dut(d,res,bd,clk,y);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=0%t,d=%b,res=%b,bd=%b,clk=%b,y=%b",$time,d,res,bd,clk,y);
   d=0;res=0;bd=0;clk=0;
   #15 d=1;bd=1;
   #45 d=0;bd=0;
   #45 d=1;bd=1;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #250 $finish;
  end
endmodule
