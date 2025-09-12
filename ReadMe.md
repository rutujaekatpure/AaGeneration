
## AaGeneration

This repository contains the llvm to Aa generation source script using LLVM 11 version.
Earlier conversion was based on LLVM 2.8 and can be found here: [Ahir V2](https://github.com/madhavPdesai/ahir/tree/master/v2/llvmbc2Aa)

## Build

run scons to build

Assumes that LLVM 11 is already installed



## Migration Instructions:

1. Pointer type - 
PointerType::getElementType() and Type::getPointerElementType() is replaced.
Refer: https://llvm.org/docs/OpaquePointers.html

2. Target Data replaced b DataLayout

3. AliasAnalysis pass is replaced by AliasWrapperPass

Type of the initializer using konst->getValueID() to determine how to process it.


Code snippets for reference (to print data):
 
```cpp
llvm::Instruction &I
std::string str;
llvm::raw_string_ostream os(str);
I->getValueID().print(os);
os.flush();
std::cerr << I.getValueID() << "\n";
```


