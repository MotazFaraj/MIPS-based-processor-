module CPU_tb;
  reg clk;
  CPU dut (clk);
  
  initial begin
    clk = 0;
    #10 clk = ~clk;
  end
endmodule