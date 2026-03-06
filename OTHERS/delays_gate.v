//(Implement Y= A|B|C + A.B.E + |B.C + C|D using delay value 3 for and gates, 2 for or 
// gates and 4 for not gates. Use two inputs and, or gates only. Use $Monitor for displaying 
// result on transcript ,also turn off display for 50 time units and then continue displaying 
// the results. Note: |B|C means (not B) and (not c) )
module gate_delay(A,B,C,D,E,Y);
  input A,B,C,D,E;
  output Y;
  wire p,q,r,s,t,x,z,w,x11,x12,x13;
  not #(4)(x12,C);
  not #(4)(x11,B);
  not #(4)(x13,D);
  and #(3)(p,x11,x12);
  and #(3)(x,A,B);
  and #(3)(q,E,x);
  and #(3)(r,x11,C);
  and #(3)(s,C,x13);
  or  #(2)(t,r,s);
  or  #(2)(z,A,p);
  or  #(2)(w,q,t);
  or  #(2)(Y,z,w);
endmodule

//___test_bench___

  module gate_delay_tb();
  reg A,B,C,D,E;
  wire Y;
  gate_delay dut(.*);
  initial begin
    $monitor("time=%0t||A=%b||B=%b||C=%b||D=%b||E=%b||Y=%b",$time,A,B,C,D,E,Y);
     A=0;B=0;C=0;D=0;E=0;
 #10 A=1;B=0;C=1;D=0;E=1;
 #10 $monitoroff;
 #50 $monitoron;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,gate_delay_tb);
    #150 $finish;
  end
endmodule
    
