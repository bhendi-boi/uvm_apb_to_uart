class apb_agnt extends uvm_agent;
    `uvm_component_utils(apb_agnt)

    apb_drv  driver;
    apb_mon  monitor;
    apb_seqr sequencer;
    apb_cov  cvg;

    function new(string name = "apb_agnt", uvm_component parent);
        super.new(name, parent);
        `uvm_info("APB_Agent", "Constructed APB Agent", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("APB_Agent", "Build phase APB Agent", UVM_HIGH)
        driver = apb_drv::type_id::create("driver", this);
        sequencer = new("sequencer", this);
        monitor = apb_mon::type_id::create("monitor", this);
        cvg = apb_cov::type_id::create("cvg", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("APB_Agent", "Connect phase APB agent", UVM_HIGH)
        driver.seq_item_port.connect(sequencer.seq_item_export);
        monitor.monitor_port.connect(cvg.cvg_port);
    endfunction

endclass
