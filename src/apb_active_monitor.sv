
class apb_active_monitor extends uvm_monitor;

  `uvm_component_utils(apb_active_monitor)

  virtual apb_if vif;

  uvm_analysis_port #(apb_seq_item) ap_port;

  apb_seq_item item;

  function new(string name = "apb_active_monitor",
               uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("APB_ACTIVE_MON", "Virtual interface not found")

    ap_port = new("ap_port", this);
  endfunction

  task run_phase(uvm_phase phase);
    repeat(3)@(vif.mon_cb);
    forever begin
      wait(vif.PENABLE && vif.PREADY);
      item = apb_seq_item::type_id::create("item");
      item.paddr   = vif.mon_cb.PADDR;
      item.pwrite  = vif.mon_cb.PWRITE;
      item.pwdata  = vif.mon_cb.PWDATA;
      item.pstrb   = vif.mon_cb.PSTRB;
      item.prdata  = vif.mon_cb.PRDATA;
      item.pslverr = vif.mon_cb.PSLVERR;
      `uvm_info("APB_MON",$sformatf("pwrite=%0d paddr=%0h pwdata=%0d pstrb=%0d prdata=%0d",item.pwrite,item.paddr,item.pwdata,item.pstrb,item.prdata),UVM_LOW)
      ap_port.write(item);
      $display("-------------------------------------------------------");
      repeat(2) @(vif.mon_cb);
      end
  endtask

endclass
