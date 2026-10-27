
class apb_seq_item extends uvm_sequence_item;

  `uvm_object_utils(apb_seq_item)

  // APB transaction fields
  rand bit [7:0]  paddr;
  rand bit        pwrite;
  rand bit [31:0] pwdata;
  rand bit [3:0]  pstrb;

       bit [31:0] prdata;
       bit        pslverr;

  function new(string name = "apb_seq_item");
    super.new(name);
  endfunction

endclass
