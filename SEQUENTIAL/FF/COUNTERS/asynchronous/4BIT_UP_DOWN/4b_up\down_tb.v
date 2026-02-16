module  asyn_4b_up_down_counter_tb();
  reg clk,res,m;
  wire [3:0]q;
  asyn_4b_up_down_counter dut(clk,res,m,q);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t,clk=%b,res=%b,m=%b,q=%b",$time,clk,res,m,q);
    clk=0;res=1;m=0;
    #10 res=0;
    #200 m=1;
    #5   res=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars('0,asyn_4b_up_down_counter_tb);
    #500 $finish;
  end
endmodule
