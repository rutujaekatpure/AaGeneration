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
#ifndef __CDFGBUILDER_HPP__
#define __CDFGBUILDER_HPP__

#include <llvm/IR/InstVisitor.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <set>
#include <map>
#include <string>
#include <iostream>

namespace llvm {
  class DataLayout;
  // class AliasAnalysis;
  class IntrinsicInst;
  class MemSetInst;
  class MemTransferInst;
};


namespace Aa {

  struct AaWriter : public llvm::InstVisitor<AaWriter> {

    AaWriter(const llvm::DataLayout *_DL, std::set<std::string>& module_names, bool consider_all_functions);

    const llvm::DataLayout *DL;
    // llvm::AliasAnalysis *AA;
    llvm::Module* _module;
    int _num_ret_instructions;
    llvm::Value* _unique_return_value;
    std::set<std::string>& _module_names;
    bool _consider_all_functions;
    bool _do_while_transform_flag;
    bool _do_while_flag;
    int  _do_while_pipelining_depth;
    int  _do_while_buffering_depth;
    bool _do_while_full_rate_flag;
    bool _is_nonloop_function;
    bool _load_with_gep = false;
    bool _store_with_gep = false;
    bool _guard_flag;
    bool _guard_complement;
    bool _ret_struct = false;
    
    // number of sources before do-while
    bool _merge_entry = false;
    std::map<std::string, std::string> _do_while_entry_values_dict;

    // dictionary to track return struct data type to replace it with multiple returns values
    std::map<std::string, std::map<int, std::string>> _ret_struct_values_dict;

    std::string _guard_variable;

    // dictionary for load/store with getelementptr to avoid dereferencing
    std::map<std::string, std::string> getelemptrinst_dict;
    
    // storage objects.
    std::set<llvm::Value*> _storage_objects;


    // flags for controlling how a
    // basic block is to be printed.
    bool _suppress_leading_merge;
    bool _suppress_terminator;
    BasicBlockChainDAG* _active_dag;


    // kept as strings.. a hack.
    std::map<std::string,std::set<std::string> > bb_predecessor_map;
    std::map<std::string, llvm::BasicBlock*> bb_name_map;

    // kept as pointers..  
    std::map<llvm::BasicBlock*,std::vector<llvm::BasicBlock*> > basic_block_predecessor_map;


    // get predecessors.
    void get_predecessors(llvm::BasicBlock* bb, std::vector<llvm::BasicBlock*>& preds);
    void get_predecessors(std::string& bb, std::vector<std::string>& preds);

    std::map<llvm::Value*, std::string> value_name_map;
    std::map<std::string,std::string> pipe_map;
    std::set<llvm::GlobalVariable*> global_variables_used_in_initialization;
    std::set<llvm::GlobalVariable*> printed_global_variables;

    std::map<llvm::BasicBlock*, std::vector<llvm::BasicBlock*> > basic_block_chain_map;
    std::map<llvm::BasicBlock*, llvm::BasicBlock*> chain_representative_map;
    std::vector<llvm::BasicBlock*> ordered_chain_rep_vector;

    std::vector<BasicBlockChainDAG*> _bb_chain_dag_vector;

    int _pointer_width;
    void Set_Pointer_Width(int w) { _pointer_width = w; }
    int Get_Pointer_Width() { return(_pointer_width); }

    bool _return_flag;
    void Set_Module(llvm::Module* tst) {_module = tst;}
    llvm::Module& Get_Module() {return(*_module);}
    void Set_Return_Flag(bool v) {_return_flag = v;}
    bool Get_Return_Flag() {return(_return_flag);}

    void Set_Do_While_Flag(bool v) {_do_while_flag = v;}
    bool Get_Do_While_Flag() {return(_do_while_flag);}

    void Set_Do_While_Full_Rate_Flag(bool v) {_do_while_full_rate_flag = v;}
    bool Get_Do_While_Full_Rate_Flag() {return(_do_while_full_rate_flag);}

    void Set_Do_While_Pipelining_Depth(int v) {_do_while_pipelining_depth = v;}
    int Get_Do_While_Pipelining_Depth() {return(_do_while_pipelining_depth);}

    void Set_Do_While_Buffering_Depth(int v) {_do_while_buffering_depth = v;}
    int Get_Do_While_Buffering_Depth() {return(_do_while_buffering_depth);}

    void Set_NonLoop_Function_Flag(bool v) {_is_nonloop_function = v;}
    bool Get_NonLoop_Function_Flag() {return(_is_nonloop_function);}

    void Set_Guard_Flag(bool v) {_guard_flag = v;}
    bool Get_Guard_Flag() {return(_guard_flag);}

    void Set_Guard_Complement(bool v) {_guard_complement = v;}
    bool Get_Guard_Complement() {return(_guard_complement);}

