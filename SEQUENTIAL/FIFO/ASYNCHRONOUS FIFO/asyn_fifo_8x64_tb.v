//==============================================================//
//|                        FIFO TESTBENCH                       |
//|                                                             |
//|  Module Name : asynchronous_fif0_tb                         |
//|                                                             |
//==============================================================//
module asynchronous_fif0_tb();
  reg           res,w_clk,r_clk,w_en,r_en;
  reg  [7:0]    w_data;
  wire [7:0]    r_data;
  wire          full,empty;
  integer       i;
  asynchronous_fifo dut(.*);
  always #5 w_clk = ~w_clk;
  always #5 r_clk = ~r_clk;
  initial begin 
    $monitor("time=%0t || res=%b || w_clk=%b || w_en=%b || w_data=%d ||  r_clk=%b || r_en=%b || r_data=%d || full=%b || empty=%b ",$time,res,w_clk,w_en,w_data,r_clk,r_en,r_data,full,empty);
    
    
  end
  
  //========__TASK_FOR_Write_operation__=======//
  
  task write_task;                
    w_en          =1                 ;
    r_en          =0                 ;
    for(i=0;i<64;i=i+1)
      begin
        @(negedge w_clk)             ;
        w_data  = $random            ;
      end
    @(negedge w_clk)                 ;
    w_en          =0                 ;
    r_en          =0                 ;
  endtask
  
   //========__TASK_FOR_read_operation__=======//
  
  task read_task;
    w_en          =0                 ;
    r_en          =1                 ;
    for(i=0;i<6;i=i+1)
      begin
        @(negedge r_clk)             ;
      end
    w_en          =0                 ;
    r_en          =0                 ;
  endtask
  
  //======__DUMP_FILE_SETUP__========//
  
  initial  begin
    $dumpfile("tvk..vcd")            ;
    $dumpvars(0,asynchronous_fif0_tb);
    #3000 $finish                     ;
  end
  
  initial begin
    res     =1;
    w_en    =0;
    r_en    =0;
    w_clk   =0;
    r_clk   =0;
    w_data  =0;
    
 #10 res    =0;
  
    write_task;
    
    read_task;
    
  end
endmodule
  
  
