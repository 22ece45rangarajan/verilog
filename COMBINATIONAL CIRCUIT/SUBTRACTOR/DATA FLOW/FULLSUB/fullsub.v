module Fullsub(input a,b,c,output d,borrow);
  assign d=a^b^c;
  assign borrow=(b&c)|((~a)&(b^c));
endmodule
