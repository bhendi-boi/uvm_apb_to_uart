class rand_test extends uvm_test;
    `uvm_component_utils(rand_test)

    env environment;
    apb_rand_seq r0;

    function new(string name = "rand_test", uvm_component parent);
        super.new(name, parent);
        `uvm_info("Rand Test", "Constructed Rand Test", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("Rand Test", "Build phase Rand Test", UVM_HIGH)
        environment = env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);

        r0 = apb_rand_seq::type_id::create("apb_rand_seq");

        r0.set_no_of_tr(2);

        r0.start(environment.apb_agent.sequencer);

        phase.drop_objection(this);
    endtask

endclass


