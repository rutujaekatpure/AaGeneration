//
// Copyright (C) 2010-: Madhav P. Desai
// All Rights Reserved.
//  
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal with the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimers.
//  * Redistributions in binary form must reproduce the above
//    copyright notice, this list of conditions and the following
//    disclaimers in the documentation and/or other materials provided
//    with the distribution.
//  * Neither the names of the AHIR Team, the Indian Institute of
//    Technology Bombay, nor the names of its contributors may be used
//    to endorse or promote products derived from this Software
//    without specific prior written permission.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
// ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
//
// authors: Madhav Desai, Sameer Sahasrabudhe
// copyright:  Indian Institute of Technology, Bombay
//

#include <llvm/IR/Module.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Analysis/TargetTransformInfo.h>
#include "llvm/Target/TargetMachine.h"
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ErrorHandling.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/Signals.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Type.h>
#include <llvm/LinkAllPasses.h>
#include <llvm/LinkAllIR.h>
#include <llvm/IR/LegacyPassNameParser.h>
#include <llvm/IR/LLVMContext.h>
// #include <llvm/IR/PrintModulePass.h>

#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Utils.h>

// #include "llvm/Transforms/IPO/PassManagerBuilder.h"
// #include "llvm/Transforms/Scalar/LowerConstantExpr.h"
#include "llvm/Transforms/Scalar/DeadStoreElimination.h"
#include "llvm/Transforms/Utils/UnifyFunctionExitNodes.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"

#include <fstream>
#include <sstream>
#include <iostream>
#include <cstdio>
#include <fcntl.h>
#include <unistd.h>
// #include "../include/llvm_opt_pass.h"

bool _global_error_flag;

using namespace llvm;

namespace Aa {
  // FunctionPass* createLowerConstantExprPass();
  ModulePass* createModuleGenPass(const std::string &mlist_file, const std::string &mlist_info_file, bool create_initializers, const std::string &pipe_depth_file,
                  const std::string& hw_target, bool extract_do_while);
  FunctionPass* CreateFunctionReturnTypeCheck();
}

#include <signal.h>
void Handle_Segfault(int signal)
{
  std::cerr << "Error: in llvm2aa: segmentation fault! giving up!!" << std::endl;
  exit(-1);
}

// The OptimizationList is automatically populated with registered
// Passes by the PassNameParser.
static cl::list<const PassInfo*, bool,PassNameParser>
OptimizationList(cl::desc("Optimizations available:"));

static cl::opt<std::string>
InputFilename(cl::Positional, cl::desc("<input bytecode>"));

static cl::opt<std::string>
ModuleListFile("modules", cl::desc("A file containing a list of modules to be translated")
               , cl::value_desc("filename"));

static cl::opt<std::string>
ModuleListInfoFile("modulesinfo", cl::desc("A file containing a list and types of modules to be translated")
               , cl::value_desc("filename"));

static cl::opt<std::string>
PipeDepthFile("pipedepths", cl::desc("A file containing pipe-name pipe-depth pairs")
               , cl::value_desc("filename"));

static cl::opt<bool>
  WriteStorageInitializers("storageinit", cl::desc("set to true if you want storage initializers to be generated"));

static cl::opt<std::string>
HardwareTargetDescription("hw_target", cl::desc("the hardware target: choose one of xilinx/asic, default is xilinx")
               , cl::value_desc("hardware_target"));

static cl::opt<bool>
ExtractDoWhile("extract_do_while", cl::desc("detect do-while loops and print in generated Aa file.")
               , cl::value_desc("extract_do_while: set to true if you want do-while loops to be extracted."));


int main(int argc, char **argv)
{

    signal(SIGSEGV, Handle_Segfault);

    _global_error_flag = false;
    llvm::cl::opt<std::string> InputFilename(llvm::cl::Positional,
                                           llvm::cl::desc("<input bitcode file>"),
                                           llvm::cl::Required);
    llvm::cl::opt<std::string> OutputFilename("o", llvm::cl::desc("Output filename"),
                                            llvm::cl::value_desc("filename"),
                                            llvm::cl::init("-"));
    std::cout << "// Aa code produced by llvm2aa (version 2.0)" << std::endl;
    cl::ParseCommandLineOptions(argc, argv, "llvm-to-aa .o -> .aa front-end\n");
    sys::PrintStackTraceOnErrorSignal("Fatal error: segmentation fault");
    // llvm::report_fatal_error(64);
    
    auto BufferOrErr = llvm::MemoryBuffer::getFileOrSTDIN(InputFilename);
    if (!BufferOrErr) {
      llvm::errs() << "Could not open input file: " << InputFilename << "\n";
      return 1;
    }

    std::unique_ptr<llvm::MemoryBuffer> Buffer = std::move(*BufferOrErr);

    llvm::LLVMContext Context;
    auto ModOrErr = llvm::parseBitcodeFile(Buffer->getMemBufferRef(), Context);
    if (!ModOrErr) {
      llvm::errs() << "Error parsing bitcode file: "
                  << llvm::toString(ModOrErr.takeError()) << "\n";
      return 1;
    }
    llvm::Module& M = *ModOrErr.get(); // Obtain reference to llvm::Module
    llvm::legacy::PassManager PM;
     
    PM.add(Aa::CreateFunctionReturnTypeCheck());
    // this is an important pass.. constant expressions are
    // lower to instructions.
    // PM.add(Aa::createLowerConstantExprPass());

    // not critical, but useful.
    // PM.add(llvm::createDeadStoreEliminationPass());

    // not critical, but useful.. but broken.
    // this pass is broken in llvm-2.8.  intermediate
    // basic blocks are optimized away, but their
    // dependent phi statements are incorrectly 
    // handled.
    //Passes.add(createCFGSimplificationPass());

    // not critical, useful.
    // PM.add(llvm::createUnifyFunctionExitNodesPass());
    // Lowerswitch Pass to remove Switch from the code IR and replace it with branching
    PM.add(llvm::createLowerSwitchPass());
    
    PM.add(new llvm::AAResultsWrapperPass());

    // the Aa generation pass.
    Pass *P = Aa::createModuleGenPass(ModuleListFile,ModuleListInfoFile,WriteStorageInitializers,PipeDepthFile,HardwareTargetDescription,ExtractDoWhile);
    if(P != NULL)
      PM.add(P);
    else
      {
      std::cerr << argv[0] << ": cannot create module-gen pass"<< std::endl;
      return(1);
      }

    if(WriteStorageInitializers)
      {
	      std::cerr << "Info: -storageinit=true: storage initializers will be generated" << std::endl;
      }
    else
      {
	      std::cerr << "Info: -storageinit=false: storage initializers will not be generated" << std::endl;
      }

    if(ExtractDoWhile)
      {
	      std::cerr << "Info: -extract_do_while=true: storage initializers will be generated" << std::endl;
      }

    PM.run(M);

    std::error_code EC;
    llvm::raw_fd_ostream OS(OutputFilename, EC, llvm::sys::fs::OF_None);
    if (EC) {
      llvm::errs() << "Error opening file '" << OutputFilename << "': " << EC.message() << "\n";
      return 1;
    }

    llvm::WriteBitcodeToFile(M, OS);
    return 0;
}

