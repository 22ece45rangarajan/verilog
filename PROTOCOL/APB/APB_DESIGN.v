module top_APB(P_clk,P_reset,transfer,P_write,P_add,PW_data,PR_data,P_slave,P_enable,P_slerror,P_ready);
  input P_clk,P_reset,transfer,P_write;
  input   [7:0]P_add;
  input   [5:0]PW_data;
  output  [5:0]PR_data;
  output  [1:0]P_slave;
  output  P_enable,P_slerror,P_ready;
  wire   P_slverr;

  master_APB master(.P_clk(P_clk),.P_reset(P_reset),.transfer(transfer),.P_write(P_write),.P_add(P_add),.PW_data(PW_data),.P_sl(P_slave),.P_enable(P_enable),.P_slerror(P_slerror),.P_ready(P_ready));
  slave_APB slave(.P_clk(P_clk),.P_reset(P_reset),.P_sel(P_slave),.P_enable(P_enable),.P_write(P_write),.P_add(P_add),.PW_data(PW_data),.PR_data(PR_data),.P_ready(P_ready),.P_slverr(P_slerror));
endmodule


module master_APB(P_clk,P_reset,transfer,P_write,P_add,PW_data,P_sl,P_enable,P_slerror,P_ready);
  input P_clk,P_reset,P_write,P_slerror,P_ready,transfer;
  input   [7:0]P_add;
  input   [5:0]PW_data;
  
  output reg [1:0]P_sl;
  output reg P_enable;
  localparam [1:0]IDEAL=2'b00,
                  SETUP=2'b01,
                  ACCESS=2'b11;
  reg [1:0]state,nxt_state;
  always@(posedge P_clk)begin
    if(P_reset)begin
      state<=IDEAL;
    end
    else
      state<=nxt_state;
  end
  always@(*)begin
      //nxt_state<=state;
      P_enable=0;
      case(state)
        IDEAL:begin
          P_sl = 2'b00;
          if(transfer)
            nxt_state=SETUP;
          else
            nxt_state=IDEAL;
        end
        SETUP:begin
          P_sl     =1;
          P_enable =0;
          if(P_add[7:6]==2'b01)      P_sl = 2'b01;
          else if(P_add[7:6]==2'b10) P_sl = 2'b10;
          else if(P_add[7:6]==2'b11) P_sl = 2'b11;
          else                       P_sl = 2'b00;
          nxt_state=ACCESS;
        end
        ACCESS:begin
          P_enable = 1; 
          if(P_add[7:6]==2'b01)      P_sl = 2'b01;
          else if(P_add[7:6]==2'b10) P_sl = 2'b10;
          else if(P_add[7:6]==2'b11) P_sl = 2'b11;
          else                       P_sl = 2'b00;
          if(!P_ready)
            nxt_state = ACCESS;
          else
            nxt_state = IDEAL;     
        end
        default: begin
            P_sl      = 2'b00;
            nxt_state = IDEAL;
        end
      endcase
  end
endmodule
    
      
module slave_selecter(P_add,P_reset,P_select);
  input [7:0]P_add;
  input P_reset;
  output reg [3:1]P_select;
  always@(*)begin
    if(P_reset)begin
      P_select=0;
    end
    else  begin
      case(P_add[7:6])
        2'b01:P_select=3'b001;
        2'b10:P_select=3'b010;
        2'b11:P_select=3'b100;
        default:begin 
          P_select=0;
        end
      endcase
    end 
  end
endmodule


module slave_P_sel_1(P_clk,P_reset,P_sel_1,P_enable,P_write,P_add,PW_data,PR_data_1,P_ready_1,P_slverr_1);
  input P_clk,P_reset,P_enable,P_write;
  input P_sel_1;
  input  [7:0]P_add;
  input  [5:0]PW_data;
  output reg [5:0]PR_data_1;
  output reg P_ready_1,P_slverr_1;
  localparam [1:0] IDEAL  =2'b00,
  SETUP  =2'b01,
  ACCESS =2'b11;
  reg [1:0]state,nxt_state;
  reg [7:0]addr_reg;
  reg write_reg;
  reg[5:0] memo[255:0];
  always@(posedge P_clk)begin
    if(P_reset)
      P_slverr_1<=0;
    else begin
      if(P_add>8'd255)
        P_slverr_1<=1;
      else
        P_slverr_1<=0;
    end
  end
  always@(posedge P_clk)begin
    if(P_reset)begin
      state      <=0;
      P_ready_1  <=0;
      PR_data_1  <=0;
    end
    else begin
      state    <= nxt_state;
      //nxt_state<=state;
    end
  end
  always@(*)begin
    nxt_state = state;
      case(state)
        IDEAL:begin
          P_ready_1=0;
          if(P_sel_1)
            nxt_state=SETUP;
        end
        SETUP:begin
          if(P_sel_1)begin
            addr_reg  = P_add;
            write_reg = P_write;
            nxt_state = ACCESS ;
          end
        end
        ACCESS:begin
          if(P_sel_1 && P_enable)begin
            if(P_write)begin
              memo[P_add]=PW_data;
              $display("r");
            end
            else begin
              PR_data_1=memo[P_add];
              $display("k");
            end
            P_ready_1=1;
            nxt_state=IDEAL;
          end
          else begin
            nxt_state=ACCESS;
          end
        end
        default:nxt_state=IDEAL;
      endcase
  end
endmodule

module slave_P_sel_2(P_clk,P_reset,P_sel_2,P_enable,P_write,P_add,PW_data,PR_data_2,P_ready_2,P_slverr_2);
  input P_clk,P_reset,P_enable,P_write;
  input P_sel_2;
  input  [7:0]P_add;
  input  [5:0]PW_data;
  output reg [5:0]PR_data_2;
  output reg P_ready_2,P_slverr_2;
  localparam [1:0] IDEAL  =2'b00,
  SETUP  =2'b01,
  ACCESS =2'b11;
  reg [1:0]state,nxt_state;
  reg [7:0]addr_reg;
  reg write_reg;
  reg[5:0] memo[255:0];
  always@(posedge P_clk)begin
    if(P_reset)
      P_slverr_2<=0;
    else begin
      if(P_add>8'd255)
        P_slverr_2<=1;
      else
        P_slverr_2<=0;
    end
  end
  always@(posedge P_clk)begin
    if(P_reset)begin
      state      <=0;
      P_ready_2  <=0;
      PR_data_2  <=0;
    end
    else begin
      //nxt_state<=state;
      state    <= nxt_state;
    end
  end
  always@(*)begin
    nxt_state = state;
      case(state)
        IDEAL:begin
          P_ready_2=0;
          if(P_sel_2)
            nxt_state=SETUP;
        end
        SETUP:begin
          addr_reg  = P_add;
          write_reg = P_write;
          nxt_state = ACCESS ;
        end
        ACCESS:begin
          if(P_sel_2 && P_enable)begin
            if(P_write)begin
              memo[P_add]=PW_data;
              $display("r");
            end
            else begin
              PR_data_2=memo[P_add];
              $display("k");
            end
            P_ready_2=1;
            nxt_state=IDEAL;
          end
          else begin
            nxt_state=ACCESS;
          end
        end
        default:nxt_state=IDEAL;
      endcase
  end
endmodule

module slave_P_sel_3(P_clk,P_reset,P_sel_3,P_enable,P_write,P_add,PW_data,PR_data_3,P_ready_3,P_slverr_3);
  input P_clk,P_reset,P_enable,P_write;
  input P_sel_3;
  input  [7:0]P_add;
  input  [5:0]PW_data;
  output reg [5:0]PR_data_3;
  output reg P_ready_3,P_slverr_3;
  localparam [1:0] IDEAL  =2'b00,
  SETUP  =2'b01,
  ACCESS =2'b11;
  reg [1:0]state,nxt_state;
  reg [7:0]addr_reg;
  reg write_reg;
  reg[5:0] memo[255:0];
  always@(posedge P_clk)begin
    if(P_reset)
      P_slverr_3<=0;
    else begin
      if(P_add>8'd255)
        P_slverr_3<=1;
      else
        P_slverr_3<=0;
    end
  end
  always@(posedge P_clk)begin
    if(P_reset)begin
      state     <=0;
      P_ready_3 <=0;
      PR_data_3 <=0;
    end
    else begin
      state    <= nxt_state;
      //nxt_state<=state;
    end
  end
  always@(*)begin
    nxt_state = state;
      case(state)
        IDEAL:begin
          P_ready_3=0;
          if(P_sel_3)
            nxt_state=SETUP;
        end
        SETUP:begin
          addr_reg  = P_add;
          write_reg = P_write;
          nxt_state = ACCESS ;
        end
        ACCESS:begin
          if(P_sel_3 && P_enable)begin
            if(P_write)begin
              memo[P_add]=PW_data;
              $display("r");
            end
            else begin
              PR_data_3=memo[P_add];
              $display("k");
            end
            P_ready_3=1;
            nxt_state=IDEAL;
          end
          else begin
            nxt_state=ACCESS;
          end 
        end
        default:nxt_state=IDEAL;
      endcase
  end
endmodule


module slave_APB(P_clk,P_reset,P_sel,P_enable,P_write,P_add,PW_data,PR_data,P_ready,P_slverr);
  input P_clk,P_reset,P_enable,P_write;
  input [1:0]P_sel;
  input  [7:0]P_add;
  input  [5:0]PW_data;
  output reg [5:0]PR_data;
  output reg P_ready,P_slverr;  
  wire [3:1] P_select;
  wire [5:0] PR_data_1,PR_data_2,PR_data_3;
  wire P_ready_1,P_ready_2,P_ready_3;
  wire P_slverr_1,P_slverr_2,P_slverr_3; 
  slave_selecter sel(.P_add(P_add),.P_reset(P_reset),.P_select(P_select));
  slave_P_sel_1  sl1(.P_clk(P_clk),.P_reset(P_reset),.P_sel_1(P_select[1]),.P_enable(P_enable),.P_write(P_write),.P_add(P_add),.PW_data(PW_data),.PR_data_1(PR_data_1),.P_ready_1(P_ready_1),.P_slverr_1(P_slverr_1));
  slave_P_sel_2  sl2(.P_clk(P_clk),.P_reset(P_reset),.P_sel_2(P_select[2]),.P_enable(P_enable),.P_write(P_write),.P_add(P_add),.PW_data(PW_data),.PR_data_2(PR_data_2),.P_ready_2(P_ready_2),.P_slverr_2(P_slverr_2));
  slave_P_sel_3  sl3(.P_clk(P_clk),.P_reset(P_reset),.P_sel_3(P_select[3]),.P_enable(P_enable),.P_write(P_write),.P_add(P_add),.PW_data(PW_data),.PR_data_3(PR_data_3),.P_ready_3(P_ready_3),.P_slverr_3(P_slverr_3));

  assign  PR_data = P_select[1] ? PR_data_1:
    P_select[2] ? PR_data_2:
    P_select[3] ? PR_data_3:6'b0;

  assign  P_ready = P_select[1]  ? P_ready_1:
    P_select[2] ? P_ready_2:
    P_select[3] ? P_ready_3:0;

   assign P_slverr = P_select[1] ? P_slverr_1:
    P_select[2] ? P_slverr_2:
    P_select[3] ? P_slverr_3:0;
endmodule
