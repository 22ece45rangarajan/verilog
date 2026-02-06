module decoder_2x4_tb();
  reg [1:0]y;
  reg en;
  reg [3:0]d;
  deocder_2x4 dut(y,en,d);
  initial begin 
    $monitor("time=0%t,y=%b,en=%b,d=%b",$time,y,en,d);
    en=1;y=2'b00;
    #5;en=0;y=2'b11;
    #5;en=0;y=2'b10;
    #5;en=1;y=2'b00;
    #5;en=1;y=2'b10;
    #5;en=1;y=2'b01;
    #5;en=1;y=2'b11;
   end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,decoder_2x4_tb);
    #200 $finish;
  end 
endmodule
