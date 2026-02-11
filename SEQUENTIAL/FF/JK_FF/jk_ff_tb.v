module  jkff_tb();
  reg j,k,res,clk;
  wire q;
  jkff dut (j,k,res,clk,q);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,j=%b,k=%b,res=%b,clk=%b,q=%b",$time,j,k,res,clk,q);
    j=0;k=0;res=0;clk=0;
#10;j=0;k=1;res=1;
#10;j=1;k=0;res=1;
#10;j=1;k=1;res=1;
#10;j=0;k=0;res=0;
#10;j=0;k=1;res=0;
#10;j=1;k=0;res=0;
#10;j=1;k=1;res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #200
    $finish;
  end
endmodule
