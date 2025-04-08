class apb_mon extends uvm_monitor;
    `uvm_component_utils(apb_mon)


    virtual apb_intf vif;
    apb_transaction tr;
    uvm_analysis_port #(apb_transaction) monitor_port;

    function new(string name = "apb_mon", uvm_component parent);
        super.new(name, parent);
        `uvm_info("APB_Monitor", "Constructed apb_monitor", UVM_HIGH)
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("APB_Monitor", "Build phase monitor", UVM_HIGH)
        monitor_port = new("monitor_port", this);
        if (!(uvm_config_db#(virtual apb_intf)::get(
                this, "", "apb_if", vif
            ))) begin
            `uvm_fatal("APB_Monitor", "Monitor couldn't get vif")
        end
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("APB_Monitor", "Run phase monitor", UVM_HIGH)
        tr = apb_transaction::type_id::create("tr");

        forever begin
            sample (tr);
            monitor_port.write(tr);
            `uvm_info("APB_Monitor", tr.convert2string(), UVM_LOW)
        end
    endtask

    task sample (apb_transaction tr);
        @(posedge vif.pready);
        tr.slverr = vif.pslverr;
        tr.addr = vif.paddr;
        tr.dir = vif.pwrite ? APB_WRITE : APB_READ;
        if (!vif.pwrite) tr.rdata = vif.prdata;
        @(negedge vif.pready);
    endtask

endclass
