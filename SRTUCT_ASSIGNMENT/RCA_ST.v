//Design a 4-bit Ripple Carry Adder using structural modeling

module Fulladder(input a,b,Cin,output s,cout);
  assign s=a^b^Cin;
  assign cout=(a&b)|(b&Cin)|(a&Cin);
endmodule
module RCA(a,b,cin,s,c);
  input [3:0]a,b;
  input cin;
  output [3:0]s;
  output c;
  wire c0,c1,c2;
  Fulladder FA1(.a(a[0]),.b(b[0]),.Cin(cin),.s(s[0]),.cout(c0));
  Fulladder FA2(.a(a[1]),.b(b[1]),.Cin(c0),.s(s[1]),.cout(c1));
  Fulladder FA3(.a(a[2]),.b(b[2]),.Cin(c1),.s(s[2]),.cout(c2));
  Fulladder FA4(.a(a[3]),.b(b[3]),.Cin(c2),.s(s[3]),.cout(c));
endmodule

//test_bench


module RIPPLE_CARRY_ADDER_TB();
 reg[3:0] A, B;
 reg Cin;
 wire[3:0]SUM;
 wire CARRY; 
 RCA dut(A,B,Cin,SUM,CARRY);
  initial begin 
    $monitor("time=%0t,A=%d,B=%d,Cin=%d | SUM=%d,CARRY=%d",$time,A,B,Cin,SUM,CARRY);
    
    #10;A=4'b0000;B=4'b0000;Cin=0;
    #10;A=4'b0001;B=4'b0001;Cin=0;
    #10;A=4'b0010;B=4'b0010;Cin=0;
    #10;A=4'b0011;B=4'b0011;Cin=0;
    #10;A=4'b0100;B=4'b0100;Cin=0;
    #10;A=4'b1101;B=4'b1101;Cin=0;
    #10;A=4'b0000;B=4'b0000;Cin=1;
    #10;A=4'b0001;B=4'b0001;Cin=1;
    #10;A=4'b0010;B=4'b0010;Cin=1;
    #10;A=4'b0011;B=4'b0011;Cin=1;
    #10;A=4'b0100;B=4'b0100;Cin=1;
    #10;A=4'b1101;B=4'b1101;Cin=1;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,RIPPLE_CARRY_ADDER_TB);
    #150 $finish;
  end 
endmodule




