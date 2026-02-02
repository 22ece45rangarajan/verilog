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
