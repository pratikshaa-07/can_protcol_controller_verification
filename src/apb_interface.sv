interface apb_if(input logic PCLK);

  logic        PRESETn;
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

endinterface
