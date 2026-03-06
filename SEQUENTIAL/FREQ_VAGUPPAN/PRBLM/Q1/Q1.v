//Design a frequency divider module in Verilog:
  //Input: clk_in (50 MHz), rst (active high)
  //Output: clk_out
  //Requirements:
      //Divide the input clock by 10
      //Output clock (clk_out) should have a """""duty cycle of 30%""""""""
      //Design should be fully synthesizable
module freq_divider_10(clk_in,res,clk_out);
  input clk_in,res;
  output reg  clk_out;
  reg [3:0]counter;
  always @(posedge clk_in)begin
    if(res)begin
      clk_out<=0;
      counter<=0;
    end
    else begin
      if(counter==9)
        counter<=0;
      else begin
      counter<=counter+1;
        if(counter>6)begin
          clk_out<=1;
        end 
       else
         clk_out<=0;
      end
    end
  end
endmodule




