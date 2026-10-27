
class virtual_sequence extends uvm_sequence #(uvm_sequence_item);

  `uvm_object_utils(virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  function new(string name = "virtual_sequence");
    super.new(name);
  endfunction

  virtual task body();
    // APB and CAN sequences will be started here.
  endtask

endclass
