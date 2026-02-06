module N_BIT_B2G_tb();
  parameter n=4;
  reg[n-1:0]b;
  reg[n-1:0]g;
  N_BIT_B2G dut(b,g);
  initial begin 
    $monitor("time=%0t,b=%b,g=%b",$time,b,g);
    b=4'b0100;
    #5;b=4'b0101;
    #5;b=4'b0111;
    #5;b=4'b0011;
    #5;b=4'b1101;
    #5;b=4'b1001;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,N_BIT_B2G_tb);
    #70 $finish;
  end 
endmodule
