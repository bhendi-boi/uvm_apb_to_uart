class apb_drv extends uvm_driver #(apb_transaction);
    `uvm_component_utils(apb_drv)

    virtual apb_intf vif;
    apb_transaction  tr;

    function new(string name = "apb_driver", uvm_component parent);
        super.new(name, parent);
        `uvm_info("APB_Driver", "Constructed apb_driver", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("APB_Driver", "Build phase driver", UVM_HIGH)
        if (!(uvm_config_db#(virtual apb_intf)::get(
                this, "", "apb_if", vif
            ))) begin
            `uvm_fatal("APB_Driver", "Driver couldn't get vif")
        end
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("APB_Driver", "Run phase driver", UVM_HIGH)
        tr = apb_transaction::type_id::create("tr");

        forever begin
            seq_item_port.get_next_item(tr);
            drive(tr);
            seq_item_port.item_done();
            `uvm_info("APB_Driver", tr.convert2string(), UVM_LOW)
        end
    endtask

    function void reset_dut();
        vif.psel <= 1'b0;
        vif.paddr <= 0;
        vif.pwrite <= 0;
        vif.pwdata <= 0;
        vif.penable <= 1'b0;
    endfunction

    task drive(apb_transaction tr);

        // setup
        @(posedge vif.pclk);
        vif.psel <= 1'b1;
        vif.penable <= 1'b0;
        vif.paddr <= tr.addr;
        vif.pwrite <= bit'(tr.dir);
        if (tr.dir == APB_WRITE) vif.pwdata <= tr.wdata;

        // enable
        @(posedge vif.pclk);
        vif.penable <= 1'b1;

        // access
        @(negedge vif.pready);
        vif.penable <= 1'b0;

    endtask

endclass
