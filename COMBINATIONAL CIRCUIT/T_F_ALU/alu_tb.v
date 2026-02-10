module alu_tb();
  reg [3:0]a,b;
  reg [2:0] s;
  wire [7:0]y;
  alu dut(a,b,s,y);
  initial begin
    $monitor("time=%0t,a=%b,b=%b,s=%b,y=%b",$time,a,b,s,y);
    a=4'b1110;b=4'b0011;s=3'b000;
 #5;a=4'b1110;b=4'b0011;s=3'b100;
 #5;a=4'b1110;b=4'b0011;s=3'b101; 
 #5;a=4'b1110;b=4'b0011;s=3'b110;
  end 
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars;
    #20 $finish;
  end 
endmodule
