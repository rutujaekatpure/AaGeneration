#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Value.h"
#include "llvm/Support/raw_ostream.h"
#include "BasicBlockChain.hpp"
#include "AaWriter.hpp"
#include "Utils.hpp"
#include <fstream>

using namespace llvm;
using namespace Aa;

namespace {

  // Function return type check pass
  class FunctionReturnTypeCheck : public FunctionPass {
  public:
    static char ID; // Pass identification

    FunctionReturnTypeCheck() : FunctionPass(ID) {}
    
    bool runOnFunction(Function &F) override {
      // Get function return type
      Type *returnType = F.getReturnType();
      bool flag_f = false;
      for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
          if (AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
            // We found an alloca instruction!
					  std::string iname = to_aa(AI->getName().str());
            if (iname == "return_struct")
              {std::cout << F.getName().str() << "|";
              flag_f = true;}
          }
          if (flag_f){
          if (StoreInst *SI = dyn_cast<StoreInst>(&I)) {
            std::string ptr_name = SI->getPointerOperand()->getName().str(); 
            if (ptr_name.find("gep_result") != std::string::npos){
              std::string name_string = SI->getValueOperand()->getName().str();
              Type *storedType = SI->getValueOperand()->getType();
              std::string type_string;
              llvm::raw_string_ostream os(type_string);
              storedType->print(os);
              std::cout << name_string << " " << type_string <<  "|";
            }
          }
        }
        }
      }
      if (flag_f)
        std::cout << std::endl;
      // Function does not return a structure
      return false;
    }
  };

  char FunctionReturnTypeCheck::ID = 0;

  // Register the pass with LLVM
  static RegisterPass<FunctionReturnTypeCheck> X("check-function-return-type", "Function Return Type Check",
                                              false /* Only available on the command line */);

} // anonymous namespace

// Pass identification



namespace Aa {
    FunctionPass* CreateFunctionReturnTypeCheck()
    {
      return new FunctionReturnTypeCheck();
    }
}