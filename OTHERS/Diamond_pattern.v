module diamond();
  integer i,j;
  initial begin
    for(i=1;i<=5;i=i+1)begin
      repeat(5-i)$write("      ");
      for(j=1;j<=i;j=j+1)begin
        $write(" %d",i);
      end
      $display("");
    end
    for(i=4;i>=1;i=i-1)begin
      repeat(5-i)$write("      ");
      for(j=1;j<=i;j=j+1)begin
        $write(" %d",i);
      end
      $display("");
    end
  end
  initial  begin
    $dumpfile("tvk.vcd");
    $dumpvars(0,diamond);
    #10 $finish;
  end
endmodule
