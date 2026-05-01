module fsm_1_tb();
  
  reg  clk,rst,x;
  wire y;
  
  fsm_1 dut(.*);
  
  always #5 clk=~clk;
  
  initial begin
    $monitor ("time=%0t || clk=%b || rst=%b  || x=%b || y=%b ",$time,clk,rst,x,y);
    
    clk=0;rst=1;x=0;
    
    #8 rst=0;
    
    repeat(5)begin
      @(negedge clk);
      x=1;
    end
    
    repeat(5)begin
      @(negedge clk);
      x=0;
    end
    
    @(negedge clk)
    repeat(4)begin
      x=1;
    end
    
    @(negedge clk)
    repeat(4)begin
      x=0;
    end
    
    #500 $finish;
  end
endmodule
    
    
    
    
    
