module  tff_tb();
  reg t,res,clk;
  wire q;
  tff dut (t,res,clk,q);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,t=%b,res=%b,clk=%b,q=%b",$time,t,res,clk,q);
    t=0;res=0;clk=0;
    #10;res=0;t=1;
    #5;res=1;
    #7;res=0;t=1;
    #40;res=1;
    #10;res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #500
    $finish;
  end
endmodule
