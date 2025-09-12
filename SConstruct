import os
env = Environment(ENV = {'PATH' : os.environ['PATH']})
# SConscript(['docs/SConscript'])
# env.Append(LIBS=['LLVMCodeGen', 'LLVMPasses', 'LLVMipo', 'LLVMVectorize', 'LLVMLinker', 'LLVMIRReader', 'LLVMAsmParser', 'LLVMFrontendOpenMP', 'LLVMScalarOpts', 'LLVMInstCombine', 'LLVMAggressiveInstCombine', 'LLVMInstrumentation', 'LLVMTransformUtils', 'LLVMBitWriter', 'LLVMAnalysis', 'LLVMProfileData', 'LLVMObject', 'LLVMTextAPI', 'LLVMMCParser', 'LLVMMC', 'LLVMDebugInfoCodeView', 'LLVMDebugInfoMSF', 'LLVMBitReader', 'LLVMRemarks', 'LLVMBitstreamReader', 'LLVMBinaryFormat','LLVMSupport', 'LLVMDemangle', 'LLVMCore' ])

local = env.Clone()

VariantDir('obj','src',duplicate=0)
source_files = Glob('obj/*.cpp')

local.Append(CPPPATH = './include')
# local.Append(CPPPATH = '../BGLWrap/include')
local.ParseConfig('llvm-config --cxxflags --ldflags --system-libs --libs all' )

# add boost-install path if necessary
# local.Append(CPPPATH = '/home/rattzzz/PhD/Github_Repo/llvm/llvm-project/boost_1_46_1/')
local.Append(LIBS = 'm')
local.Append(LIBS = 'dl')
local.Append(LIBS = 'z')
local.Append(LIBS = 'pthread')
local.Append(LIBS = 'ncurses')

# Link the library target with your main program
# local.Program('bin/llvm2aa', source_files, LINKFLAGS=['-DLLVM_DISABLE_ABI_BREAKING_CHECKS_ENFORCING=1','-W','-v'], CCFLAGS = ['-g','-D_GLIBCXX_USE_CXX11_ABI=0'], LIBPATH=['/home/rattzzz/PhD/Github_Repo/llvm/llvm-project/build/lib/'])
local.Program('bin/llvm2aa', source_files, CCFLAGS = ['-g','-fno-rtti'], LIBPATH=['/home/rattzzz/PhD/Github_Repo/llvm/llvm-project/build/lib/'])


