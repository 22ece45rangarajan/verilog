module  dff_tb();
  reg d,res,clk;
  wire q;
  dff dut (d,res,clk,q);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,d=%b,res=%b,clk=%b,q=%b",$time,d,res,clk,q);
    d=0;res=0;clk=0;
    #10;res=0;d=1;
    #5;res=1;
    #7;res=1;d=1;
    #40;res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #500
    $finish;
  end
endmodule
