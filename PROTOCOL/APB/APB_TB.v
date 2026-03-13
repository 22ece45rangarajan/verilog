//╔═══════════════════════════════════╗
//║  Module : APB_tb                  ║
//║  Desc   : APB_test_bench          ║
//╚═══════════════════════════════════╝

module APB_tb();
  reg P_clk,P_reset,transfer,P_write;
  reg   [7:0]P_add;
  reg   [5:0]PW_data;
  reg   [5:0]reading_out;
  wire  [5:0]PR_data;
  wire  [1:0]P_slave;
  wire  P_enable,P_slerror,P_ready;
  top_APB dut(.*);
  
  always #5 P_clk=~P_clk;
  initial begin
    P_clk   =0;
  end
  
  initial begin 
    $dumpfile("tvk.vcd");
    $dumpvars(0,APB_tb);
    
  end
  
  initial begin 
    $monitor("time=%0t || P_clk=%b || P_reset=%b || transfer=%b || P_write =%b || P_add=%d || PW_data=%d || PR_data=%d || P_slave=%b || P_enable=%b || P_slerror==%b || P_ready=%b",$time,P_clk,P_reset,transfer,P_write,P_add,PW_data,PR_data,P_slave,P_enable,P_slerror,P_ready); 
  end 
  
//======================================
// -------__TASK_TO_RESET_DATA__--------
//======================================
  
    task reset_task;
      begin
      P_reset =0;
      transfer=0;
      P_write =0;
      P_add   =0;
      PW_data =0;
      @(posedge P_clk); #1
      P_reset =1;
      @(posedge P_clk);
      end
    endtask
  
//======================================
// -------__TASK_TO_WRITE_DATA__--------
//======================================
    
    task writing_task;
        input [7:0]adds;
        input [5:0]data;
      begin
        

        @(posedge P_clk);#1 
        transfer = 1;
        P_write  = 1;
        P_add    = adds;
        PW_data  = data;
        wait(P_ready == 1);#1
        @(posedge P_clk);
        transfer = 0;
        //@(posedge P_clk);
      end
    endtask
    
//======================================
// -------__TASK_TO_READ_DATA__---------
//======================================
  
    
    task reading_task;
        input [7:0]adds;
        output [5:0]data_out;
      begin

        @(posedge P_clk);#1
        transfer = 1;
        P_write  = 0;
        P_add    = adds;
        wait(P_ready == 1);
        data_out = PR_data ;#1
        @(posedge P_clk);
        transfer = 0;
        
      end
    endtask
  
  initial begin
    
      
//======================================
// ----------__INPUT_DATA__------------
//======================================

    
    reset_task;
     
    writing_task(8'b01101010,6'b110101);
    reading_task(8'b01101010,reading_out);
    
    writing_task(8'b10101010,6'b011101);
    reading_task(8'b10101010,reading_out);
    
    writing_task(8'b11101010,6'b010111);
    reading_task(8'b11101010,reading_out);
    #200 $finish;
    
  end
    
endmodule
