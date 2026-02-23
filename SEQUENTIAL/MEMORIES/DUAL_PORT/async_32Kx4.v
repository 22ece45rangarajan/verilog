module ram_32Kx4_dp(data_in_1,data_in_2,clk,rw_1,rw_2,address_1,address_2,data_out_1,data_out_2);
  input [3:0]data_in_1,data_in_2;
  input clk,rw_1,rw_2;
  input [14:0]address_1,address_2;
  output[3:0]data_out_1,data_out_2;
  reg [3:0]memo[0:32767];
  reg [14:0]add_reg_1,add_reg_2;
  always@(posedge clk)begin
    add_reg_1<=address_1;
    add_reg_2<=address_2;
    if (rw_1)begin
      memo[address_1]<=data_in_1;
    end
    if (rw_2 && !(rw_1 && (address_1 == address_2)))begin
      memo[address_2]<=data_in_2;
    end
  end
  assign data_out_1=memo[add_reg_1];
  assign data_out_2=memo[add_reg_2];
endmodule
      
