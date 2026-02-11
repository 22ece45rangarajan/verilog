module  srff_tb();
  reg s,r,res,clk;
  wire q;
  srff dut (s,r,res,clk,q);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,s=%b,r=%b,res=%b,clk=%b,q=%b",$time,s,r,res,clk,q);
    s=0;r=0;res=0;clk=0;
#10;s=0;r=1;res=1;
#10;s=1;r=0;res=1;
#10;s=1;r=1;res=1;
#10;s=0;r=0;res=0;
#10;s=0;r=1;res=0;
#10;s=1;r=0;res=0;
#10;s=1;r=1;res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #200
    $finish;
  end
endmodule
