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
// #include <llvm/Target/TargetData.h>
#include <llvm/Pass.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/GlobalVariable.h>
#include "llvm/IR/PassManager.h"
#include <llvm/IR/ValueSymbolTable.h>
#include "llvm/IR/DataLayout.h"
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/LoopInfo.h>
// #include <llvm/IR/TypeSymbolTable.h>
// #include "llvm/Analysis/SomeAnalysis.h"

#include <sstream>
#include <list>
#include <set>
#include <iostream>
#include <fstream>
#include "BasicBlockChain.hpp"
#include "AaWriter.hpp"
#include "Utils.hpp"

#include <llvm/Analysis/AliasAnalysis.h>
// #include "llvm/Analysis/BasicAliasAnalysis.h"



// namespace llvm {
// 	class AliasAnalysis;
// }

using namespace llvm;
using namespace Aa;


extern bool _global_error_flag;

namespace {

  struct ModuleGenPass : public ModulePass {

    static char ID;
    std::set<std::string> module_names;
	std::set<std::string> module_info;
    std::map<std::string, int> _pipe_depths;
    std::set<std::string> _lifo_pipe_set;
    bool _consider_all_functions;
    bool _create_initializers;
    bool _skip_zero_initializers;
    bool _extract_do_while;
    int _pointer_width;

    ModuleGenPass() : ModulePass(ID) 
    {
      _pointer_width = 32;
      _consider_all_functions = true;
      _create_initializers = true;
      _skip_zero_initializers = true;
      _extract_do_while = true;
    }

    ModuleGenPass(const std::string& mlist_file, 
		  const std::string& mlist_info_file,
		  bool create_initializers, 
		  const std::string& pipe_depth_file,
		  const std::string& hw_target,
		  bool extract_do_while
		  ) : ModulePass(ID) 
    {
      _pointer_width = 32;
      _consider_all_functions = true;
      _create_initializers = create_initializers;
      _skip_zero_initializers = true;
      _extract_do_while = extract_do_while;

      if(hw_target != "")
	{
	  _skip_zero_initializers = (hw_target == "xilinx");
	}

      if(mlist_file != "")
	{
	  std::ifstream mlist(mlist_file.c_str());
	  if (mlist.is_open()) {
	    
	    while (mlist.good()) {
	      std::string line;
	      std::getline(mlist, line);
              if(line[0] != '#')
	      {
	      	std::cerr << "Info: module to be translated: " << line << std::endl;
	      	module_names.insert(line);
	      	_consider_all_functions = false;
	      }
	    }
	    mlist.close();
	  }
	}

	  if(mlist_info_file != "")
	{
	  std::ifstream mlist_info(mlist_info_file.c_str());
	  if (mlist_info.is_open()) {
	    
	    while (mlist_info.good()) {
	      std::string line;
	      std::getline(mlist_info, line);
              if(line[0] != '#')
	      {
	      	std::cerr << "Info: module to be translated: " << line << std::endl;
	      	module_info.insert(line);
	      }
	    }
	    mlist_info.close();
	  }
	}

    if(_consider_all_functions)
		std::cerr << "Warning: no modules specified.. will translate all functions" << std::endl;

	// Check if the string variable 'pipe_depth_file' is not empty
	if (!pipe_depth_file.empty()) {
		// Open an input file stream using 'pipe_depth_file'
		std::ifstream plist(pipe_depth_file);

		// Check if the file stream is open
		if (plist.is_open()) {
			std::string line;
			std::string pipe_name;
			int pipe_depth = 1;
			bool lifo_flag = false;

			// Read each line from the file
			while (std::getline(plist, line)) {
				// Call the function 'parse_pipe_depth_spec' to parse the line and extract pipe information
				// If the parsing is successful (returns true), proceed with the following steps
				if (parse_pipe_depth_spec(line, pipe_name, pipe_depth, lifo_flag)) {
					// Print an informational message indicating the maximum depth of the pipe
					std::cerr << "Info: pipe " << pipe_name << " max-depth set to " << pipe_depth << std::endl;
					
					// Store the pipe depth in the '_pipe_depths' map, using the pipe name as the key
					_pipe_depths[pipe_name] = pipe_depth;

					// Check if the lifo_flag is true
					// If true, insert the pipe name into the '_lifo_pipe_set' set
					if (lifo_flag) {
						_lifo_pipe_set.insert(pipe_name);
					}
				}
			}

			// Close the input file stream
			plist.close();
		}
	}
    
	};

    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
		
