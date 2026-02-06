module decoder_3x8_tb();
  reg [2:0]y;
  reg en;
  reg [7:0]d;
  deocder_3x8 dut(y,en,d);
  initial begin 
    $monitor("time=%0t,y=%b,en=%b,d=%b",$time,y,en,d);
    en=1;y=3'b000;
    #5;en=0;y=3'b010;
    #5;en=0;y=3'b011;
    #5;en=1;y=3'b100;
    #5;en=1;y=3'b101;
    #5;en=1;y=3'b110;
    #5;en=1;y=3'b111;
   end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,decoder_3x8_tb);
    #200 $finish;
  end 
endmodule
