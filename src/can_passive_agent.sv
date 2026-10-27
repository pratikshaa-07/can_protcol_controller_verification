class can_passive_agent extends uvm_agent;

  `uvm_component_utils(can_passive_agent)

  can_passive_monitor mon;

  function new(string name = "can_passive_agent",
               uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    mon = can_passive_monitor::type_id::create("mon", this);
  endfunction

endclass
