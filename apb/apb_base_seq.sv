class apb_base_seq extends uvm_sequence;
    `uvm_object_utils(apb_base_seq)

    rand apb_transaction tr;
    int no_of_tr;

    function void set_no_of_tr(int no_of_tr);
        this.no_of_tr = no_of_tr;
    endfunction

    function int get_no_of_tr();
        return this.no_of_tr;
    endfunction


    function new(string name = "apb_base_seq");
        super.new(name);
        set_no_of_tr(1);
        `uvm_info("APB Base sequence", "Constructed apb_base_seq", UVM_HIGH)
    endfunction

    task body();
        tr = apb_transaction::type_id::create("tr");

        repeat (this.no_of_tr) begin
            start_item(tr);
            if (!tr.randomize())
                `uvm_fatal("APB Base sequence", "Randomisation failed")
            finish_item(tr);
        end

    endtask


endclass
