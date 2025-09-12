import python2llvm as llvm

@llvm.jit(verbose=verbose)
def power():
    result = llvm.read_uint64("in_data")
    llvm.write_uint64("out_data", result+5)