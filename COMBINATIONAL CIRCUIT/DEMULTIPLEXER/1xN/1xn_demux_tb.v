
module demux_1xN_Tb #(parameter N=8,parameter Sel=3);
  reg a;
  reg [Sel-1:0]s;
  wire [N-1:0] y;
  demux_1xN dm1(a,s,y);
  initial begin 
    $monitor("time=%0t, a=%b,s=%b,y=%b,",$time,a,s,y);
    a=0;s=3'b000;#10;
    a=0;s=3'b001;#10;
    a=0;s=3'b010;#10;
    a=0;s=3'b011;#10;
    a=1;s=3'b100;#10;
    a=1;s=3'b101;#10;
    a=1;s=3'b110;#10;
    a=1;s=3'b111;#10;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars;
    #100 $finish;
  end 
endmodule
