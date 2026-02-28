//Design a full adder using a half adder.
module ha(input a,b,output SUM,CARRY);
  assign SUM=a^b;
  assign CARRY=a&b;
endmodule


module FA(input A,B,C, output Sum,COUT);
  wire S1,C1,C2;
  ha HA1(.a(A),.b(B),.SUM(S1),.CARRY(C1));
  ha HA2(.a(S1),.b(C),.SUM(Sum),.CARRY(C2));
  assign COUT=C1|C2;
endmodule
//test_bench
module FA2HA();
  reg a,b,c;;
  reg sum,carry;
  FA dut(a,b,c,sum,carry);
  initial begin
    $monitor ("time=0%t,a=%b,b=%b,c=%b | sum=%b,carry=%b",$time,a,b,c,sum,carry);
    #10;a=0;b=0;c=1;
    #10;a=0;b=1;c=1;
    #10;a=1;b=1;c=1;
    #10;a=0;b=0;c=0;
    #10;a=0;b=1;c=0;
    #10;a=1;b=1;c=0;
  end 
  initial begin
    $dumpfile("BLEACH.vcd";
              $dumpvarse("0,FA2HA);
                         #100 $finish:
endmodule
