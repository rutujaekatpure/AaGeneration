
from python2llvm import int64, __loop_pipelining_on__, __aa_barrier__, read_uint64, write_uint64

def power(x: int64, y: int64) -> int64:
    result = read_uint64("in_data")
    __aa_barrier__()
    for i in range(y):
        __loop_pipelining_on__(10,13,14)
        result *= x
    write_uint64("out_data", x)
    return result