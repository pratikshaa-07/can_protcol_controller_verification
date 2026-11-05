module tb_top;

  bit PCLK;
  bit can_clk;
  bit PRESETn;
  
  initial PCLK=0;
  initial can_clk=0;
  initial begin 
    PRESETn=0;
    #20
  end

  apb_if apb_vif(PCLK,PRESETn);

  can_if can_vif(can_clk);

  always #62.5 PCLK = ~PCLK; // 125ns - 8MHZ
  always #15.625 can_clk = ~can_clk; //  31.25  1 PCLK = 4 CAN clock cycles - 32MHz

  initial begin
    PRESETn = 0;
    repeat (5) @(posedge PCLK);
    PRESETn = 1;
  end

  initial begin
    run_test("test");
  end

endmodule
