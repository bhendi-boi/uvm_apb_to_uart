`include "test_pkg.sv"
`include "uart/uart_intf.sv"

module tb ();

    import uvm_pkg::*;
    import test_pkg::*;


    logic clk;

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        apb_if.reset_n = 1;
        #10 apb_if.reset_n = 0;
        #5 apb_if.reset_n = 1;
    end

    apb_intf apb_if (.pclk(clk));
    uart_intf uart_if();

    apb_uart_sv dut (
        .CLK(clk),
        .RSTN(apb_if.reset_n),
        .PADDR(apb_if.paddr),
        .PWDATA(apb_if.pwdata),
        .PWRITE(apb_if.pwrite),
        .PSEL(apb_if.psel),
        .PENABLE(apb_if.penable),
        .PRDATA(apb_if.prdata),
        .PREADY(apb_if.pready),
        .PSLVERR(apb_if.pslverr)

        .rx_i(uart_if.rx_i),
        .tx_o(uart_if.tx_o),
        .event_o(uart_if.event_o),
    );

    initial begin
        uvm_config_db#(virtual apb_intf)::set(null, "uvm_test_top*", "apb_if",
                                              apb_if);
        // ? Change uvm_test name here or you can do this from command line as well
        run_test("rand_test");
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule
