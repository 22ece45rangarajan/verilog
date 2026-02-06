module encoder_8x3(a,en,b);
  input [7:0]a;
  input en;
  output reg [2:0]b;
    always@(*)begin
      if (en==1)begin
        if (a[7]==1) b=3'b111;
        else if (a[6]==1) b=3'b110;
        else if (a[5]==1) b=3'b101;
        else if (a[4]==1) b=3'b100;
        else if (a[3]==1) b=3'b011;
        else if (a[2]==1) b=3'b010;
        else if (a[1]==1) b=3'b001;
        else b=3'b000;
      end
    end
endmodule
