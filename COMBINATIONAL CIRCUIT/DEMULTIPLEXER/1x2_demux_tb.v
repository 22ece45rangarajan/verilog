module demux_1x2_tb();
  reg a,s;
  wire y0,y1;
  demux_1x2 dut(a,s,y0,y1);
  initial begin 
    $monitor("time=%0t, a=%b,s=%b,y0=%b,y1=%b",$time,a,s,y1,y0);
    a=0;s=0;#10;
    a=0;s=1;#10;
    a=1;s=0;#10;
    a=1;s=1;#10;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,demux_1x2_tb);
    #70 $finish;
  end 
endmodule
