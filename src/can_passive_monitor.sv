class can_passive_monitor extends uvm_monitor;

  `uvm_component_utils(can_passive_monitor)

  virtual can_if vif;

  uvm_analysis_port #(can_seq_item) ap_port;

  function new(string name = "",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual can_if)::get(this, "", "vif", vif))
      `uvm_fatal("CAN_PASSIVE_MON", "Virtual interface not found")

    ap_port = new("ap_port", this);
  endfunction

  task run_phase(uvm_phase phase);
  endtask

endclass
