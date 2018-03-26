# g-ir-scanner
# Autogenerated from man page /usr/local/share/man/man1/g-ir-scanner.1
complete -c g-ir-scanner -l help --description 'Show help options.'
complete -c g-ir-scanner -l quiet --description 'If passed, do not print details of normal operation.'
complete -c g-ir-scanner -l warn-all --description 'Display warnings for public API which is not introspectable.'
complete -c g-ir-scanner -l warn-error --description 'Make warnings be fatal errors.'
complete -c g-ir-scanner -l format --description 'This parameters decides which the resulting format will be used.'
complete -c g-ir-scanner -l include --description 'Add the specified introspection dependency to the scanned namespace.'
complete -c g-ir-scanner -l include-uninstalled --description 'Add the specified introspection dependency to the scanned namespace.'
complete -c g-ir-scanner -l add-include-path --description 'Add a directory to the path which the scanner uses to find GIR files.'
complete -c g-ir-scanner -s i -l library --description 'Specifies a library that will be introspected.'
complete -c g-ir-scanner -s L -l library-path --description 'Include this directory when searching for a library.'
complete -c g-ir-scanner -o Idirectory --description 'Include this directory in the list of directories to be searched for header f…'
complete -c g-ir-scanner -s n -l namespace --description 'The namespace name.'
complete -c g-ir-scanner -l no-libtool --description 'Disable usage of libtool for compiling stub introspection binary.'
complete -c g-ir-scanner -l libtool --description 'Full path to libtool executable.   Typically used for Automake systems.'
complete -c g-ir-scanner -l nsversion --description 'The namespace version.  For instance 1. 0.'
complete -c g-ir-scanner -s p -l program --description 'Specifies a binary that will be introspected.'
complete -c g-ir-scanner -l program-arg --description 'Additional argument to pass to program for introspection.'
complete -c g-ir-scanner -l identifier-prefix --description 'This option may be specified multiple times.'
complete -c g-ir-scanner -l symbol-prefix --description 'This option may be specified multiple times.'
complete -c g-ir-scanner -l accept-unprefixed --description 'If specified, the scanner will accept identifiers and symbols which do not ma…'
complete -c g-ir-scanner -l output --description 'Name of the file to output.  Normally namespace + format extension.'
complete -c g-ir-scanner -l pkg --description 'List of pkg-config packages to get compiler and linker flags from.'
complete -c g-ir-scanner -l pkg-export --description 'List of pkg-config packages that are provided by the generated gir.'
complete -c g-ir-scanner -l verbose --description 'Be verbose, include some debugging information.'

