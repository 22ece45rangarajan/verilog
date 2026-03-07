//==============================================================
// Module Name : fifo
// Description : Simple synchronous FIFO memory
//               - 8 locations
//               - 8-bit data width
//               - Separate read and write enables
//==============================================================

module sync_fifo(data_in,clk,res,w_en,r_en,full,empty,data_out);
  input clk,res;                //Clock & reset     
  input w_en;                   //Enable to Write
  input r_en;                   //Enable to Read
  input [7:0]data_in;           //Input Data to be Written
  output  empty,full;          //FLAGS to show the condition
  output reg [7:0]data_out;    //Data to be Read
  
//==============================================================
// ____________Internal Registers and Memory____________________
//==============================================================
  
  reg  [7:0]memo[7:0];
  
// Write pointer & Read pointer
  
  reg  [3:0]read_ptr,wrt_ptr;
  
//==============================================================//
//                      FIFO CONTROL LOGIC                      //
//==============================================================//
//  Write Logic : Writes data into FIFO when write enable is    //
//                active                                        //
//  Read Logic  : Reads data from FIFO when read enable is      //
//                active                                        //
//==============================================================//
  
  always@(posedge clk)begin
    if(res)begin
      wrt_ptr <= 5'd0;
      read_ptr <= 5'd0;
      data_out <= 8'd0;
    end
    else begin
      if(w_en && !full)begin
        memo[wrt_ptr[2:0]]<=data_in;
        wrt_ptr<=wrt_ptr+1;
      end
      else
        wrt_ptr<=wrt_ptr;
    end
  end
  always@(posedge clk)begin
    if(res)
      read_ptr <= 5'd0;
    else begin
      if(r_en && !empty)begin
        data_out<=memo[read_ptr[2:0]];
        read_ptr<=read_ptr+1;
      end
    else
      read_ptr<=read_ptr;
    end
  end
  
//==============================================================
//__________________Status Flags___________________________
//==============================================================
  
  // FIFO is empty when read and write pointers are equal
  assign empty=(read_ptr == wrt_ptr);
  // FIFO is full when write pointer wraps around and meets read pointer
  assign full =((read_ptr[2:0] == wrt_ptr[2:0])&&(read_ptr[3]!=wrt_ptr[3]));
endmodule
      
    
  
