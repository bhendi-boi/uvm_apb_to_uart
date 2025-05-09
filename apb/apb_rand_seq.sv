class apb_rand_seq extends apb_base_seq;
    `uvm_object_utils(apb_rand_seq)

    function new(string name = "apb_rand_seq");
        super.new(name);
        set_no_of_tr(1);
        `uvm_info("APB Rand sequence", "Constructed apb_rand_seq", UVM_HIGH)
    endfunction

    task body();
        tr = apb_transaction::type_id::create("tr");

        repeat (this.no_of_tr) begin
            start_item(tr);
            if (!tr.randomize())
                `uvm_fatal("APB Rand sequence", "Randomisation failed")
            finish_item(tr);
        end

    endtask


endclass
