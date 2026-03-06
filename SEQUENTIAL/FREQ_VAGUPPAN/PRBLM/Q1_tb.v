module freq_divider_10_tb();
  reg clk_in,res;
  wire clk_out;
  freq_divider_10 dut(.*);
  always #5 clk_in=~clk_in;
  initial begin
    $monitor("time=%0t||clk_in=%b||res=%b||clk_out=%b",$time,clk_in,res,clk_out);
    res=1;clk_in=0;
 #10 res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,freq_divider_10_tb);
    #1500 $finish;
  end
endmodule
