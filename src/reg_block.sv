
class reg_block extends uvm_reg_block;

  `uvm_object_utils(reg_block)

  // Control and status registers
  rand ctrl_reg ctrl;
  rand mode_reg mode;
  rand btr_reg  btr;
  rand cmd_reg  cmd;
  rand sr_reg   sr;
  rand ecr_reg  ecr;
  rand esr_reg  esr;
  rand isr_reg  isr;
  rand ier_reg  ier;

  // Transmit buffer registers
  rand txb_id_reg  txb_id;
  rand txb_dlc_reg txb_dlc;
  rand txb_dw1_reg txb_dw1;
  rand txb_dw2_reg txb_dw2;

  // Receive buffer registers
  rand rxb_id_reg  rxb_id;
  rand rxb_dlc_reg rxb_dlc;
  rand rxb_dw1_reg rxb_dw1;
  rand rxb_dw2_reg rxb_dw2;

  // Acceptance filter registers
  rand afr_reg  afr;
  rand afmr0_reg afmr0;
  rand afir0_reg afir0;
  rand afmr1_reg afmr1;
  rand afir1_reg afir1;

  // Register address map
  uvm_reg_map reg_map;

  function new(string name = "reg_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    // Create a 32-bit register map
    reg_map = create_map(
      "reg_map",
      'h0,
      4,
      UVM_LITTLE_ENDIAN,
      1
    );

    // --------------------------------
    // CTRL - 0x00
    // --------------------------------
    ctrl = ctrl_reg::type_id::create("ctrl");
    ctrl.configure(this);
    ctrl.build();
    reg_map.add_reg(ctrl, 'h00, "RW");

    // --------------------------------
    // MODE - 0x04
    // --------------------------------
    mode = mode_reg::type_id::create("mode");
    mode.configure(this);
    mode.build();
    reg_map.add_reg(mode, 'h04, "RW");

    // --------------------------------
    // BTR - 0x08
    // --------------------------------
    btr = btr_reg::type_id::create("btr");
    btr.configure(this);
    btr.build();
    reg_map.add_reg(btr, 'h08, "RW");

    // --------------------------------
    // CMD - 0x0C
    // --------------------------------
    cmd = cmd_reg::type_id::create("cmd");
    cmd.configure(this);
    cmd.build();
    reg_map.add_reg(cmd, 'h0C, "RW");

    // --------------------------------
    // SR - 0x10
    // --------------------------------
    sr = sr_reg::type_id::create("sr");
    sr.configure(this);
    sr.build();
    reg_map.add_reg(sr, 'h10, "RO");

    // --------------------------------
    // ECR - 0x14
    // --------------------------------
    ecr = ecr_reg::type_id::create("ecr");
    ecr.configure(this);
    ecr.build();
    reg_map.add_reg(ecr, 'h14, "RO");

    // --------------------------------
    // ESR - 0x18
    // --------------------------------
    esr = esr_reg::type_id::create("esr");
    esr.configure(this);
    esr.build();
    reg_map.add_reg(esr, 'h18, "RW");

    // --------------------------------
    // ISR - 0x1C
    // --------------------------------
    isr = isr_reg::type_id::create("isr");
    isr.configure(this);
    isr.build();
    reg_map.add_reg(isr, 'h1C, "RW");

    // --------------------------------
    // IER - 0x20
    // --------------------------------
    ier = ier_reg::type_id::create("ier");
    ier.configure(this);
    ier.build();
    reg_map.add_reg(ier, 'h20, "RW");

    // --------------------------------
    // TXB_ID - 0x30
    // --------------------------------
    txb_id = txb_id_reg::type_id::create("txb_id");
    txb_id.configure(this);
    txb_id.build();
    reg_map.add_reg(txb_id, 'h30, "RW");

    // --------------------------------
    // TXB_DLC - 0x34
    // --------------------------------
    txb_dlc = txb_dlc_reg::type_id::create("txb_dlc");
    txb_dlc.configure(this);
    txb_dlc.build();
    reg_map.add_reg(txb_dlc, 'h34, "RW");

    // --------------------------------
    // TXB_DW1 - 0x38
    // --------------------------------
    txb_dw1 = txb_dw1_reg::type_id::create("txb_dw1");
    txb_dw1.configure(this);
    txb_dw1.build();
    reg_map.add_reg(txb_dw1, 'h38, "RW");

    // --------------------------------
    // TXB_DW2 - 0x3C
    // --------------------------------
    txb_dw2 = txb_dw2_reg::type_id::create("txb_dw2");
    txb_dw2.configure(this);
    txb_dw2.build();
    reg_map.add_reg(txb_dw2, 'h3C, "RW");

    // --------------------------------
    // RXB_ID - 0x40
    // --------------------------------
    rxb_id = rxb_id_reg::type_id::create("rxb_id");
    rxb_id.configure(this);
    rxb_id.build();
    reg_map.add_reg(rxb_id, 'h40, "RO");

    // --------------------------------
    // RXB_DLC - 0x44
    // --------------------------------
    rxb_dlc = rxb_dlc_reg::type_id::create("rxb_dlc");
    rxb_dlc.configure(this);
    rxb_dlc.build();
    reg_map.add_reg(rxb_dlc, 'h44, "RO");

    // --------------------------------
    // RXB_DW1 - 0x48
    // --------------------------------
    rxb_dw1 = rxb_dw1_reg::type_id::create("rxb_dw1");
    rxb_dw1.configure(this);
    rxb_dw1.build();
    reg_map.add_reg(rxb_dw1, 'h48, "RO");

    // --------------------------------
    // RXB_DW2 - 0x4C
    // --------------------------------
    rxb_dw2 = rxb_dw2_reg::type_id::create("rxb_dw2");
    rxb_dw2.configure(this);
    rxb_dw2.build();
    reg_map.add_reg(rxb_dw2, 'h4C, "RO");

    // --------------------------------
    // AFR - 0x50
    // --------------------------------
    afr = afr_reg::type_id::create("afr");
    afr.configure(this);
    afr.build();
    reg_map.add_reg(afr, 'h50, "RW");

    // --------------------------------
    // AFMR0 - 0x54
    // --------------------------------
    afmr0 = afmr0_reg::type_id::create("afmr0");
    afmr0.configure(this);
    afmr0.build();
    reg_map.add_reg(afmr0, 'h54, "RW");

    // --------------------------------
    // AFIR0 - 0x58
    // --------------------------------
    afir0 = afir0_reg::type_id::create("afir0");
    afir0.configure(this);
    afir0.build();
    reg_map.add_reg(afir0, 'h58, "RW");

    // --------------------------------
    // AFMR1 - 0x5C
    // --------------------------------
    afmr1 = afmr1_reg::type_id::create("afmr1");
    afmr1.configure(this);
    afmr1.build();
    reg_map.add_reg(afmr1, 'h5C, "RW");

    // --------------------------------
    // AFIR1 - 0x60
    // --------------------------------
    afir1 = afir1_reg::type_id::create("afir1");
    afir1.configure(this);
    afir1.build();
    reg_map.add_reg(afir1, 'h60, "RW");

    // Finalize register model
    lock_model();

  endfunction

endclass
