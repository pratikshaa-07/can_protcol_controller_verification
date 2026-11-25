
interface apb_if(input logic PCLK,PRESETn);

  logic [7:0]  PADDR;
  logic [2:0]  PPROT;
  logic        PSEL;
  logic        PENABLE;
  logic        PWRITE;
  logic [31:0] PWDATA;
  logic [3:0]  PSTRB;
  logic [31:0] PRDATA;
  logic        PREADY;
  logic        PSLVERR;
  logic        irq;
  
  // Driver clocking block
  clocking drv_cb @(posedge PCLK);
    default input #0 output #0;

    output PADDR, PPROT, PSEL, PENABLE;
    output PWRITE, PWDATA, PSTRB;
    input  PRDATA, PREADY, PSLVERR;
    input  PRESETn;
  endclocking

  // Monitor clocking block
  clocking mon_cb @(posedge PCLK);
    default input #0;
    input PADDR, PPROT, PSEL, PENABLE;
    input PWRITE, PWDATA, PSTRB;
    input PRDATA, PREADY, PSLVERR;
    input PRESETn;
  endclocking

  // Driver modport
  modport DRV(clocking drv_cb,input PCLK,PRESETn);
  // Monitor modport
    modport MON (clocking mon_cb,input PCLK,PRESETn);
endinterface
