//Design a 2-bit comparator using basic gates (AND, OR, NOT) to compare two 2-bit
//numbers A and B. The output should indicate if A == B, A > B, or A < B.
//-----_DESIGN_------
module struct_bit_2c_comp(a,b,G,E,L);
  input [1:0]a,b;
  output G,E,L;
  wire [1:0]na,nb;
  wire g0,g1,g2,e1,e10,e11,e12,e2,e20,e21,e22,l0,l1,l2;
  //-----_BIT_INVERT_------
  not (na[0],a[0]);
  not (na[1],a[1]);
  not (nb[0],b[0]);
  not (nb[1],b[1]);
  //-----_A_LESS_THAN_B_(L)------
  and(l0,na[1],na[1],b[0]);
  and(l1,na[1],b[1]);
  and(l2,na[0],b[1],b[0]);
  or(L,l0,l1,l2);
  //-----_A_EQUALITY_B_(E)------
  and(e10,a[1],nb[1]);
  and(e11,na[1],b[1]);
  or(e12,e10,e11);
  not(e1,e12);
  and(e20,a[0],nb[0]);
  and(e21,na[0],b[0]);
  or(e22,e20,e21);
  not(e2,e22);
  or(E,e1,e2);
  //-----_A_GREATER_THAN_B_(G)------
  and(g0,a[0],nb[1],b[0]);
  and(g1,a[1],a[0],nb[0]);
  and(g2,a[1],nb[1]);
  or(G,g0,g1,g2);
endmodule

//-----_TEST_BENCH_------

module struct_bit_2c_comp_tb();
  reg [1:0]a,b;
  wire G,E,L;
  struct_bit_2c_comp dut(a,b,G,E,L);
  initial begin
    $monitor("time=%0t||a=%d||b=%d||G=%b||E=%b||L=%b",$time,a,b,G,E,L);
    a=2'b00;b=2'b00;
    #10 a=2'b01;b=2'b11;
    #10 a=2'b10;b=2'b10;
    #10 a=2'b11;b=2'b01;
    #10 a=2'b11;b=2'b00;
    #10 a=2'b10;b=2'b01;
    #10 a=2'b01;b=2'b10;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,struct_bit_2c_comp_tb);
    #150 $finish;
  end
endmodule
  
  
  
  
  
