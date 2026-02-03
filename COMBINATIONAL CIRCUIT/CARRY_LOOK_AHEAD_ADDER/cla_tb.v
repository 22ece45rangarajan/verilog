module CLA_TB();
  reg [3:0]a,b;
  reg c0;
  wire[3:0]s;
  wire c;
  CLA dut(a,b,c0,s,c);
  initial begin
    $monitor("time=%0t,a=%b,b=%b,c0=%b,s=%b,c=%b",$time,a,b,c0,s,c);
    #10;a=4'b0000;b=4'b0000;c0=0;
    #10;a=4'b0001;b=4'b0001;c0=0;
    #10;a=4'b0010;b=4'b0010;c0=0;
    #10;a=4'b0011;b=4'b0011;c0=0;
    #10;a=4'b0100;b=4'b0100;c0=0;
    #10;a=4'b1101;b=4'b1101;c0=0;
    #10;a=4'b0000;b=4'b0000;c0=1;
    #10;a=4'b0001;b=4'b0001;c0=1;
    #10;a=4'b0010;b=4'b0010;c0=1;
    #10;a=4'b0011;b=4'b0011;c0=1;
    #10;a=4'b0100;b=4'b0100;c0=1;
    #10;a=4'b1101;b=4'b1101;c0=1;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,CLA_TB);
    #150 $finish;
  end 
endmodule
