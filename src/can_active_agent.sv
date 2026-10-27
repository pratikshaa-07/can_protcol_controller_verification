class can_active_agent extends uvm_agent;

  `uvm_component_utils(can_active_agent)

  can_driver         drv;
  can_sequencer      seqr;
  can_active_monitor mon;

  function new(string name = "can_active_agent",
               uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    drv  = can_driver::type_id::create("drv", this);
    seqr = can_sequencer::type_id::create("seqr", this);
    mon  = can_active_monitor::type_id::create("mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction

endclass
