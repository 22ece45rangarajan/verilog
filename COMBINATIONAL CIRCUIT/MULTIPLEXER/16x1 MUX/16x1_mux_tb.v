module mux_16x1_tb();
  reg [15:0] a;
  reg [3:0] s;
  wire y;
  integer i,j;
  mux_16x1 dut(a,s,y);
  initial begin
    $monitor("time=%0t, a=%b,s=%b,y=%b",$time,a,s,y);
    for (i=0;i<65537;i=i+1)begin
      a=i;
      for (j=0;j<16;j=j+1) begin
         s=j;
      #10;
      end
    end
  end
  
  initial begin
    $monitor("time=%0t, a=%b,s=%b,y=%b",$time,a,s,y);
    $dumpfile("TVK.vcd");
    $dumpvars(0,mux_16x1_tb);
    #30000 $finish;
  end 
endmodule
