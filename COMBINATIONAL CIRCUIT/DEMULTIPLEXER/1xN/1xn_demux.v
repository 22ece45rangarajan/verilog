module demux_1xN #(parameter N=8,parameter Sel=3)(a,s,y);
  input a;
  input [Sel-1:0]s;
  output [N-1:0] y;
  
  assign y=a?(1'b1<<s):{N{1'b0}};
endmodule
