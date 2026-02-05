module demux_1x8_tb();
  reg a;
  reg [3:0]s;
  wire y0,y1,y2,y3,y4,y5,y6,y7;
  demux_1x8 dut(a,s,y0,y1,y2,y3,y4,y5,y6,y7);
  initial begin 
    $monitor("time=%0t, a=%b,s=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b,",$time,a,s,y0,y1,y2,y3,y4,y5,y6,y7);
    a=0;s=3'b000;#10;
    a=0;s=3'b001;#10;
    a=0;s=3'b010;#10;
    a=0;s=3'b011;#10;
    a=1;s=3'b100;#10;
    a=1;s=3'b101;#10;
    a=1;s=3'b110;#10;
    a=1;s=3'b111;#10;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,demux_1x8_tb);
    #100 $finish;
  end 
endmodule
