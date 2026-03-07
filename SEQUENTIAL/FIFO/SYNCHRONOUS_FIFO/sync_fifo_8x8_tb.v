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
    reg clk,res,w_en,r_en;
    reg [7:0]data_in;
    wire  empty,full;
    wire [7:0]data_out;
  sync_fifo dut(.*);
  always #5 clk=~clk;
  initial begin
    $monitor("time=%0t||clk=%b||res=%b||w_en=%b||r_en=%b||data_in=%d||full=%b||empty=%b||data_out=%d",$time,clk,res,w_en,r_en,data_in,full,empty,data_out);
    clk=0;res=1;w_en=0;r_en=0;data_in=8'd0;
    #10 res=0;
    
//========__Write_operation__=======//
    
    w_en=1;r_en=0;@(negedge clk);
    data_in=8'd44;@(negedge clk);
    data_in=8'd45;@(negedge clk);
    data_in=8'd57;@(negedge clk);
    data_in=8'd49;@(negedge clk);
    data_in=8'd32;@(negedge clk);
    data_in=8'd44;@(negedge clk);
    @(negedge clk);
    
//=========__PAUSE__================//    
    
    repeat(2)@(negedge clk)
    
//======__READ_operation__========//   
      
    w_en=0;r_en=1;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
    r_en=0;w_en=0;
  end
  
//======__DUMP_FILE_SETUP__========//
  
  initial begin
    
    $dumpfile("tvk.vcd");
    $dumpvars(0,sync_fifo_tb);
    #170 $finish;
  end
endmodule
    
