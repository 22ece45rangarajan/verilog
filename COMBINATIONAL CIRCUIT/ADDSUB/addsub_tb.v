module ADDSUB_TB();
 reg[3:0] A, B;
 reg Cin;
 wire[3:0]SUM;
 wire CARRY; 
 ADDSUB dut(A,B,Cin,SUM,CARRY);
  initial begin 
    $monitor("time=%0t,A=%b,B=%b,Cin=%b | SUM=%b,CARRY=%b",$time,A,B,Cin,SUM,CARRY);
    
    #10;A=4'b0000;B=4'b0000;Cin=0;
    #10;A=4'b0001;B=4'b0001;Cin=0;
    #10;A=4'b0010;B=4'b0010;Cin=0;
    #10;A=4'b0011;B=4'b0011;Cin=0;
    #10;A=4'b0100;B=4'b0100;Cin=0;
    #10;A=4'b1101;B=4'b1101;Cin=0;
    #10;A=4'b0000;B=4'b0000;Cin=1;
    #10;A=4'b0001;B=4'b0001;Cin=1;
    #10;A=4'b0010;B=4'b0010;Cin=1;
    #10;A=4'b0011;B=4'b0011;Cin=1;
    #10;A=4'b0100;B=4'b0100;Cin=1;
    #10;A=4'b1101;B=4'b1101;Cin=1;
  end
  initial begin
    $dumpfile("TVK.vcd");
    $dumpvars(0,ADDSUB_TB);
    #150 $finish;
  end 
endmodule
