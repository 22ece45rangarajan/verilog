//Multiplexer (8 to 1 mux)
//a. Implement 8 to 1 mux using 4 to 1 mux
//b. Write testbench to check design behaviour
module mux_4x1(a,sel,out);
  input [3:0]a;
  input [1:0]sel;
  output reg out;
  always@(*)begin
    case(sel)
      0:out=a[0];
      1:out=a[1];
      2:out=a[2];
      3:out=a[3];
      default :out=0;
    endcase
  end
endmodule 
module mux_2x1(a1,a0,sel,out);
  input a1,a0;
  input sel;
  output reg out;
  always@(*)begin
    case(sel)
      0:out=a0;
      1:out=a1;
      default :out=0;
    endcase
  end
endmodule 
module mux_8x1(a,sel,y);
  input [7:0]a;
  input [2:0]sel;
  output y;
  wire out1,out2;
  mux_4x1 mux1_4x1(.a(a[3:0]),.sel(sel[1:0]),.out(out1));
  mux_4x1 mux2_4x1(.a(a[7:4]),.sel(sel[1:0]),.out(out2));
  mux_2x1 mux1_2x1(.a0(out1),.a1(out2),.sel(sel[2]),.out(y));
endmodule

//test_bench

module mux8x1_tb();
  reg [7:0]a;
  reg [2:0]s;
  wire y;
  mux_8x1 dut(a,s,y);
  initial begin
    $monitor("time=%0t,a=%b,s=%b,y=%b",$time,a,s,y);
    a=8'b10101010;
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
