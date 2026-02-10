module alu(a,b,s,y);
  input [3:0]a,b;
  input [2:0]s;
  output reg [7:0]y;
  function [7:0] alu_function;
    input [3:0] x,z;
    input [2:0] s;
    begin 
      if(s==3'b000) 
      alu_function = x & z;
      else
       alu_function=8'b00000000;
    end
  endfunction
  task task_alu;
    input [3:0]x,z;
    input [2:0]s;
    output [7:0]result;
    begin
    case(s)
      1:result=x-z;
      2:result=x+z;
      3:result=x|z;
      4:result=x^z;
      5:result=x/z;
      6:result={{4{1'b0}},~x};
      7:result={{4{1'b0}},~z};
      default :result =8'b00000000;
    endcase
    end
  endtask
    always@(*)begin
      case(s)
        3'b000:y=alu_function(a,b,s);
        default:task_alu(a,b,s,y);
      endcase
    end
endmodule
 
  
