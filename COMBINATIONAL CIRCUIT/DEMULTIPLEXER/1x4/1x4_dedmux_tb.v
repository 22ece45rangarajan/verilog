module demux_1x4_tb();
  reg a;
  reg [1:0]s;
  wire y0,y1,y2,y3;
  demux_1x4 dut(a,s,y0,y1,y2,y3);
  initial begin 
    $monitor("time=%0t, a=%b,s=%b,y0=%b,y1=%b,y2=%b,y3=%b,",$time,a,s,y0,y1,y2,y3);
    a=0;s=2'b00;#10;
    a=0;s=2'b01;#10;
    a=0;s=2'b10;#10;
    a=0;s=2'b11;#10;
    a=1;s=2'b00;#10;
    a=1;s=2'b01;#10;
    a=1;s=2'b10;#10;
    a=1;s=2'b11;#10;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,demux_1x4_tb);
    #100 $finish;
  end 
endmodule
