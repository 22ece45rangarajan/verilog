module parity_generation_tb();
  reg[2:0]r;
  reg clk;
  wire even_par_gen,odd_par_gen;
  parity_generation dut(r,clk,even_par_gen,odd_par_gen);
  always #5 clk=~clk;
  initial begin 
    $monitor("time=%0t|r=%b|clk=%b|even_par_gen=%b|odd_par_gen=%b",$time,r,clk,even_par_gen,odd_par_gen);
    
    clk=0;r=3'b000;
    @(negedge clk) r=3'b111;
    @(negedge clk) r=3'b011;
    @(negedge clk) r=3'b101;  
    @(negedge clk) r=3'b001;
  end
  initial begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,parity_generation_tb);
    #50 $finish;
  end
endmodule

