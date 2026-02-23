module ram_32Kx4_sp_tb();
  reg [3:0]data_in;
  reg clk,rw;
  reg [14:0]address;
  wire [3:0]data_out;
  ram_32Kx4_sp dut(data_in,clk,rw,address,data_out);
  always #5 clk=~clk;
initial begin
  $monitor("time=%0t||data_in=%b||clk=%b||rw=%b||address=%d||data_out=%b||",$time,data_in,clk,rw,address,data_out);
  clk=0;rw=1;data_in=4'd10;address=15'd250;
  #10 rw=1;data_in=4'd12;address=15'd2500;
  #10 rw=0;data_in=4'd12;address=15'd2500;
end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,ram_32Kx4_sp_tb);
    #50 $finish;
  end
endmodule
