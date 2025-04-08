class apb_rand_seq extends uvm_sequence;
    `uvm_object_utils(apb_rand_seq)

    rand apb_transaction;
    int no_of_tr;

    function void set_no_of_tr(int no_of_tr);
        this.no_of_tr = no_of_tr;
    endfunction

    function int get_no_of_tr();
        return this.no_of_tr;
    endfunction


    function new(string name = "apb_rand_seq");
        super.new(name);
        set_no_of_tr(1);
        `uvm_info("APB Rand sequence", "Constructed apb_rand_seq", UVM_HIGH)
    endfunction

    task body ();
        tr = apb_transaction::type_id::create("tr");

        repeat(this.no_of_tr)begin
            start_item(tr);
            if (!tr.randomize())
                `uvm_fatal("APB Rand sequence", "Randomisation failed")
            finish_item(tr);
        end

    endtask


endclass
