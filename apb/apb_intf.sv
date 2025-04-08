`ifndef APB_ADDR_WIDTH
`define APB_ADDR_WIDTH 12
`endif

interface apb_intf (
    input logic pclk
);

    logic reset_n;
    logic [`APB_ADDR_WIDTH-1:0] paddr;
    logic [31:0] pwdata;
    logic [31:0] prdata;
    logic psel;
    logic pwrite;
    logic pready;
    logic penable;
    logic pslverr;


endinterface
