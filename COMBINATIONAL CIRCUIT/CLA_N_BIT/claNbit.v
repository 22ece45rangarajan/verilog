module CLA(a,b,cin,s,cout);
  parameter n=4;
  input [n-1:0]a,b;
  input cin;
  output [n-1:0]s;
  output cout;
  wire [n-1:0]p;
  wire [n-1:0]g;
  wire [n:0]c;
  assign c[0]=cin;
  genvar i;
  generate 
    for (i=0;i<n;i=i+1)begin
      assign p[i]=a[i]^b[i];
      assign g[i]=a[i]&b[i];
    end
   endgenerate
  generate
    for (i=0;i<n;i=i+1)begin
    assign c[i+1]=g[i]|(c[i] & p[i]);
    assign s[i]=p[i]^c[i];
    end
   endgenerate
     assign cout=c[n];
 endmodule
