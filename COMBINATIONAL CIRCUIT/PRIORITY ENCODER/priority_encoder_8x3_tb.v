module encoder_8x3_tb();
  reg [7:0]a;
  wire [2:0]b;
  reg en;
  encoder_8x3 dut (a,en,b);
  initial begin
    $monitor("time=%0t,en=%b,a=%b,b=%b",$time,en,a,b);
       en=1;a=8'b00000000;
    #5;en=1;a=8'b00011100;
    #5;en=1;a=8'b00001000;
    #5;en=1;a=8'b00010000;
    #5;en=1;a=8'b00100000;
    #5;en=1;a=8'b01000000;
    #5;en=1;a=8'b10000000;
    #5;en=0;a=8'b00000000;
    #5;en=0;a=8'b00011100;
    #5;en=0;a=8'b00001000;
    #5;en=0;a=8'b00010000;
    #5;en=0;a=8'b00100000;
    #5;en=0;a=8'b01000000;
    #5;en=0;a=8'b10000000;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,encoder_8x3_tb);
    #200 $finish;
  end 
endmodule
