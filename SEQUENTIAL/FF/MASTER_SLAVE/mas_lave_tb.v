
module  mas_lave_tb();
  reg j,k,res,clk;
  wire qm,qs;
  mas_lave dut (j,k,clk,res,qm,qs);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,j=%b,k=%b,clk=%b,res=%b,qm=%b,qs=%b",$time,j,k,clk,res,qm,qs);
    j=0;k=0;res=1;clk=0;
#10;res=0;
#4 ;j=0;k=0;
#10;j=1;k=0;
#10;j=1;k=1;
#10;j=0;k=0;
#10;j=0;k=1;
#10;j=1;k=0;
#10;j=1;k=1;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,mas_lave_tb);
    #200
    $finish;
  end
endmodule
