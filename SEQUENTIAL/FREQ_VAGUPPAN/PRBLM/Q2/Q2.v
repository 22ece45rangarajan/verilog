//Problem: Divide-by-12 with 40% duty cycle
//Requirements:
  //Input: clk_in, rst
  //Output: clk_out
  //Divide the input clock by 12
  //Output clock should have ≈40% duty cycle (HIGH = 40% of 12 cycles = 4.8 clocks, LOW = 7.2 clocks)
  //Use only counters and flip-flops — no PLL/MMCM
  //Design must be synthesizable
module freq_divider_12(clk_in,res,clk_out);
  input clk_in,res;
  output reg  clk_out;
  reg [3:0]counter;
  always @(posedge clk_in)begin
    if(res)begin
      clk_out<=0;
      counter<=0;
    end
    else begin
      if(counter==11)
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
