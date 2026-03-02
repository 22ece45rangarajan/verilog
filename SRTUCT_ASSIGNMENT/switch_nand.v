module switch_nand(a,b,y);
  input a,b;
  output y;
  tri y;
  supply0 gnd;
  supply1 vdd;
  wire x;
  pmos p1(y,vdd,a);
  pmos p2(y,vdd,b);
  nmos n1(y,x,a);
  nmos n2(x,gnd,b);
endmodule 
  
//_test_bench_

module switch_nand_tb();
  reg a,b;
  wire y;
switch_nand dut (a,b,y);
  initial begin
    $monitor("time=%0t,a=%b,b=%b,y=%b",$time,a,b,y);
    a=0;b=0;
  #10 a=0;b=1;
  #10 a=1;b=1;
  #10 a=1;b=0;
  #10 a=1;b=1;
  end
endmodule
