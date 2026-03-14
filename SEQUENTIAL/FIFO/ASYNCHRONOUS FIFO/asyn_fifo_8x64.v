//==============================================================
// Module Name : fifo
// Description : Simple asynchronous FIFO memory
//               - 64 locations
//               - 8-bit data width
//               - Separate read and write enables
//               - with diff clk
//==============================================================


module asynchronous_fifo(res,w_clk,r_clk,w_en,w_data,r_en,r_data,full,empty);
  input                res;              // reset 
  input                w_clk,r_clk;      // read_&_write_Clock  
  input                w_en,r_en;        // read_&_write_enable 
  input       [7:0]    w_data;           // write_data (input)
  output reg  [7:0]    r_data;           // read_data  (output)
  output               full,empty;       //FLAGS to show the condition
  reg         [6:0]    w_ptr,r_ptr;      // Write pointer & Read pointer
  
//==============================================================
// ____________Internal Registers and Memory____________________
//==============================================================
  reg         [7:0]    memo [63:0];
  
  wire        [6:0]    g_wptr,g_rptr;    //gray_pointer  
  reg         [6:0]    g_wptr_1,g_rptr_1;//nxt_gray_pointer
  reg         [6:0]    g_wptr_2,g_rptr_2;//sync_read_&_write__gray_pointer
  
    
//==============================================================//
//                      FIFO CONTROL LOGIC                      //
//==============================================================//
//  Write Logic : Writes data into FIFO when write enable is    //
//                active according to its own clk               //
//  Read Logic  : Reads data from FIFO when read enable is      //
//                active according to its own clk               //
//==============================================================//
  
  always@(posedge w_clk)begin
    if(res)begin
      w_ptr         <=0;
    end
    else begin
      if(w_en && !full)begin
        w_ptr       <=w_ptr+1;
        memo[w_ptr] <=w_data;
      end
    end
  end
  
  always@(posedge r_clk)begin
    if(res)begin
      r_ptr         <=0;
      r_data        <=0;
    end
    else begin
      if(r_en && !empty)begin
        r_ptr       <=r_ptr+1;
        r_data      <=memo[r_ptr];
        $display("r");
      end
    end
  end
  
//==============================================================
//__________converting_binary_pointers_to_gray__________________
//==============================================================
 
  assign g_wptr = w_ptr ^ (w_ptr >> 1);
  assign g_rptr = r_ptr ^ (r_ptr >> 1);
  
//==============================================================
//__________________Synchronize_________________________________
//==============================================================
  
  always@(posedge w_clk)begin
    if(res)begin
      g_rptr_1   <=0;
      g_rptr_2   <=0;
    end
    else begin
      g_rptr_1   <=g_rptr;
      g_rptr_2   <=g_rptr_1;
    end
  end
  
  always@(posedge r_clk)begin
    if(res)begin
      g_wptr_1   <=0;
      g_wptr_2   <=0;
    end
    else begin
      g_wptr_1   <=g_wptr;
      g_wptr_2   <=g_wptr_1;
    end
  end
  
 // FIFO is full when write pointer wraps around and meets read pointer 
  
  assign full  = (g_rptr_2 == ({~ g_wptr_1[6:5],g_wptr_1[4:0]}));
  
  // FIFO is empty when read and write pointers are equal
  
  assign empty = (g_wptr_2 == g_rptr);
  
endmodule
  
  
  
  
      
  
  
        
      
