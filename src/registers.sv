//1. ctrl registers
class ctrl_reg extends uvm_reg;

  `uvm_object_utils(ctrl_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field srst;
  rand uvm_reg_field init;

  function new(string name = "ctrl_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 30, 2, "RO", 0, 0, 1, 0, 0);

    srst = uvm_reg_field::type_id::create("srst");
    srst.configure(this, 1, 1, "W1P", 0, 0, 1, 0, 0);

    init = uvm_reg_field::type_id::create("init");
    init.configure(this, 1, 0, "RW", 0, 1, 1, 0, 0);

  endfunction

endclass

//2.mode

class mode_reg extends uvm_reg;

  `uvm_object_utils(mode_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field loopback;
  rand uvm_reg_field listen_only;
  rand uvm_reg_field single_shot;

  function new(string name = "mode_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 29, 3, "RO", 0, 0, 1, 0, 0);

    loopback = uvm_reg_field::type_id::create("loopback");
    loopback.configure(this, 1, 1, "RW", 0, 0, 1, 0, 0);

    listen_only = uvm_reg_field::type_id::create("listen_only");
    listen_only.configure(this, 1, 0, "RW", 0, 0, 1, 0, 0);

    single_shot = uvm_reg_field::type_id::create("single_shot");
    single_shot.configure(this, 1, 2, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//2.mode reg
class mode_reg extends uvm_reg;

  `uvm_object_utils(mode_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field loopback;
  rand uvm_reg_field listen_only;
  rand uvm_reg_field single_shot;

  function new(string name = "mode_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 29, 3, "RO", 0, 0, 1, 0, 0);

    loopback = uvm_reg_field::type_id::create("loopback");
    loopback.configure(this, 1, 1, "RW", 0, 0, 1, 0, 0);

    listen_only = uvm_reg_field::type_id::create("listen_only");
    listen_only.configure(this, 1, 0, "RW", 0, 0, 1, 0, 0);

    single_shot = uvm_reg_field::type_id::create("single_shot");
    single_shot.configure(this, 1, 2, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//3.btr reg

class btr_reg extends uvm_reg;

  `uvm_object_utils(btr_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field sam;
  rand uvm_reg_field tseg1;
  rand uvm_reg_field tseg2;
  rand uvm_reg_field sjw;
  rand uvm_reg_field brp;

  function new(string name = "btr_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 16, 16, "RO", 0, 0, 1, 0, 0);

    sam = uvm_reg_field::type_id::create("sam");
    sam.configure(this, 1, 15, "RW", 0, 0, 1, 0, 0);

    tseg1 = uvm_reg_field::type_id::create("tseg1");
    tseg1.configure(this, 4, 8, "RW", 0, 12, 1, 0, 0);

    tseg2 = uvm_reg_field::type_id::create("tseg2");
    tseg2.configure(this, 3, 12, "RW", 0, 1, 1, 0, 0);

    sjw = uvm_reg_field::type_id::create("sjw");
    sjw.configure(this, 2, 6, "RW", 0, 1, 1, 0, 0);

    brp = uvm_reg_field::type_id::create("brp");
    brp.configure(this, 6, 0, "RW", 0, 1, 1, 0, 0);

  endfunction

endclass

//4.cmd reg

class cmd_reg extends uvm_reg;

  `uvm_object_utils(cmd_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field rxb_release;
  rand uvm_reg_field tx_abort;
  rand uvm_reg_field tx_request;

  function new(string name = "cmd_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 29, 3, "RO", 0, 0, 1, 0, 0);

    rxb_release = uvm_reg_field::type_id::create("rxb_release");
    rxb_release.configure(this, 1, 2, "W1P", 0, 0, 1, 0, 0);

    tx_abort = uvm_reg_field::type_id::create("tx_abort");
    tx_abort.configure(this, 1, 1, "W1P", 0, 0, 1, 0, 0);

    tx_request = uvm_reg_field::type_id::create("tx_request");
    tx_request.configure(this, 1, 0, "W1P", 0, 0, 1, 0, 0);

  endfunction

endclass

//5.sr reg

class sr_reg extends uvm_reg;

  `uvm_object_utils(sr_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field errwrn;
  rand uvm_reg_field estat;
  rand uvm_reg_field rxfull;
  rand uvm_reg_field rxnemp;
  rand uvm_reg_field txbfull;
  rand uvm_reg_field bidle;
  rand uvm_reg_field rxbusy;
  rand uvm_reg_field txbusy;
  rand uvm_reg_field onbus;

  function new(string name = "sr_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 22, 10, "RO", 0, 0, 1, 0, 0);

    errwrn = uvm_reg_field::type_id::create("errwrn");
    errwrn.configure(this, 1, 9, "RO", 1, 0, 1, 0, 0);

    estat = uvm_reg_field::type_id::create("estat");
    estat.configure(this, 2, 7, "RO", 1, 0, 1, 0, 0);

    rxfull = uvm_reg_field::type_id::create("rxfull");
    rxfull.configure(this, 1, 6, "RO", 1, 0, 1, 0, 0);

    rxnemp = uvm_reg_field::type_id::create("rxnemp");
    rxnemp.configure(this, 1, 5, "RO", 1, 0, 1, 0, 0);

    txbfull = uvm_reg_field::type_id::create("txbfull");
    txbfull.configure(this, 1, 4, "RO", 1, 0, 1, 0, 0);

    bidle = uvm_reg_field::type_id::create("bidle");
    bidle.configure(this, 1, 3, "RO", 1, 0, 1, 0, 0);

    rxbusy = uvm_reg_field::type_id::create("rxbusy");
    rxbusy.configure(this, 1, 2, "RO", 1, 0, 1, 0, 0);

    txbusy = uvm_reg_field::type_id::create("txbusy");
    txbusy.configure(this, 1, 1, "RO", 1, 0, 1, 0, 0);

    onbus = uvm_reg_field::type_id::create("onbus");
    onbus.configure(this, 1, 0, "RO", 1, 0, 1, 0, 0);

  endfunction

endclass

//6. ecr reg

class ecr_reg extends uvm_reg;

  `uvm_object_utils(ecr_reg)

  rand uvm_reg_field reserved1;
  rand uvm_reg_field tec;
  rand uvm_reg_field reserved2;
  rand uvm_reg_field rec;

  function new(string name = "ecr_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved1 = uvm_reg_field::type_id::create("reserved1");
    reserved1.configure(this, 7, 25, "RO", 0, 0, 1, 0, 0);

    tec = uvm_reg_field::type_id::create("tec");
    tec.configure(this, 9, 16, "RO", 1, 0, 1, 0, 0);

    reserved2 = uvm_reg_field::type_id::create("reserved2");
    reserved2.configure(this, 8, 8, "RO", 0, 0, 1, 0, 0);

    rec = uvm_reg_field::type_id::create("rec");
    rec.configure(this, 8, 0, "RO", 1, 0, 1, 0, 0);

  endfunction

endclass

//7. esr reg

class esr_reg extends uvm_reg;

  `uvm_object_utils(esr_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field acker;
  rand uvm_reg_field berr;
  rand uvm_reg_field ster;
  rand uvm_reg_field fmer;
  rand uvm_reg_field crcer;

  function new(string name = "esr_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 27, 5, "RO", 0, 0, 1, 0, 0);

    acker = uvm_reg_field::type_id::create("acker");
    acker.configure(this, 1, 4, "W1C", 1, 0, 1, 0, 0);

    berr = uvm_reg_field::type_id::create("berr");
    berr.configure(this, 1, 3, "W1C", 1, 0, 1, 0, 0);

    ster = uvm_reg_field::type_id::create("ster");
    ster.configure(this, 1, 2, "W1C", 1, 0, 1, 0, 0);

    fmer = uvm_reg_field::type_id::create("fmer");
    fmer.configure(this, 1, 1, "W1C", 1, 0, 1, 0, 0);

    crcer = uvm_reg_field::type_id::create("crcer");
    crcer.configure(this, 1, 0, "W1C", 1, 0, 1, 0, 0);

  endfunction

endclass

//8. isr reg

class isr_reg extends uvm_reg;

  `uvm_object_utils(isr_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field errwrn;
  rand uvm_reg_field rxuflw;
  rand uvm_reg_field rxoflw;
  rand uvm_reg_field arblst;
  rand uvm_reg_field bsoff;
  rand uvm_reg_field error;
  rand uvm_reg_field rxok;
  rand uvm_reg_field txok;

  function new(string name = "isr_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 24, 8, "RO", 0, 0, 1, 0, 0);

    errwrn = uvm_reg_field::type_id::create("errwrn");
    errwrn.configure(this, 1, 7, "W1C", 1, 0, 1, 0, 0);

    rxuflw = uvm_reg_field::type_id::create("rxuflw");
    rxuflw.configure(this, 1, 6, "W1C", 1, 0, 1, 0, 0);

    rxoflw = uvm_reg_field::type_id::create("rxoflw");
    rxoflw.configure(this, 1, 5, "W1C", 1, 0, 1, 0, 0);

    arblst = uvm_reg_field::type_id::create("arblst");
    arblst.configure(this, 1, 4, "W1C", 1, 0, 1, 0, 0);

    bsoff = uvm_reg_field::type_id::create("bsoff");
    bsoff.configure(this, 1, 3, "W1C", 1, 0, 1, 0, 0);

    error = uvm_reg_field::type_id::create("error");
    error.configure(this, 1, 2, "W1C", 1, 0, 1, 0, 0);

    rxok = uvm_reg_field::type_id::create("rxok");
    rxok.configure(this, 1, 1, "W1C", 1, 0, 1, 0, 0);

    txok = uvm_reg_field::type_id::create("txok");
    txok.configure(this, 1, 0, "W1C", 1, 0, 1, 0, 0);

  endfunction

endclass

//8. ier reg

class ier_reg extends uvm_reg;

  `uvm_object_utils(ier_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field errwrn;
  rand uvm_reg_field rxuflw;
  rand uvm_reg_field rxoflw;
  rand uvm_reg_field arblst;
  rand uvm_reg_field bsoff;
  rand uvm_reg_field error;
  rand uvm_reg_field rxok;
  rand uvm_reg_field txok;

  function new(string name = "ier_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 24, 8, "RO", 0, 0, 1, 0, 0);

    errwrn = uvm_reg_field::type_id::create("errwrn");
    errwrn.configure(this, 1, 7, "RW", 0, 0, 1, 0, 0);

    rxuflw = uvm_reg_field::type_id::create("rxuflw");
    rxuflw.configure(this, 1, 6, "RW", 0, 0, 1, 0, 0);

    rxoflw = uvm_reg_field::type_id::create("rxoflw");
    rxoflw.configure(this, 1, 5, "RW", 0, 0, 1, 0, 0);

    arblst = uvm_reg_field::type_id::create("arblst");
    arblst.configure(this, 1, 4, "RW", 0, 0, 1, 0, 0);

    bsoff = uvm_reg_field::type_id::create("bsoff");
    bsoff.configure(this, 1, 3, "RW", 0, 0, 1, 0, 0);

    error = uvm_reg_field::type_id::create("error");
    error.configure(this, 1, 2, "RW", 0, 0, 1, 0, 0);

    rxok = uvm_reg_field::type_id::create("rxok");
    rxok.configure(this, 1, 1, "RW", 0, 0, 1, 0, 0);

    txok = uvm_reg_field::type_id::create("txok");
    txok.configure(this, 1, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//9. txb_id reg

class txb_id_reg extends uvm_reg;

  `uvm_object_utils(txb_id_reg)

  rand uvm_reg_field id_std;
  rand uvm_reg_field srr_rtr;
  rand uvm_reg_field ide;
  rand uvm_reg_field id_ext;
  rand uvm_reg_field rtr;

  function new(string name = "txb_id_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    id_std = uvm_reg_field::type_id::create("id_std");
    id_std.configure(this, 11, 21, "RW", 0, 0, 1, 0, 0);

    srr_rtr = uvm_reg_field::type_id::create("srr_rtr");
    srr_rtr.configure(this, 1, 20, "RW", 0, 0, 1, 0, 0);

    ide = uvm_reg_field::type_id::create("ide");
    ide.configure(this, 1, 19, "RW", 0, 0, 1, 0, 0);

    id_ext = uvm_reg_field::type_id::create("id_ext");
    id_ext.configure(this, 18, 1, "RW", 0, 0, 1, 0, 0);

    rtr = uvm_reg_field::type_id::create("rtr");
    rtr.configure(this, 1, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//10. txb dlc reg

class txb_dlc_reg extends uvm_reg;

  `uvm_object_utils(txb_dlc_reg)

  rand uvm_reg_field dlc;
  rand uvm_reg_field reserved;

  function new(string name = "txb_dlc_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    dlc = uvm_reg_field::type_id::create("dlc");
    dlc.configure(this, 4, 28, "RW", 0, 0, 1, 0, 0);

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 28, 0, "RO", 0, 0, 1, 0, 0);

  endfunction

endclass

//11.txb dw1 reg

class txb_dw1_reg extends uvm_reg;

  `uvm_object_utils(txb_dw1_reg)

  rand uvm_reg_field data;

  function new(string name = "txb_dw1_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    data = uvm_reg_field::type_id::create("data");
    data.configure(this, 32, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//12.txb dw2 reg

class txb_dw2_reg extends uvm_reg;

  `uvm_object_utils(txb_dw2_reg)

  rand uvm_reg_field data;

  function new(string name = "txb_dw2_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    data = uvm_reg_field::type_id::create("data");
    data.configure(this, 32, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//13. rxb id reg

class rxb_id_reg extends uvm_reg;

  `uvm_object_utils(rxb_id_reg)

  rand uvm_reg_field id_std;
  rand uvm_reg_field srr_rtr;
  rand uvm_reg_field ide;
  rand uvm_reg_field id_ext;
  rand uvm_reg_field rtr;

  function new(string name = "rxb_id_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    id_std = uvm_reg_field::type_id::create("id_std");
    id_std.configure(this, 11, 21, "RO", 0, 0, 1, 0, 0);

    srr_rtr = uvm_reg_field::type_id::create("srr_rtr");
    srr_rtr.configure(this, 1, 20, "RO", 0, 0, 1, 0, 0);

    ide = uvm_reg_field::type_id::create("ide");
    ide.configure(this, 1, 19, "RO", 0, 0, 1, 0, 0);

    id_ext = uvm_reg_field::type_id::create("id_ext");
    id_ext.configure(this, 18, 1, "RO", 0, 0, 1, 0, 0);

    rtr = uvm_reg_field::type_id::create("rtr");
    rtr.configure(this, 1, 0, "RO", 0, 0, 1, 0, 0);

  endfunction

endclass

//14. rxb dlc reg
class rxb_dlc_reg extends uvm_reg;

  `uvm_object_utils(rxb_dlc_reg)

  rand uvm_reg_field dlc;
  rand uvm_reg_field reserved;

  function new(string name = "rxb_dlc_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    dlc = uvm_reg_field::type_id::create("dlc");
    dlc.configure(this, 4, 28, "RO", 0, 0, 1, 0, 0);

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 28, 0, "RO", 0, 0, 1, 0, 0);

  endfunction

endclass

//15. rxb dw1 reg

class rxb_dw1_reg extends uvm_reg;

  `uvm_object_utils(rxb_dw1_reg)

  rand uvm_reg_field data;

  function new(string name = "rxb_dw1_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    data = uvm_reg_field::type_id::create("data");
    data.configure(this, 32, 0, "RO", 0, 0, 1, 0, 0);

  endfunction

endclass

//15. rxb dw2 reg

class rxb_dw2_reg extends uvm_reg;

  `uvm_object_utils(rxb_dw2_reg)

  rand uvm_reg_field data;

  function new(string name = "rxb_dw2_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    data = uvm_reg_field::type_id::create("data");
    data.configure(this, 32, 0, "RO", 0, 0, 1, 0, 0);

  endfunction

endclass

//16.afr reg

class afr_reg extends uvm_reg;

  `uvm_object_utils(afr_reg)

  rand uvm_reg_field reserved;
  rand uvm_reg_field uaf1;
  rand uvm_reg_field uaf0;

  function new(string name = "afr_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 30, 2, "RO", 0, 0, 1, 0, 0);

    uaf1 = uvm_reg_field::type_id::create("uaf1");
    uaf1.configure(this, 1, 1, "RW", 0, 0, 1, 0, 0);

    uaf0 = uvm_reg_field::type_id::create("uaf0");
    uaf0.configure(this, 1, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//17. afmr 0 reg

class afmr0_reg extends uvm_reg;

  `uvm_object_utils(afmr0_reg)

  rand uvm_reg_field mask;

  function new(string name = "afmr0_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    mask = uvm_reg_field::type_id::create("mask");
    mask.configure(this, 32, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//18. afir 0 reg
class afir0_reg extends uvm_reg;

  `uvm_object_utils(afir0_reg)

  rand uvm_reg_field identifier;

  function new(string name = "afir0_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    identifier = uvm_reg_field::type_id::create("identifier");
    identifier.configure(this, 32, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//19. afmr1 reg 

class afmr1_reg extends uvm_reg;

  `uvm_object_utils(afmr1_reg)

  rand uvm_reg_field mask;

  function new(string name = "afmr1_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    mask = uvm_reg_field::type_id::create("mask");
    mask.configure(this, 32, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

//20. afir 1
class afmr1_reg extends uvm_reg;

  `uvm_object_utils(afmr1_reg)

  rand uvm_reg_field mask;

  function new(string name = "afmr1_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();

    mask = uvm_reg_field::type_id::create("mask");
    mask.configure(this, 32, 0, "RW", 0, 0, 1, 0, 0);

  endfunction

endclass

