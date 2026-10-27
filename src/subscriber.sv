class subscriber extends uvm_subscriber #(can_seq_item);

  `uvm_component_utils(subscriber)

  uvm_tlm_analysis_fifo #(apb_seq_item) apb_active_fifo;
  uvm_tlm_analysis_fifo #(apb_seq_item) apb_passive_fifo;

  uvm_tlm_analysis_fifo #(can_seq_item) can_active_fifo;
  uvm_tlm_analysis_fifo #(can_seq_item) can_passive_fifo;

  function new(string name = "subscriber",
               uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb_active_fifo = new("apb_active_fifo", this);
    apb_passive_fifo = new("apb_passive_fifo", this);

    can_active_fifo = new("can_active_fifo", this);
    can_passive_fifo = new("can_passive_fifo", this);
  endfunction

endclass
