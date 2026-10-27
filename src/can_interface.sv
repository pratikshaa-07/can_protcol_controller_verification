interface can_if(input logic can_clk);

  logic can_tx;
  logic can_rx;
  
  logic tb_node;
  wire bus;
  
  assign bus = can_tx & tb_node;
  
  assign can_rx = bus;
  
  
endinterface
