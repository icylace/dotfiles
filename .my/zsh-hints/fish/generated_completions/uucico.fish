# uucico
# Autogenerated from man page /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/share/man/man8/uucico.8
complete -c uucico -o r1 -l master --description 'Start in master mode (call out to a system); implied by  -s,  --system, or  -…'
complete -c uucico -o r0 -l slave --description 'Start in slave mode.   This is the default.'
complete -c uucico -s s -l system --description 'Call the named system.'
complete -c uucico -s S --description 'Call the named system, ignoring any required wait.'
complete -c uucico -s f -l force --description 'Ignore any required wait for any systems to be called.'
complete -c uucico -s l -l prompt --description 'Prompt for login name and password using "login: " and "Password:".'
complete -c uucico -s p -l port --description 'Specify a port to call out on or to listen to.'
complete -c uucico -s e -l loop --description 'Enter endless loop of login/password prompts and slave mode daemon execution.'
complete -c uucico -s w -l wait --description 'After calling out (to a particular system when  -s,  --system, or   -S is spe…'
complete -c uucico -s q -l nouuxqt --description 'Do not start the  uuxqt (8) daemon when finished.'
complete -c uucico -s c -l quiet --description 'If no calls are permitted at this time, then don\'t make the call, but also do…'
complete -c uucico -s C -l ifwork --description 'Only call the system named by  -s,  --system or  -S if there is work for that…'
complete -c uucico -s D -l nodetach --description 'Do not detach from the controlling terminal.'
complete -c uucico -s u -l login --description 'Set the login name to use instead of that of the invoking user.'
complete -c uucico -s z -l try-next --description 'If a call fails after the remote system is reached, try the next alternate ra…'
complete -c uucico -s i -l stdin --description 'Set the type of port to use when using standard input.'
complete -c uucico -s x -s X -l debug --description 'Turn on particular debugging types.'
complete -c uucico -s I -l config --description 'Set configuration file to use.'
complete -c uucico -s v -l version --description 'Report version information and exit.'
complete -c uucico -s r --description 'option).'
complete -c uucico -o 'S.' --description 'If no system is specified, call any system for which work is waiting to be do…'
complete -c uucico -o 'f.' --description '.'
complete -c uucico -l 'loop.' --description '.'
complete -c uucico -o iTLI --description 'causes uucico to use TLI calls to perform I/O.'
complete -c uucico -l help --description 'Print a help message and exit.'
