# UVM APB TO UART

## Design Spec

- `PREADY` and `PSLVERR` are tied to 1 an 0 respectively.

## How to run

### Xcelium

```bash
xrun -Q -unbuffered -gui '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' '+UVM_VERBOSITY=UVM_HIGH' '+UVM_TESTNAME=rand_test' '-svseed' '2' -uvmnocdnsextra -uvmhome $UVM_HOME $UVM_HOME/src/uvm_macros.svh design.sv testbench.sv -incdir apb -incdir uart -incdir design
```
