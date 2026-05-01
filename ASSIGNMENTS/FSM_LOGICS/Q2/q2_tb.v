module fsm_2_tb();
  
  reg  clk,rst,x;
  wire y;
  
  fsm_2 dut(.*);
  
  always #5 clk=~clk;
  
  initial begin
    $monitor ("time=%0t || clk=%b || rst=%b  || x=%b || y=%b ",$time,clk,rst,x,y);
    
    clk=0;rst=1;x=0;
    
    #8 rst=0;
    
    repeat(5)begin
      @(negedge clk);
      x=$random;
    end
    
    
    #500 $finish;
  end
endmodule
    
    
    
    
    
