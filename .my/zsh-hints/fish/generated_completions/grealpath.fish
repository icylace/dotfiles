# grealpath
# Autogenerated from man page /usr/local/share/man/man1/grealpath.1
complete -c grealpath -s e -l canonicalize-existing --description 'all components of the path must exist.'
complete -c grealpath -s m -l canonicalize-missing --description 'no path components need exist or be a directory.'
complete -c grealpath -s L -l logical --description 'resolve \'. \' components before symlinks.'
complete -c grealpath -s P -l physical --description 'resolve symlinks as encountered (default).'
complete -c grealpath -s q -l quiet --description 'suppress most error messages.'
complete -c grealpath -l relative-to --description 'print the resolved path relative to FILE.'
complete -c grealpath -l relative-base --description 'print absolute paths unless paths below FILE.'
complete -c grealpath -s s -l strip -l no-symlinks --description 'don\'t expand symlinks.'
complete -c grealpath -s z -l zero --description 'end each output line with NUL, not newline.'
complete -c grealpath -l help --description 'display this help and exit.'
complete -c grealpath -l version --description 'output version information and exit AUTHOR Written by Padraig Brady.'

