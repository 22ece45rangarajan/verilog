module deocder_2x4(y,en,d);
  input [1:0]y;
  input en;
  output reg [3:0]d;
  always@(*)begin
    if(en==1)begin
     case(y)
      2'b00:d=4'b0001;
      2'b01:d=4'b0010;
      2'b10:d=4'b0100;
      default:d=4'b1000;
      endcase
    end
    else begin 
    d=4'b0000;
    end
  end
endmodule
