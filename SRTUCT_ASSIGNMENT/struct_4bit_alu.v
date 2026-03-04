//Design a 4-bit Arithmetic Logic Unit (ALU) using structural modeling.
module adder_4bit(a,b,cin,sum,cout);
  input [3:0]a,b;
  input cin;
  output [3:0]sum;
  output cout;
  assign {cout,sum}=a+b+cin;
endmodule
module sub_4bit(a,b,cin,d,bout);
  input [3:0]a,b;
  input cin;
  output [3:0]d;
  output bout;
  assign {bout,d}=a+(~b+cin);
endmodule
module reduced_and(a,re_and);
  input [3:0]a;
  output [3:0]re_and;
  assign re_and={4{&a}};
endmodule
module divide_4bit(a,b,out);
  input [3:0]a,b;
  output [3:0]out;
  assign out=(b==0)?4'bxxxx:a/b;
endmodule
module mux4x1(a,b,c,d,s,out);
  input a,b,c,d;
  input [1:0]s;
  output out;
  assign out= s[1] ?((s[0]? d:c)):((s[0]?b:a)); 
endmodule
module bit_4alu(a,b,cin,sel,total_out,carry_out);
  input [3:0]a,b;
  input cin;
  input [1:0]sel;
  output [3:0]total_out;
  output carry_out;
  wire [3:0] add_out,sub_out,divide_out,red_and_out;
  wire car_out,borroww_out;
  
  adder_4bit add_4(.a(a),.b(b),.cin(cin),.sum(add_out),.cout(car_out));
  sub_4bit   sub_4(.a(a),.b(b),.cin(cin),.d(sub_out),.bout(borroww_out));
  reduced_and red_1(.a(a),.re_and(red_and_out));
  divide_4bit div(.a(a),.b(b),.out(divide_out));
  genvar i;
  generate
    for(i=0;i<4;i=i+1)begin
      mux4x1 mux_4bit(.a(add_out[i]),.b(sub_out[i]),.c(red_and_out[i]),.d(divide_out[i]),.s(sel),.out(total_out[i]));
    end
  endgenerate
  assign carry_out=(sel==2'b00)? car_out:(sel==2'b01)? borroww_out:1'b0;
endmodule

//__test_bench__

module alu_tb();
  reg [3:0]a,b;
  reg cin;
  reg [1:0]sel;
  wire [3:0]total_out;
  wire carry_out;
  wire [4:0]result;
  assign result = {carry_out,total_out};
  bit_4alu dut(.*);
  initial begin
    $monitor("time=%0t||a=%d||b=%d||sel=%b||result=%d||carry_out=%b",$time,a,b,sel,result,carry_out);
    a=4'b1111;b=4'b1111;sel=2'b00;cin=1'b0;
 #5;a=4'b1110;b=4'b0011;sel=2'b01;cin=1'b1;
 #5;a=4'b1111;b=4'b0111;sel=2'b10;cin=1'b0;
 #5;a=4'b1110;b=4'b1110;sel=2'b11;cin=1'b0;
  end 
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars;
    #20 $finish;
  end 
endmodule

                   
  
  
  
