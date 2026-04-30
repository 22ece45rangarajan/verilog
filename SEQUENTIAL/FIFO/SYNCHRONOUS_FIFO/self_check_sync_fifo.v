//==============================================================//
//|                        FIFO TESTBENCH                       |
//|                                                             |
//|  Module Name : fifo_tb                                      |
//|                                                             |
//|  Description :                                              |
//|  Testbench for verifying FIFO read and write operations.    |
//|  It generates clock, applies reset, provides stimulus,      |
//|  and displays the simulation results.                       |
//|                                                             |
//==============================================================//

module sync_fifo_tb();
    reg              clk,res,w_en,r_en;
    reg      [7:0]   data_in;
    wire             empty,full;
    wire     [7:0]   data_out;
    reg      [7:0]   mem[7:0];
    reg      [3:0]   read_ptr,wrt_ptr; 
    reg      [7:0]   expected;
  
  sync_fifo dut(.*);
  always #5 clk=~clk;
  
  
//==============================================================
// ____________task_based_write____________________
//==============================================================
  
  task  write(input [7:0]d_in);
    begin
    @(posedge clk);
    if(!full)begin
      w_en        =1;
      r_en        =0;
      data_in     =d_in;
      mem[wrt_ptr]=d_in;
      $display("THE HAS BEEEN WRITTEN SUCCESSFULLY WHICH IS %d",d_in);
      wrt_ptr=wrt_ptr+1;

    end
    
    else 
      $display("SRY CANT WRITE THESE DATA WHICH IS %d",d_in);
    end
  endtask
  
//==============================================================
// ____________task_based_read____________________
//==============================================================
  
  task read_data();
    begin
      @(posedge clk);
      if(!empty)begin
        w_en        =0;
        r_en        =1;
        expected    =mem[read_ptr];
        $display("WE HAVE READ SUCCESSFULLY THE DATA IS %d",data_out);
        read_ptr=read_ptr+1;
        #6
        
        if(data_out==expected)begin
          $display("-----------------------------------------------");
          $display("____SUCCESSFULLY SELF CHECKED______");
          $display("-----------------------------------------------");
        end
        else begin
          $display("-----------------------------------------------");
          $display("___SELF_CHECK_WAS_UNSUCCESSFULLY______");
          $display("-----------------------------------------------");
        end
      end
    end
  endtask
  
  
  initial begin
    clk=0;res=1;w_en=0;r_en=0;read_ptr=0;wrt_ptr=0;
    
    #10 res=0;
    
//==============================================================
// ____________random_data_feed____________________
//==============================================================
    
    @(posedge clk);
    repeat(8)begin
      write($random);
    end
    
//==============================================================
// ____________reading_the_data___________________
//==============================================================
    
    #1;
    @(posedge clk);
    repeat(8)begin
      read_data;
    end
  end
    
  initial begin
    
    $dumpfile("tvk.vcd");
    $dumpvars(0,sync_fifo_tb);
    #1000 $finish;
  end
endmodule
    
