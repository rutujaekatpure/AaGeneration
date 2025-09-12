from python2llvm import int64, __loop_pipelining_on__, __aa_barrier__, read_uint64, write_uint64
def power(x: int64, y: int64) -> int64:
    result = read_uint64("in_data")
    __aa_barrier__()
    while True:
        __loop_pipelining_on__(10,13,14)
        if (x < 10):
            result *= x
            y = y - 1
        else:
            result /= x
            y = y + 1
        if y <= 0:
            break
    write_uint64("out_data", x)
    return result