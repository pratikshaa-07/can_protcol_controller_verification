class can_sequence extends uvm_sequence #(can_seq_item);

  `uvm_object_utils(can_sequence)

  function new(string name = "can_sequence");
    super.new(name);
  endfunction

  task body();
  endtask

endclass
