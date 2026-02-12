module sipo_tb();
  reg d;
  reg res,clk;
  wire [3:0]y;
  sipo  dut(d,res,clk,y);
  always #5 clk= ~clk;
  always #10 d=~d;
  
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
