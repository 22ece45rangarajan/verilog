module mux_Nx1_tb();
  parameter n=8;
  parameter r=3;
  reg [n-1:0] a;
  reg [r-1:0] s;
  wire y;
  integer i,j;
  mux_Nx1 dut(a,s,y);
  initial begin
    $monitor("time=%0t, a=%b,s=%b,y=%b",$time,a,s,y);
    for (i=0;i<257;i=i+1)begin
      a=i;
      for (j=0;j<8;j=j+1) begin
         s=j;
      #10;
      end
    end
  end
 initial begin
    $monitor("time=%0t, a=%b,s=%b,y=%b",$time,a,s,y);
    $dumpfile("TVK.vcd");
    $dumpvars(0,mux_Nx1_tb);
    #30000 $finish;
  end 
endmodule
