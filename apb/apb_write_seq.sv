class apb_write_seq extends apb_base_seq;
    `uvm_object_utils(apb_write_seq)

    constraint write_tr {this.tr.dir == 1;}

    function new(string name = "apb_base_seq");
        super.new(name);
        set_no_of_tr(1);
        `uvm_info("APB Write sequence", "Constructed apb_write_seq", UVM_HIGH)
    endfunction

    task body();
        tr = apb_transaction::type_id::create("tr");

        repeat (this.no_of_tr) begin
            start_item(tr);
            if (!randomize(tr))
                `uvm_fatal("APB Write sequence", "Randomisation failed")
            finish_item(tr);
        end

    endtask


endclass
