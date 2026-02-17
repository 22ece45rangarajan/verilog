module moore_non_overlap_tb();
  reg a,clk,res;
  wire y;
  moore_non_overlap dut(a,res,clk,y);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t||a=%b,,res=%b,clk=%b,y=%b",$time,a,res,clk,y);
    res=1;a=0;clk=0;
    #5 res=0;
    @(negedge clk) a=1;
    @(negedge clk) a=0;
    @(negedge clk) a=1;
    @(negedge clk) a=1;
    @(negedge clk) a=0;
    @(negedge clk) a=1;
    @(negedge clk) a=1;
    @(negedge clk) a=1;
    @(negedge clk) a=1;
    @(negedge clk) a=0;
    @(negedge clk) a=1;
    @(negedge clk) a=1;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #150 $finish;
  end
endmodule
