
module piso_jk_tb();
  reg [3:0]d;
  reg res,clk,load;
  wire y;
  piso_jk dut(d,res,clk,load,y);
  always #5 clk= ~clk;
  initial begin
    $monitor("time=%t,d=%b,res=%b,clk=%b,load=%b,y=%b",$time,d,res,clk,load,y);
  load=0;d=4'b0000;res=0;clk=0;
  #1;res=1;
  #10;res=0;
    @(posedge clk);
    d=4'b1001;
    load=1;
    @(posedge clk);
    load=0;
    repeat(3)@(posedge clk);
    @(posedge clk);
    d=4'b1010;
    load=1;
    @(posedge clk);
    load=0;
    repeat(5)@(posedge clk);
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars;
    #150 $finish;
  end
endmodule
