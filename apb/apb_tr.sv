class apb_transaction extends uvm_sequence_item;
    `uvm_object_utils(apb_transaction)

    rand apb_wdata wdata;
    rand apb_addr addr;
    rand apb_dir dir;
    apb_rdata rdata;
    logic slverr;


    function new(string name = "apb_transaction");
        super.new(name);
    endfunction


    function string convert2string();
        string msg = $sformatf(
            "Slave Error: %0d \nAddr: %0x, Write/Read: %0s\n",
            this.slverr,
            this.addr,
            this.dir.name()
        );
        if (dir) msg = {msg, $sformatf("Wdata: %0x", wdata)};
        else msg = {msg, $sformatf("Rdata: %0x", rdata)};
        return msg;
    endfunction

endclass
