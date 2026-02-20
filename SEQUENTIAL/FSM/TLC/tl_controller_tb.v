module tl_controler_tb();
  reg res,clk;
  wire [2:0]NS,EW,P_NS,P_EW;
  tl_controler dut(clk,res,NS,EW,P_NS,P_EW);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t|clk=%b|res=%b|NS=%b|EW=%b|P_NS=%b|P_EW=%b",$time,clk,res,NS,EW,P_NS,P_EW);
    clk=0;res=1;
    #10 res=0;
    #90 res=1;
    #10 res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,tl_controler_tb);
    #500 $finish;
  end
endmodule
