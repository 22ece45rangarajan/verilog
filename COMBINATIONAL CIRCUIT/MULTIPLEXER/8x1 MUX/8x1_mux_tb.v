module mux8x1_tb();
  reg a,b,c,d,e,f,g,h;
  reg [2:0]s;
  wire o;
  mux8x1 dut(a,b,c,d,e,f,g,h,s,o);
  initial begin
    $monitor("time=%0t,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b,h=%b,s=%b,o=%b",$time,a,b,c,d,e,f,g,h,s,o);
    a=1;b=0;c=1;d=0;e=1;f=0;g=1;h=0;
    s=3'b000;#5;
    s=3'b001;#5;
    s=3'b010;#5;
    s=3'b011;#5;
    s=3'b100;#5;
    s=3'b101;#5;
    s=3'b110;#5;
    s=3'b111;#5;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,mux8x1_tb);
    #70 $finish;
  end 
endmodule
