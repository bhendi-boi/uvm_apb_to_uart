`ifndef APB_ADDR_WIDTH
`define APB_ADDR_WIDTH 12
`endif

interface apb_intf (
    input logic clk
);

    logic reset_n;
    logic [`APB_ADDR_WIDTH-1:0] paddr;
    logic [31:0] pwdata;
    logic psel;
    logic pwrite;
    logic penable;
    logic prdata;
    logic pslverr;


endinterface
