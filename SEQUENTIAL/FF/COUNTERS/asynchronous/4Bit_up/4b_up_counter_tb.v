module  asyn_4b_up_counter_tb();
  reg clk,res;
  wire [3:0]q;
  asyn_4b_up_counter dut(clk,res,q);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t,clk=%b,res=%b,q=%b",$time,clk,,res,q);
    clk=0;res=0;
    #200 res=1;
    #5   res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #500 $finish;
  end
endmodule
