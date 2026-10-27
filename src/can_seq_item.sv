
class can_seq_item extends uvm_sequence_item;

  `uvm_object_utils(can_seq_item)

  // Frame control
  rand bit        is_extended;
  rand bit        is_remote;
  rand bit [28:0] can_id;
  rand bit [3:0]  dlc;
  rand bit [7:0]  data[];

  // Captured / decoded frame information
  bit             crc_ok;
  bit             ack_seen;
  bit             stuff_error;
  bit             form_error;
  bit             bit_error;
  bit             crc_error;
  bit             ack_error;

  constraint c_data_size {
    if (is_remote)
      data.size() == 0;
    else if (dlc inside {[0:8]})
      data.size() == dlc;
    else
      data.size() == 8;
  }

  constraint c_can_id {
    if (!is_extended)
      can_id inside {[0:2047]};
    else
      can_id inside {[0:536870911]};
  }

  function new(string name = "");
    super.new(name);
  endfunction

endclass
