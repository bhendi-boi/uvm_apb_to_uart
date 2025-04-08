class apb_cov extends uvm_component;
    `uvm_component_utils(apb_cov)


    apb_transaction tr;
    uvm_analysis_imp #(apb_transaction, apb_cov) cvg_port;

    covergroup grp;
        dir: coverpoint tr.dir;
        addr: coverpoint tr.addr;
    endgroup

    // grp cvg_grp;

    function new(string name = "apb_cov", uvm_component parent);
        super.new(name, parent);
        grp = new();
        `uvm_info("APB_Coverage", "Constructor Coverage", UVM_HIGH)
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        cvg_port = new("apb_cvg_port", this);
        tr = apb_transaction::type_id::create("tr");
    endfunction


    function void write(apb_transaction tr_q);
        tr = tr_q;
        `uvm_info("APB_Coverage", "Sampling a transation for Coverage", UVM_LOW)
        grp.sample();
    endfunction

endclass
