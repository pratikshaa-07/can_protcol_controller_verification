`include "uvm_macros.svh"
//-----------------------------
`include "design.sv"
// `include "can_stuff.v"
// `include "can_rst_sync.v"
// `include "can_regfile.v"
// `include "can_irq.v"
// `include "can_eml.v"
// `include "can_crc.v"
// `include "can_core.v"
// `include "can_cdc_p2c.v"
// `include "can_cdc_c2p.v"
// `include "can_btl.v"
// `include "can_bsp.v"
// `include "can_apb_slave.v"
// `include "can_afifo.v"
// `include "can_acf.v"
//------------------------

`include "can_interface.sv"
`include "apb_interface.sv"

`include "registers.sv"
`include "reg_block.sv"

`include "apb_seq_item.sv"
`include "can_seq_item.sv"

`include "apb_sequencer.sv"
`include "can_sequencer.sv"
`include "virtual_sequencer.sv"

`include "apb_drv.sv"
`include "can_drv.sv"

`include "apb_active_mon.sv"

`include "can_active_mon.sv"
`include "can_passive_mon.sv"

`include "apb_active_agt.sv"
`include "can_active_agt.sv"
`include "can_passive_agt.sv"

`include "adapter.sv"

//`include "subscriber.sv"

`include "scoreboard.sv"

`include "environment.sv"

`include "can_sequence.sv"
`include "apb_sequence.sv"
`include "virtual_sequence.sv"

`include "test.sv"


module tb_top;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  bit PCLK;
  bit can_clk;
  bit PRESETn;

  initial PCLK = 0;
  initial can_clk = 0;

  always #62.5 PCLK = ~PCLK;       // 8 MHz
  always #15.625 can_clk = ~can_clk; // 32 MHz

  initial begin
    PRESETn = 0;
    repeat (2) @(posedge PCLK);
    PRESETn = 1;
  end

  apb_if apb_vif(PCLK, PRESETn);
  can_if can_vif(can_clk);
  


  // DUT instantiation
  can_top #(
    .APB_DATA_W(32),
    .APB_ADDR_W(8),
    .MSG_W(128),
    .RX_FIFO_DEPTH(4),
    .NUM_FILTERS(2),
    .SYNC_STAGES(2),
    .BUSOFF_RUNS(8'd128)
  ) dut (
    // APB interface
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PADDR(apb_vif.PADDR),
    .PPROT(apb_vif.PPROT),
    .PSEL(apb_vif.PSEL),
    .PENABLE(apb_vif.PENABLE),
    .PWRITE(apb_vif.PWRITE),
    .PWDATA(apb_vif.PWDATA),
    .PSTRB(apb_vif.PSTRB),
    .PRDATA(apb_vif.PRDATA),
    .PREADY(apb_vif.PREADY),
    .PSLVERR(apb_vif.PSLVERR),

    // Interrupt
    .irq(apb_vif.irq),

    // CAN interface
    .can_clk(can_clk),
    .can_rx(can_vif.can_rx),
    .can_tx(can_vif.can_tx)
  );

  initial begin
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", apb_vif);
    uvm_config_db#(virtual can_if)::set(null, "*", "vif", can_vif);
    run_test("test");
  end

endmodule
