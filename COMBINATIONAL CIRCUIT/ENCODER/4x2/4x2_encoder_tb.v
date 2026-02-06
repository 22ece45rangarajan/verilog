module encoder_4x2_tb();
  reg [3:0]a;
  wire [1:0]b;
  encoder_4x2 dut (a,b);
  initial begin
    $monitor("time=%0t,a=%b,b=%b",$time,a,b);
       a=4'b0001;
    #5;a=4'b1000;
    #5;a=4'b0001;
    #5;a=4'b0010;
    #5;a=4'b0100;
    #5;a=4'b0011;
    #5;a=4'b1111;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,encoder_4x2_tb);
    #50 $finish;
  end 
endmodule
