# gsort
# Autogenerated from man page /usr/local/share/man/man1/gsort.1
complete -c gsort -s b -l ignore-leading-blanks --description 'ignore leading blanks.'
complete -c gsort -s d -l dictionary-order --description 'consider only blanks and alphanumeric characters.'
complete -c gsort -s f -l ignore-case --description 'fold lower case to upper case characters.'
complete -c gsort -s g -l general-numeric-sort --description 'compare according to general numerical value.'
complete -c gsort -s i -l ignore-nonprinting --description 'consider only printable characters.'
complete -c gsort -s M -l month-sort --description 'compare (unknown) < \'JAN\' < .  < \'DEC\'.'
complete -c gsort -s h -l human-numeric-sort --description 'compare human readable numbers (e. g. , 2K 1G).'
complete -c gsort -s n -l numeric-sort --description 'compare according to string numerical value.'
complete -c gsort -s R -l random-sort --description 'shuffle, but group identical keys.   See shuf(1).'
complete -c gsort -l random-source --description 'get random bytes from FILE.'
complete -c gsort -s r -l reverse --description 'reverse the result of comparisons.'
complete -c gsort -l sort --description 'sort according to WORD: general-numeric -g, human-numeric -h, month -M, numer…'
complete -c gsort -s V -l version-sort --description 'natural sort of (version) numbers within text . PP Other options:.'
complete -c gsort -l batch-size --description 'merge at most NMERGE inputs at once; for more use temp files.'
complete -c gsort -s c -l check -l check --description 'check for sorted input; do not sort.'
complete -c gsort -s C --description 'like -c, but do not report first bad line.'
complete -c gsort -l compress-program --description 'compress temporaries with PROG; decompress them with PROG -d.'
complete -c gsort -l debug --description 'annotate the part of the line used to sort, and warn about questionable usage…'
complete -c gsort -l files0-from --description 'read input from the files specified by NUL-terminated names in file F; If F i…'
complete -c gsort -s k -l key --description 'sort via a key; KEYDEF gives location and type.'
complete -c gsort -s m -l merge --description 'merge already sorted files; do not sort.'
complete -c gsort -s o -l output --description 'write result to FILE instead of standard output.'
complete -c gsort -s s -l stable --description 'stabilize sort by disabling last-resort comparison.'
complete -c gsort -s S -l buffer-size --description 'use SIZE for main memory buffer.'
complete -c gsort -s t -l field-separator --description 'use SEP instead of non-blank to blank transition.'
complete -c gsort -s T -l temporary-directory --description 'use DIR for temporaries, not $TMPDIR or \\,/tmp\\/; multiple options specify mu…'
complete -c gsort -l parallel --description 'change the number of sorts run concurrently to N.'
complete -c gsort -s u -l unique --description 'with -c, check for strict ordering; without -c, output only the first of an e…'
complete -c gsort -s z -l zero-terminated --description 'line delimiter is NUL, not newline.'
complete -c gsort -l help --description 'display this help and exit.'
complete -c gsort -l version --description 'output version information and exit.'

