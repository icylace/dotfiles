# clang
# Autogenerated from man page /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man/man1/clang.1
complete -c clang -s E --description 'Run the preprocessor stage.'
complete -c clang -o fsyntax-only --description 'Run the preprocessor, parser and type checking stages.'
complete -c clang -s S --description 'Run the previous stages as well as LLVM generation and optimization stages an…'
complete -c clang -s c --description 'Run all of the above, plus the assembler, generating a target ".'
complete -c clang -s x --description 'Treat subsequent input files as having type language.'
complete -c clang -o std --description 'Specify the language standard to compile for.'
complete -c clang -o stdlib --description 'Specify the C++ standard library to use; supported options are libstdc++ and …'
complete -c clang -o ansi --description 'Same as -std=c89.'
complete -c clang -o ObjC -o ObjC++ --description 'Treat source input files as Objective-C and Object-C++ inputs respectively.'
complete -c clang -o trigraphs --description 'Enable trigraphs.'
complete -c clang -o ffreestanding --description 'Indicate that the file should be compiled for a freestanding, not a hosted, e…'
complete -c clang -o fno-builtin --description 'Disable special handling and optimizations of builtin functions like strlen()…'
complete -c clang -o fmath-errno --description 'Indicate that math functions should be treated as updating errno.'
complete -c clang -o fpascal-strings --description 'Enable support for Pascal-style strings with "pfoo".'
complete -c clang -o fms-extensions --description 'Enable support for Microsoft extensions.'
complete -c clang -o fmsc-version --description 'Set _MSC_VER.  Defaults to 1300 on Windows.  Not set otherwise.'
complete -c clang -o fborland-extensions --description 'Enable support for Borland extensions.'
complete -c clang -o fwritable-strings --description 'Make all string literals default to writable.'
complete -c clang -o flax-vector-conversions --description 'Allow loose type checking rules for implicit vector conversions.'
complete -c clang -o fblocks --description 'Enable the "Blocks" language feature.'
complete -c clang -o fobjc-gc-only --description 'Indicate that Objective-C code should be compiled in GC-only mode, which only…'
complete -c clang -o fobjc-gc --description 'Indicate that Objective-C code should be compiled in hybrid-GC mode, which wo…'
complete -c clang -o fobjc-abi-version --description 'Select the Objective-C ABI version to use.'
complete -c clang -o fobjc-nonfragile-abi-version --description 'Select the Objective-C non-fragile ABI version to use by default.'
complete -c clang -o fobjc-nonfragile-abi -o fno-objc-nonfragile-abi --description 'Enable use of the Objective-C non-fragile ABI.'
complete -c clang -o arch --description 'Specify the architecture to build for.'
complete -c clang -o mmacosx-version-min --description 'When building for Mac OS X, specify the minimum version supported by your app…'
complete -c clang -o miphoneos-version-min --description 'When building for iPhone OS, specify the minimum version supported by your ap…'
complete -c clang -o march --description 'Specify that Clang should generate code for a specific processor family membe…'
complete -c clang -o O0 -o O1 -o O2 -o O3 -o Ofast -o Os -o Oz -s O -o O4 --description 'Specify which optimization level to use: NDENT 7. 0 NDENT 3.'
complete -c clang -s g -o gline-tables-only -o gmodules --description 'Control debug information output.'
complete -c clang -o fstandalone-debug -o fno-standalone-debug --description 'Clang supports a number of optimizations to reduce the size of debug informat…'
complete -c clang -o fexceptions --description 'Enable generation of unwind information.'
complete -c clang -o ftrapv --description 'Generate code to catch integer overflow errors.'
complete -c clang -o fvisibility --description 'This flag sets the default visibility level.'
complete -c clang -o fcommon -o fno-common --description 'This flag specifies that variables without initializers get common linkage.'
complete -c clang -o ftls-model --description 'Set the default thread-local storage (TLS) model to use for thread-local vari…'
complete -c clang -o flto -o flto -o flto -o emit-llvm --description 'Generate output files in LLVM formats, suitable for link time optimization.'
complete -c clang -o '###' --description 'Print (but do not run) the commands to run for this compilation.'
complete -c clang -l help --description 'Display available options.'
complete -c clang -o Qunused-arguments --description 'Do not emit any warnings for unused driver arguments.'
complete -c clang -o Wa --description 'Pass the comma separated arguments in args to the assembler.'
complete -c clang -o Wl --description 'Pass the comma separated arguments in args to the linker.'
complete -c clang -o Wp --description 'Pass the comma separated arguments in args to the preprocessor.'
complete -c clang -o Xanalyzer --description 'Pass arg to the static analyzer.'
complete -c clang -o Xassembler --description 'Pass arg to the assembler.'
complete -c clang -o Xlinker --description 'Pass arg to the linker.'
complete -c clang -o Xpreprocessor --description 'Pass arg to the preprocessor.'
complete -c clang -s o --description 'Write output to file.'
complete -c clang -o print-file-name --description 'Print the full library path of file.'
complete -c clang -o print-libgcc-file-name --description 'Print the library path for "libgcc. a".'
complete -c clang -o print-prog-name --description 'Print the full program path of name.'
complete -c clang -o print-search-dirs --description 'Print the paths used for finding libraries and programs.'
complete -c clang -o save-temps --description 'Save intermediate compilation results.'
complete -c clang -o save-stats -o save-stats -o save-stats --description 'Save internal code generation (LLVM) statistics to a file in the current dire…'
complete -c clang -o integrated-as -o no-integrated-as --description 'Used to enable and disable, respectively, the use of the integrated assembler.'
complete -c clang -o time --description 'Time individual commands.'
complete -c clang -o ftime-report --description 'Print timing summary of each stage of compilation.'
complete -c clang -s v --description 'Show commands to run and use verbose output.'
complete -c clang -o fshow-column -o fshow-source-location -o fcaret-diagnostics -o fdiagnostics-fixit-info -o fdiagnostics-parseable-fixits -o fdiagnostics-print-source-range-info -o fprint-source-range-info -o fdiagnostics-show-option -o fmessage-length --description 'These options control how Clang prints out information about diagnostics (err…'
complete -c clang -o 'D<macroname>' --description 'Adds an implicit #define into the predefines buffer which is read before the …'
complete -c clang -o 'U<macroname>' --description 'Adds an implicit #undef into the predefines buffer which is read before the s…'
complete -c clang -o include --description 'Adds an implicit #include into the predefines buffer which is read before the…'
complete -c clang -o 'I<directory>' --description 'Add the specified directory to the search path for include files.'
complete -c clang -o 'F<directory>' --description 'Add the specified directory to the search path for framework include files.'
complete -c clang -o nostdinc --description 'Do not search the standard system directories or compiler builtin directories…'
complete -c clang -o nostdlibinc --description 'Do not search the standard system directories for include files, but do searc…'
complete -c clang -o nobuiltininc --description 'Do not search clang\\(aqs builtin directory for include files.'

