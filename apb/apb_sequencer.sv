class apb_seqr extends uvm_sequencer #(apb_transaction);
    `uvm_component_utils(apb_seqr)


    function new(string name = "apb_seqr", uvm_component parent);
        super.new(name, parent);
        `uvm_info("APB_Sequencer", "Constructed APB Sequencer", UVM_HIGH)
    endfunction

endclass

