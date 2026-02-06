module N_BIT_B2G #(parameter n=4)(b,g);
  input [n-1:0]b;
  output reg[n-1:0]g;
  integer i;
  always@(*)begin
    g[n-1]=b[n-1];
    for(i=n-2;i>=0;i=i-1)begin
      g[i]=b[i+1]^b[i];
    end
  end
endmodule
