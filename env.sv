class env extends uvm_env;
    `uvm_component_utils(env)

    apb_agnt apb_agent;

    function new(string name = "env", uvm_component parent);
        super.new(name, parent);
        `uvm_info("Env", "Constructed environment", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Env", "Build phase environment", UVM_HIGH)
        apb_agent = apb_agnt::type_id::create("apb_agent", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("Env", "Connect phase environment", UVM_HIGH)
    endfunction


endclass
