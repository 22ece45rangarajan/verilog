module parity_generation(input [2:0]r,input clk,output reg even_par_gen,odd_par_gen);
  always@(posedge clk)begin
    even_par_gen<=(r[2]^r[1]^r[0]);//even_par_gen<=^r
    
    odd_par_gen<=~(r[2]^r[1]^r[0]);//odd_par_gen<=~(^r)
  end
endmodule
