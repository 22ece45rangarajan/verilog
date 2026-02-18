module piso_tb();
  reg [3:0]d;
  reg res,clk,load;
  wire y;
  piso  dut(d,res,clk,load,y);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,d=%b,res=%b,clk=%b,load=%b,y=%b",$time,d,res,clk,load,y);
  load=0;d=4'b0000;res=0;clk=0;
  #0;res=1;
  #10;res=0;
  #25;d=4'b1001;load=1;
  #5;load=0;
  #45;d=4'b1010;load=1;
  #5;load=0;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #150 $finish;
  end
endmodule
