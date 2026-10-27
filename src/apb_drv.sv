class apb_driver extends uvm_driver #(apb_seq_item);

  `uvm_component_utils(apb_driver)
  virtual apb_if vif;

  function new(string name = "",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("APB_DRIVER", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
  endtask

endclass