    //   AU.addRequired<AAResultsWrapperPass>();
	  AU.setPreservesAll();
	//   AU.addRequired<AliasAnalysis>();
    //   AU.addRequired<DataLayoutPass>();
	  AU.addRequired<LoopInfoWrapperPass>();
    }
	// TargetData *TD;
    // DataLayoutPass *DL;
    // AliasAnalysis *AA;
    BasicBlock *curr_block;
    AaWriter *aa_writer;

    bool isConstantUsed(const Constant *konst) const
    {
      for (llvm::Value::const_use_iterator UI = konst->use_begin(), E = konst->use_end();
           UI != E; ++UI) {
        const Constant *UC = dyn_cast<Constant>(*UI);
		std::cerr << UC << std::endl;
        if (UC == 0 || isa<GlobalValue>(UC))
          return true;
        
        if (isConstantUsed(UC))
          return true;
      }
      return false;
    }

    bool is_ioport_identifier(GlobalVariable &G)
    {
      bool is_ioport = false;
      std::string gname = G.getName().str();
    //   if(aa_writer->Is_Pipe(gname))
	// return(true);
	if (llvm::ConstantDataArray *dataArray = llvm::dyn_cast<llvm::ConstantDataArray>(G.getInitializer())) {
	if (dataArray->isString()){
		llvm::StringRef stringValue = dataArray->getAsString();
		std::string str = stringValue.str();
		if(aa_writer->Is_Pipe(str)){
		return(true);
		}
		}
	// `str` contains the string value of the global variable
	// Use `str` as needed
	} else {

	// The global variable does not have a constant data array initializer
	// Handle other cases here
	}
    
      return is_ioport;
    }

    bool runOnModule(llvm::Module &M)
    {
      const DataLayout *DL = &M.getDataLayout();
    
      aa_writer = AaWriter_New(DL, module_names, _consider_all_functions);  
      aa_writer->setErrorFlag(false);
      aa_writer->Set_Module(&M);
      aa_writer->Set_Pointer_Width(_pointer_width);

	// collect all the pipes declared in the module..
	// you will need to scan every instruction in every
	// function to find the calls to io write/read functions.
      for (llvm::Module::iterator fi = M.begin(), fe = M.end();
           fi != fe; ++fi) {
	std::string fname = (*fi).getName().str();
	if((module_names.count(fname) > 0) || _consider_all_functions)
	  {
	    aa_writer->Collect_Pipes(*fi);
	  }
      }
	// declare the pipes.
      aa_writer->Print_Pipe_Declarations(std::cout,_pipe_depths,_lifo_pipe_set);

      std::vector<std::string> objects_to_be_initialized;
      for (llvm::Module::global_iterator gi = M.global_begin(), ge = M.global_end();
           gi != ge; ++gi) {
        if (!is_ioport_identifier(*gi))
	  {
	    // not if it is a pointer to a function
	    if(!(*gi).getType()->isFunctionTy())
	    {
	      std::string obj_name = to_aa(aa_writer->get_name(&(*gi)));
		  
	      if((*gi).getNumUses() > 0)
		{
			
		//   if(is_used_in_module(*gi,module_names,_consider_all_functions))
		  if(true)
		    {
		    //   if(!aa_writer->Is_Pipe(obj_name))
		    //   {
		      aa_writer->write_storage_object(&(*gi),
						      objects_to_be_initialized, 
						      _create_initializers,
						      _skip_zero_initializers);
		    //   }
		    }
		}
	    }
	  }
      }

      if(_create_initializers)
	{
	  std::string init_module_name = to_aa(M.getModuleIdentifier() + "_storage_initializer_");
	  std::cerr << "Info: generating storage initialization module which calls all initializers in parallel" << std::endl;
	  std::cout << "$module [" << init_module_name << "] $in () $out () $is {" << std::endl;
	  if(objects_to_be_initialized.size() > 0)
	    {
	      std::cout << "$parallelblock [pb] { " << std::endl;
	      for(int idx = 0, fidx = objects_to_be_initialized.size(); idx < fidx; idx++)
		{
		  std::cout << "$call " << objects_to_be_initialized[idx] << " () () " << std::endl;
		}
	      std::cout << "}" << std::endl;
	    }
	  else
	    std::cout << "$null" << std::endl;

	  std::cout << "$attribute initializer" << std::endl;

	  std::cout << "}" << std::endl;
	}


      for (llvm::Module::iterator fi = M.begin(), fe = M.end();
           fi != fe; ++fi) 
	{
	  std::string fname = (*fi).getName().str();
	  if((module_names.count(fname) > 0) || _consider_all_functions)
	    {
	      runOnFunction(*fi);
	    }
	  else
	    {
	      std::cerr << "Info: skipping function " 
			<< fname 
			<< " not specified in -modules" 
			<< std::endl;
	    }
	}



      if(aa_writer->getErrorFlag())
	_global_error_flag = true;

      return false; // we didn't touch anything
    }

