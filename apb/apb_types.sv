`define APB_ADDR_WIDTH 12
typedef bit [`APB_ADDR_WIDTH-1:0] apb_addr;
typedef bit [31:0] apb_wdata;
// since it is an output logic
typedef logic [31:0] apb_rdata;
typedef enum bit {
    APB_READ  = 0,
    APB_WRITE = 1
} apb_dir;
