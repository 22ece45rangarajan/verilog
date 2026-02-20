module mas_lave(j,k,clk,res,qm,qs);
  input  j,k,clk,res;
  output reg qm,qs;
  always@(posedge clk or posedge res)begin
    if(res)begin
      qm<=1'b0;
    end
    else begin
        case({j,k})
          0:qm<=qm;
          1:qm<=0;
          2:qm<=1;
          default:qm<=~qm;
        endcase
    end
  end
  always@(negedge clk or posedge res)begin
      if(res)
        qs<=1'b0;
      else begin
          qs<=qm;
      end
    end
endmodule
      
      
