module ram_32Kx4_sp(data_in,clk,rw,address,data_out);
  input [3:0]data_in;
  input clk,rw;
  input [14:0]address;
  output reg[3:0]data_out;
  reg [3:0]memo[0:32768];
  reg [15:0]add_reg;
  always@(posedge clk)begin
    if (rw)begin
        memo[address]<=data_in;
    end
    else begin
        add_reg<=address;
    end
    data_out=memo[add_reg];
  end
endmodule
      
