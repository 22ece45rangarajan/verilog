module ram_32Kx4_dp_tb();
  reg [3:0]data_in_1,data_in_2;
  reg clk,rw_1,rw_2;
  reg [14:0]address_1,address_2;
  wire [3:0]data_out_1,data_out_2;
  ram_32Kx4_dp dut(data_in_1,data_in_2,clk,rw_1,rw_2,address_1,address_2,data_out_1,data_out_2);
  always #5 clk=~clk;
initial begin
  $monitor("time=%0t||clk=%b||data_in_1=%b||rw_1=%b||address_1=%d||data_out_1=%b||data_in_2=%b||rw_2=%b||address_2=%d||data_out_2=%b||",$time,clk,data_in_1,rw_1,address_1,data_out_1,data_in_2,rw_2,address_2,data_out_2);
  clk=0;rw_1=1;
  data_in_1=4'd10;
  address_1=15'd250;
  rw_2=1;
  data_in_2=4'd10;
  address_2=15'd251;
  #10 rw_1=1;
  data_in_1=4'd11;
  address_1=15'd250;
      rw_2=1;
  data_in_2=4'd11;
  address_2=15'd251;
  #10 rw_1=0;
  data_in_1=4'd11;
  address_1=15'd250;
      rw_2=0;
  data_in_2=4'd11;
  address_2=15'd251;
  
end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,ram_32Kx4_dp_tb);
    #50 $finish;
  end
endmodule
