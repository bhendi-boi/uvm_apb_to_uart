# UVM APB TO UART

## Design Spec

- `PREADY` and `PSLVERR` are tied to 1 an 0 respectively.

## How to run

### Xcelium

```bash
xrun -Q -unbuffered -gui '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' '+UVM_VERBOSITY=UVM_HIGH' '+UVM_TESTNAME=rand_test' '-svseed' '2' -uvmnocdnsextra -uvmhome $UVM_HOME $UVM_HOME/src/uvm_macros.svh design.sv testbench.sv -incdir apb -incdir uart -incdir design
```

## Spec

- Only the last byte of `PWDATA` is used.
- Only last 3 bits of `PADDR` is used.

### Internal Registers

| Register Name        | Pneumonic | Offset | Initial Value |
| -------------------- | --------- | ------ | ------------- |
| Line Status Register | LSR       | 3'h5   | 8'h60         |

#### Line Status Register

- initial value 8'60 = 0110_0000
- [0] - has `fifo_rx_valid`
- [2] - used to indicate parity error is detected during receiving
- [5] - active high, used to indicate whether `FIFO` is empty or not
- [6] - active high, used to indicate whether `FIFO` and `shift_register` empty or not