    void runOnFunction(llvm::Function &F)
    {
      aa_writer->initialise_with_function(F);

      std::string fname = F.getName().str();

      std::cerr<<"Info: visiting function " << fname << std::endl;

      aa_writer->clear();

      if (F.isDeclaration())
      {
	std::cerr<<"Info: ignoring external function " << fname << std::endl;
        return;
      }

      // scan the list of basic blocks and name them 
      // if they were not already named..
      int idx = 0;
      for(llvm::Function::iterator iter = F.begin(); iter != F.end(); ++iter)
	{
	  if((*iter).getName().str() == "")
	    {
	      std::string bbname = "bb_" + int_to_str(idx);
	      (*iter).setName(bbname);
	    }

	  idx++;
	}

    

      // BFS to figure out predecessors of a block, since there
      // appears to be (?) no way of getting them from llvm.
      std::set<BasicBlock*> blocks_queued;
      std::list<BasicBlock*> queue;
    

      queue.push_back(&(F.getEntryBlock()));
      blocks_queued.insert(&(F.getEntryBlock()));
      int iidx = 0;

      aa_writer->_num_ret_instructions = 0;
      aa_writer->_unique_return_value  = NULL;

      while (!queue.empty()) 
	{
	  BasicBlock *curr_block = queue.front();
	  queue.pop_front();
	  
	  std::cerr << "Info: traversal: visited block " << curr_block->getName().str() <<  std::endl;

	  aa_writer->name_all_instructions(*curr_block,iidx);
	  
	  Instruction *T = curr_block->getTerminator();
	  if(isa<llvm::ReturnInst>(T))
	    {
	      aa_writer->_num_ret_instructions++;
	      if(aa_writer->_num_ret_instructions == 1)
		{
		  llvm::ReturnInst* R = dyn_cast<llvm::ReturnInst>(T);
		  aa_writer->_unique_return_value = R->getReturnValue();
		}
	      else
		aa_writer->_unique_return_value = NULL;
	    }

	  for (unsigned int i = 0, e = T->getNumSuccessors(); i < e; ++i) 
	    {
	      BasicBlock *S = T->getSuccessor(i);

	      // std::cerr << "Info: block " << curr_block->getNameStr() << "  -> " << S->getNameStr() << std::endl;
	      aa_writer->add_bb_predecessor_map_entry(S,curr_block);

	      if (blocks_queued.count(S) == 0)
	      {
		      queue.push_back(S);
		      blocks_queued.insert(S);
	      }
	    }
	}

      if(blocks_queued.size() !=  F.size())
	{
		std::cerr << "Warning: traversal of basic blocks covers " << blocks_queued.size() 
				<< "  blocks, and does not seem to cover all the defined blocks ("
				<< F.size() << ") in Function " 
				<< fname << "." << std::endl;
		std::cerr << " Blocks traversed " << std::endl;
		for(std::set<llvm::BasicBlock*>::iterator siter = blocks_queued.begin();
				siter != blocks_queued.end(); 
				siter++)
		{
			llvm::BasicBlock* bb = *siter;
			std::cerr << " block " << bb->getName().str() << std::endl;
		}
	}

      if(aa_writer->_unique_return_value != NULL)
	{
	  std::string iname = "ret_val__";
	  aa_writer->_unique_return_value->setName(iname);
	}

      for (const auto& module : module_info) {
        std::istringstream iss(module);
        std::string functionName;
		std::getline(iss, functionName, '|');
        // iss >> functionName;
		if (functionName == fname){
        	// std::cerr << "Function Name: " << functionName << "\n";
			// Collect the remaining words as decorators
			std::vector<std::string> decorators;
			std::string decorator;
			while (std::getline(iss, decorator, '|')) {
				decorators.push_back(decorator);
			}
			if (!decorators.empty()) {
				for (const auto& dec : decorators) {
					if (dec.find("pipeline") != std::string::npos)
						parsePipelineDecorator(dec);
					else
						std::cout << "$" << dec << " ";
				}
			} 
		}
		}
	  
      std::cout << "$module [" << to_aa(fname) << "] " << std::endl;
      

      std::cout << " $in (";
      for(auto &args : F.args())
	{
		std::string str;
		std::string arg_name = "";
  		std::string arg_type_str = "";
		llvm::raw_string_ostream os(str);
		args.print(os);
		std::istringstream arg_is(os.str());
  		arg_is >> arg_type_str >> arg_name;
		
	  std::cout << to_aa(arg_name) << " : "
		    << get_aa_type_name(args.getType(), aa_writer->Get_Module()) << " ";
	}

	std::cout << ")" << std::endl;
	std::cout << " $out (";
	const llvm::Type* ret_type = F.getReturnType();
	bool has_ret_val = true;
	if(ret_type->isVoidTy())
	  has_ret_val = false;

	if(func_return_struct(to_aa(fname))){
		std::vector<std::tuple<std::string, std::string>> tuples;
		extractTuples_return_struct(fname, tuples);
		for (const auto& tuple : tuples) {
                std::cout << to_aa(std::get<0>(tuple)) << " : " << get_aa_type_name(std::get<1>(tuple)) << " ";
            }
		// std::cout << "ret_val__ : return struct" ;
	}

	else if(has_ret_val)
	   std::cout << "ret_val__ : " << get_aa_type_name(ret_type, aa_writer->Get_Module());
	std::cout << ")" << std::endl;

	std::cout << " $is " << std::endl<< "{" << std::endl;
	// std::cout << "/////" << get_aa_type_name(ret_type, aa_writer->Get_Module()) << std::endl;
	if(has_ret_val && (aa_writer->_num_ret_instructions > 1))
		std::cout << "$storage stored_ret_val__ : " << get_aa_type_name(ret_type, aa_writer->Get_Module()) << std::endl;

	bool is_nonloop_function = checkIfNonLoopFunction(F);
	if (!is_nonloop_function)
		std::cout << "$branchblock [body] {"  << std::endl;

	// if (_create_initializers)
	// {
	// 	// std::string init_module_name = to_aa(M.getModuleIdentifier() + "_storage_initializer_");
	// 	std::cout <<  "$call global_storage_initializer_ () ()" << std::endl;
	// }
	
	// build basic-block chain dags.
	aa_writer->Build_Basic_Block_Chain_DAGs(F, is_nonloop_function);


	// generate AA code for all the basic-block chains.
	for(int J = 0, fJ = aa_writer->_bb_chain_dag_vector.size(); J < fJ; J++)
	{
		// aa_writer->Write_Aa_Code(aa_writer->_bb_chain_dag_vector[J],_extract_do_while);
		aa_writer->Write_Aa_Code(aa_writer->_bb_chain_dag_vector[J],_extract_do_while,is_nonloop_function);
	}

	/*
	// visit the basic blocks.. this time all instructions
	// have been named ..
	for(llvm::Function::iterator iter = F.begin(); iter != F.end(); ++iter)
	  {
	    bool v = false;
	    int pipelining_depth = 1;
	    int buffering_depth = 1;
            bool full_rate_flag = false;
	    if(_extract_do_while)
	    	v = is_do_while_loop(basic_block_chain_map[chain_rep], pipelining_depth, buffering_depth, full_rate_flag);
	    aa_writer->Set_Do_While_Flag(v);
            aa_writer->Set_Do_While_Full_Rate_Flag(full_rate_flag);
            aa_writer->Set_Do_While_Pipelining_Depth(pipelining_depth);
            aa_writer->Set_Do_While_Buffering_Depth(buffering_depth);
	    aa_writer->visit(*iter);
	    aa_writer->Set_Do_While_Flag(false);
	  }
	*/
	
	if(aa_writer->Get_Return_Flag())
	  {
	    if(has_ret_val && (aa_writer->_num_ret_instructions > 1)){
		  std::cout << "$merge return__ $endmerge" << std::endl;
	      std::cout << "ret_val__ := stored_ret_val__ "  << std::endl;
		  }
	  }
	if (!is_nonloop_function)
		std::cout << "}" << std::endl;
	
	std::cout << "}" << std::endl;
	
	aa_writer->finalise_function();
    }
    
	bool checkIfNonLoopFunction(llvm::Function &F) {
		//use loop info to check if the function has loops
		llvm::LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
		return LI.empty();
	}

  };

  

  char ModuleGenPass::ID = 0;
  RegisterPass<ModuleGenPass> X("modulegen", "generates Aa description");

} // end anonymous namespace

namespace Aa {

  ModulePass* createModuleGenPass(const std::string& module_list, const std::string& module_list_info, bool create_initializers, const std::string& pipe_depth_file,
				  const std::string& hw_target, bool extract_do_while) 
  { 
    return new ModuleGenPass(module_list, module_list_info, create_initializers,pipe_depth_file, hw_target, extract_do_while); 
  }
}