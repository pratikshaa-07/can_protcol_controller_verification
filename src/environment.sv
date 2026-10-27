
class environment extends uvm_env;

  `uvm_component_utils(environment)

  // Active and passive agents
  apb_active_agent  apb_agt;
  apb_passive_agent apb_pass_agt;

  can_active_agent  can_agt;
  can_passive_agent can_pass_agt;

  // RAL components
  reg_block regmodel;
  adapter adapt;
  uvm_reg_predictor #(apb_seq_item) predictor;

  // Verification components
  scoreboard sb;
  subscriber sub;

  function new(string name = "environment",
               uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb_agt = apb_active_agent::type_id::create(
      "apb_agt", this);

    apb_pass_agt = apb_passive_agent::type_id::create(
      "apb_pass_agt", this);

    can_agt = can_active_agent::type_id::create(
      "can_agt", this);

    can_pass_agt = can_passive_agent::type_id::create(
      "can_pass_agt", this);

    regmodel = reg_block::type_id::create("regmodel");
    regmodel.build();

    adapt = adapter::type_id::create("adapt");

    predictor =
      uvm_reg_predictor #(apb_seq_item)::type_id::create(
        "predictor", this);

    sb = scoreboard::type_id::create("sb", this);
    sub = subscriber::type_id::create("sub", this);

  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // RAL connections
    regmodel.reg_map.set_sequencer(apb_agt.seqr, adapt);

    predictor.map     = regmodel.reg_map;
    predictor.adapter = adapt;

    // APB monitor -> RAL predictor
    apb_agt.mon.ap_port.connect(predictor.bus_in);

    // All monitor outputs -> scoreboard
    apb_agt.mon.ap_port.connect(
      sb.apb_active_fifo.analysis_export);

    apb_pass_agt.mon.ap_port.connect(
      sb.apb_passive_fifo.analysis_export);

    can_agt.mon.can_port.connect(
      sb.can_active_fifo.analysis_export);

    can_pass_agt.mon.can_port.connect(
      sb.can_passive_fifo.analysis_export);

  endfunction

endclass
