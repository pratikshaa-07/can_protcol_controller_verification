module tb_top;

  // Clock and reset signals
  bit PCLK    = 0;
  bit can_clk = 0;
  bit PRESETn = 0;

  // APB interface
  apb_if apb_vif(PCLK);

  // CAN interface
  can_if can_vif(can_clk);

  // Clock generation
  always #62.5 PCLK = ~PCLK;
  always #15.625 can_clk = ~can_clk;

  initial begin
    PRESETn = 0;
    repeat (5) @(posedge PCLK);
    PRESETn = 1;
  end

  initial begin
    run_test();
  end

endmodule
