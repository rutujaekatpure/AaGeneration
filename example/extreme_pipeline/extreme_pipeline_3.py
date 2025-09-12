from python2llvm import int64, __loop_pipelining_on__
def power(x: int64, y: int64) -> int64:
    result = 0
    while True:
        __loop_pipelining_on__(10,13,14)
        if x > 10:
            result = x + y + result 
        y = y - 1
        if y <= 0:
            break
    return result