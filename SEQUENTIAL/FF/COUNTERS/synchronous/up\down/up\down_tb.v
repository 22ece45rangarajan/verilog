module  syn_up_down_counter_tb();
  reg m,clk,res;
  wire [3:0]q;
  syn_up_down_counter dut(m,clk,res,q);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t,m=%b,clk=%b,res=%b,q=%b",$time,m,clk,res,q);
    clk=0;res=1;m=1;
    #10 res=0;
    #200 res=0;m=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars('0,syn_up_down_counter_tb);
    #500 $finish;
  end
endmodule