    void Set_Guard_Variable(std::string gs) {_guard_variable  = gs;}
    std::string Get_Guard_Variable() {return(_guard_variable);}
    std::string Get_Guard_String() {
	    if(this->_guard_complement)
		    return( "( ~ " + _guard_variable + " )");
	    else
		    return("(" + _guard_variable + ")");
    }
    std::string Get_Guard_RHS_Expression() {
	    if(this->_guard_complement)
		    return( "( ~ " + _guard_variable + " )");
	    else
		    return(_guard_variable);
    }

    bool _error_flag;
    void setErrorFlag(bool v) {_error_flag = v;}
    bool getErrorFlag() {return(_error_flag);}

    void Print_Guard();

    void clear() { 
	    Set_Return_Flag(false); 
	    clear_bb_predecessor_map(); 
	    value_name_map.clear();
    }

    void Collect_Pipes(llvm::Function& F);
    void Add_Pipe(std::string pname, std::string aa_type_name);
    void Print_Pipe_Declarations(std::ostream& ofile, std::map<std::string, int>& pipe_depths,
		    std::set<std::string>& lifo_pipe_set);
    bool Is_Pipe(std::string port_name);

    void start_program(std::string id);
    void print_storage(llvm::GlobalVariable &G);

    void clear_bb_predecessor_map();
    void add_bb_predecessor_map_entry(llvm::BasicBlock* p, llvm::BasicBlock* q);
    int  get_number_of_predecessors(llvm::BasicBlock* p);

    std::string get_name(llvm::Value* v);
    std::string prepare_operand(llvm::Value* v);
    std::string prepare_operand(llvm::Value* v, const llvm::Type* t);

    void name_all_instructions(llvm::BasicBlock &BB, int& iidx);

    virtual void initialise_with_function(llvm::Function &F) = 0;
    virtual void finalise_function() = 0;

    virtual void Write_PHI_Node(llvm::PHINode& pnode, bool mux_flag) {};
    virtual void Write_PHI_Node_At_Do_While_Entry(llvm::PHINode& pnode) {};
    virtual void Write_PHI_Node_In_Do_While_Body(llvm::PHINode& pnode) {};

    virtual void visitBasicBlock(llvm::BasicBlock &BB) {};
    virtual void visitInstruction(llvm::Instruction &I);
    virtual void visitBinaryOperator(llvm::BinaryOperator &I) { visitInstruction(I); }
    virtual void visitReturnInst(llvm::ReturnInst &I) { visitInstruction(I); }
    virtual void visitAllocaInst(llvm::AllocaInst &I) { visitInstruction(I); }
    virtual void visitPHINode(llvm::PHINode &I) { visitInstruction(I); }
    virtual void visitCallInst(llvm::CallInst &I) { visitInstruction(I); }
    virtual void visitSExtInst(llvm::SExtInst& C)  { visitInstruction(C); }
    virtual void visitSIToFPInst(llvm::SIToFPInst& C) { visitInstruction(C); }
    virtual void visitFPToSIInst(llvm::FPToSIInst& C) { visitInstruction(C); }
    virtual void visitCastInst(llvm::CastInst &I) { visitInstruction(I); }
    virtual void visitLoadInst(llvm::LoadInst &I) { visitInstruction(I); }
    virtual void visitStoreInst(llvm::StoreInst &I) { visitInstruction(I); }
    virtual void visitCmpInst(llvm::CmpInst &I) { visitInstruction(I); }
    virtual void visitSelectInst(llvm::SelectInst &I) { visitInstruction(I); }
    virtual void visitBranchInst(llvm::BranchInst &I) { visitInstruction(I); }
    virtual void visitSwitchInst(llvm::SwitchInst &I) { visitInstruction(I); }

	
    bool is_storage_object(llvm::Value* S);
    void write_storage_object(llvm::GlobalVariable *G,
			      std::vector<std::string>& init_obj_vector,
			      bool create_initializers,
			      bool skip_zero_initializers);
    void write_zero_initializer_recursive(std::string prefix,const llvm::Type* ptr, int depth);
    void printConstantArray(llvm::Constant* konst, std::vector<int> indexList, std::string& prefix, bool skip_zero_initializers);
    void write_storage_initializer_statements(std::string& prefix, llvm::Constant* konst, bool skip_zero_initializers);

    void Build_Basic_Block_Chains(llvm::Function& F);
    // virtual void Write_Aa_Code(BasicBlockChainDAG* chain_dag, bool extract_do_while_flag);
    virtual void Write_Aa_Code(BasicBlockChainDAG* chain_dag, bool extract_do_while_flag, bool is_nonloop_function);



    void Build_Basic_Block_Chain_DAGs(llvm::Function& F, bool is_nonloop_function);

	// intrinsics.	
    void handleIntrinsicInst(llvm::IntrinsicInst &I);
    void handleMemSet(llvm::MemSetInst& I);
    void handleMemTransfer(llvm::MemTransferInst& I);

  };
};

Aa::AaWriter* AaWriter_New(const llvm::DataLayout *DL, std::set<std::string>& mnames, bool consider_all_functions);


#endif
