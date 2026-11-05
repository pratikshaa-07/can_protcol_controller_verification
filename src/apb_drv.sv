class apb_driver extends uvm_driver #(apb_seq_item);

  `uvm_component_utils(apb_driver)
  virtual apb_if vif;

  function new(string name = "",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("APB_DRIVER", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    vif.drv_cb.PSEL <= 0;  vif.drv_cb.PENABLE <= 0;
    vif.drv_cb.PWRITE <= 0; vif.drv_cb.PADDR <= '0;
    vif.drv_cb.PWDATA <= '0; vif.drv_cb.PSTRB <= '0;
    vif.drv_cb.PPROT <= '0;
    repeat(3)@(vif.drv_cb);
    forever begin
    seq_item_port.get_next_item(req);
    drv(req);
    seq_item_port.item_done();
  end
endtask


task drv();
  vif.drv_cb.PSEL    <= 1;
  vif.drv_cb.PENABLE <= 0;
  vif.drv_cb.PADDR   <= req.paddr;
  vif.drv_cb.PWRITE  <= req.pwrite;
  vif.drv_cb.PWDATA  <= req.pwrite ? item.pwdata : '0;
  vif.drv_cb.PSTRB   <= req.pwrite ? item.pstrb  : '0;

  @(vif.drv_cb);                            
  vif.drv_cb.PENABLE <= 1;
  wait(vif.drv_cb.PREADY);  
  req.prdata  = vif.drv_cb.PRDATA;           
  req.pslverr = vif.drv_cb.PSLVERR;

  @(vif.drv_Cb);
  vif.drv_cb.PSEL    <= 0;
  vif.drv_cb.PENABLE <= 0;
  
  if(req.paddr==8'h0C)
    begin
      repeat(3)@(vif.drv_cb);
    end
  @(vif.drv_cb);
endtask

endclass
