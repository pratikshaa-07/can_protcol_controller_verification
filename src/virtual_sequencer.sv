
class virtual_sequencer extends uvm_sequencer #(uvm_sequence_item);

  `uvm_component_utils(virtual_sequencer)

  // Handles to agent sequencers
  apb_sequencer apb_seqr;
  can_sequencer can_seqr;

  function new(string name = "virtual_sequencer",
               uvm_component parent = null);
    super.new(name, parent);
  endfunction

endclass
