module  asy_decade_counter_tb();
  reg clk,res;
  wire [3:0]q;
  asy_decade_counter dut(res,clk,q);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t,clk=%b,res=%b,q=%b",$time,clk,res,q);
    clk=0;res=1;
    #10 res=0;
    #200 res=0;
    
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars('0,asy_decade_counter_tb);
    #500 $finish;
  end
endmodule
